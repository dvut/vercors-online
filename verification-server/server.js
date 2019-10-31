const PORT = 1234;

const LANGUAGES = {
  'java': '.java',
  'pvl': '.pvl',
  'c': '.c'
};

const WSServer = require('websocket').server;
const http = require('http');
const fs = require('fs');
const uuid = require('uuid/v1');
const child_process = require('child_process');

const server = http.createServer((req, res) => {
  fs.readFile('index.html', (e, data) => {
    res.setHeader('Content-Type', 'text/html');
    res.end(data);
  });
});

server.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});

const wsServer = new WSServer({
  httpServer: server,
  maxReceivedFrameSize: 10 * 1024 * 1024,
  maxReceivedMessageSize: 10 * 1024 * 1024,
  // TODO: investigate the below option
  autoAcceptConnections: false
});

wsServer.on('request', (req) => {
  const conn = req.accept('vercors', req.origin);

  conn.on('message', function(rawMessage) {
    if(rawMessage.type === 'utf8') {
      try {
        const message = JSON.parse(rawMessage.utf8Data);
        if(message.type === undefined) return;

        switch(message.type) {
          case 'submit':
            if(message.data === undefined) return;
            if(message.lang === undefined || LANGUAGES[message.lang] === undefined) return;
            submit(conn, message.lang, message.data);
            break;
        }
      } catch(e) {
        console.log(e);
      }
    }
  });

  conn.on('close', function() {

  });
});

function submit(conn, lang, data) {
  const id = uuid();
  conn.sendUTF(JSON.stringify({'type': 'accept', 'id': id}));
  const file = '/tmp/' + id + LANGUAGES[lang];

  fs.writeFile(file, data, (err) => {
    if(err) {
      conn.sendUTF(JSON.stringify({'type': 'finished', 'id': id, 'error': true, 'errorDescription': e}));
    }

    const p = child_process.spawn('/home/pieter/vercors/bin/vct', ['--silicon', file, '--progress'], {
      detached: true,
    });

    p.stdout.on('data', (data) => {
      conn.sendUTF(JSON.stringify({'type': 'stdout', 'id': id, 'data': data.toString()}));
    });

    p.stderr.on('data', (data) => {
      conn.sendUTF(JSON.stringify({'type': 'stderr', 'id': id, 'data': data.toString()}));
    });

    p.on('close', (code) => {
      conn.sendUTF(JSON.stringify({'type': 'finished', 'id': id, 'error': false, 'exitCode': code}));

      fs.unlink(file, (err) => {
        // Nothing to do on error
      })
    });
  });
}
