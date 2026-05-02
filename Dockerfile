FROM node:latest

ENV NODE_ENV=production

WORKDIR /app

COPY . .

RUN npm config set registry https://registry.npmjs.org/

RUN npm install -g http-server

EXPOSE 8080

CMD ["http-server", "-p", "8080"]
