# 构建
FROM node:12 as build
COPY . /web
WORKDIR /web
RUN npm install --production --registry=https://registry.npm.taobao.org && npm run build

# 部署 
FROM nginx
COPY --from=build /web/build/* /webs/web_hook/
COPY ./web/web_hook.conf /etc/nginx/conf.d/
RUN nginx