FROM node:12

RUN apt-get -q update && \
    apt-get -qy install openjdk-8-jre-headless curl wget && \
    rm -r /var/lib/apt/lists/*

COPY verification-server .

RUN curl https://api.github.com/repos/utwente-fmt/vercors/releases/latest | \
    grep "browser_download_url.*deb" | \
    cut -d '"' -f 4 | \
    xargs -n1 wget -q -O vercors.deb && \
    dpkg -i vercors.deb && \
    rm vercors.deb

CMD ["npm", "start"]
