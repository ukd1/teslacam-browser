FROM node:current-alpine
RUN mkdir -p /media/TeslaCam
WORKDIR /usr/src/teslacam-browser
COPY . .
RUN npm install
ENTRYPOINT node server.js /media/TeslaCam
EXPOSE 8088
