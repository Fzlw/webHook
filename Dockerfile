# 构建
FROM node:15.14 as build
COPY . /web
WORKDIR /web
RUN "npm install --registry=https://registry.npm.taobao.org && npm run build"

# 部署
FROM nginx:1.19.9
COPY --from=build /web/build/* /webs/web_hook
COPY --from=build /web/web_hook.conf /etc/nginx/conf.d/
RUN "nginx"