FROM node:latest
RUN apt-get update && apt-get install openjdk-8-jre-headless curl wget -y
COPY verification-server .
RUN curl https://api.github.com/repos/utwente-fmt/vercors/releases/latest | \
    grep "browser_download_url.*deb" | \
    cut -d '"' -f 4 | \
    xargs -n1 wget -O vercors.deb
RUN dpkg -i vercors.deb
CMD ["npm", "start"]
