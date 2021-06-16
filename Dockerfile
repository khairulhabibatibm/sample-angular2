FROM node:10 as node

WORKDIR /usr/src/app


COPY package*.json ./
COPY . .

RUN npm install

RUN npm run build --prod


FROM nginx

COPY --from=node /usr/src/app/dist /usr/share/nginx/html

EXPOSE 8080 443