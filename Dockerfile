FROM node:14-alpine as build
COPY . /app/
WORKDIR /app
RUN npm config set registry http://registry.npm.taobao.org/
RUN npm install && npm run build

FROM nginx:alpine

WORKDIR /usr/share/nginx/html
#COPY dist/ .
COPY --from=build /app/dist/ .

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["nginx","-g","daemon off;"]
