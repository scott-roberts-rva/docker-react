FROM node:alpine
WORKDIR /usr/app
COPY package*.json /usr/app
RUN npm install
COPY . /usr/app
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html



