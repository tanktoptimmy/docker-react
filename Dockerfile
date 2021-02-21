FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN yarn

COPY . .

RUN yarn run build

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html
