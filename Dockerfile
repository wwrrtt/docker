FROM nginx:latest
EXPOSE 80
USER root

COPY web.zip /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json ./
COPY entrypoint.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget -O temp.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip &&\
    unzip temp.zip xray geoip.dat geosite.dat &&\
    rm -f temp.zip &&\
    chmod a+x xray entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
