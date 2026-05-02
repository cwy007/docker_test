# build stage
FROM node:latest as build-stage

WORKDIR /app

COPY package.json ./

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install

COPY . .

RUN npm run build

# production stage
FROM node:latest as production-stage

COPY --from=build-stage /app/dist ./dist
COPY --from=build-stage /app/package.json ./package.json

WORKDIR /app

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install --production

EXPOSE 3000

CMD ["node", "./dist/main.js"]
