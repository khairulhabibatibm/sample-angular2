FROM node:10 as node

WORKDIR /usr/src/app


COPY package*.json ./
COPY . .

RUN npm install

RUN npm run build --prod


FROM bitnami/nginx:latest

COPY --from=node /usr/src/app/dist /app

EXPOSE 8080