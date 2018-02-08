FROM node:9.4.0-alpine

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY package.json .
RUN npm install

EXPOSE 3000

COPY index.js .

CMD node index.js