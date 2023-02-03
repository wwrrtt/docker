FROM nginx:latest
EXPOSE 80
USER root

COPY web.zip /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json ./
COPY entrypoint.sh ./

RUN  chmod a+x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
