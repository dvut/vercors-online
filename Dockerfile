FROM node:latest
RUN apt-get update && apt-get install openjdk-8-jre-headless jq curl wget -y
COPY verification-server .
RUN curl https://api.github.com/repos/utwente-fmt/vercors/releases/latest | \
    jq -r '.assets[] | select(.content_type == "application/vnd.debian.binary-package") | .browser_download_url' | \
    xargs -n1 wget -qO vercors.deb -
RUN dpkg -i vercors.deb
CMD ["npm", "start"]
