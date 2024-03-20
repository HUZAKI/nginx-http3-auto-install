#!/bin/bash

sudo apt-get update 
sudo apt install build-essential binutils  gcc libpcre3-dev libssl-dev zlib1g-dev libperl-dev -y

cd /tmp/
wget https://nginx.org/download/nginx-1.25.4.tar.gz && tar xzvf nginx-1.25.4.tar.gz 
cd nginx-1.25.4



./configure \
	--user=nginx \
	--group=nginx \
	--prefix=/etc/nginx \
	--sbin-path=/usr/sbin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--pid-path=/var/run/nginx.pid \
	--lock-path=/var/run/nginx.lock \
	--http-client-body-temp-path=/var/cache/nginx/client_temp \
	--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
	--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
	--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
	--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
	--with-file-aio \
	--with-stream \
	--with-stream_ssl_module \
	--with-http_gzip_static_module \
	--with-http_stub_status_module \
	--with-http_ssl_module \
	--with-http_realip_module \
	--with-http_addition_module \
	--with-http_sub_module \
	--with-http_dav_module \
	--with-http_gunzip_module \
	--with-http_degradation_module \
	--with-http_perl_module \
	--with-debug \
	--with-http_v2_module \
	--without-http_uwsgi_module \
	--without-http_scgi_module \
	--without-mail_imap_module \
	--without-mail_smtp_module \
	--without-mail_pop3_module \
    --with-http_v3_module \
    --with-cc-opt="-I../boringssl/include" \
    --with-ld-opt="-L../boringssl/build/ssl \
                   -L../boringssl/build/crypto" 

sudo make 
sudo make install 

    service_file="/lib/systemd/system/nginx.service"

if [ -f "$service_file" ]; then
    echo "Файл nginx.service уже створенно."
    exit 1
fi

cat <<EOF | sudo tee "$service_file" > /dev/null
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

echo "Файл nginx.service успішно створено."
 
mkdir -p /var/cache/nginx/client_temp

cd /usr/sbin/

echo $PATH

echo 'export PATH=/usr/sbin/:$PATH' >> ~/.profile

source  ~/.profile

mkdir -p /etc/nginx/sites-enabled/

sudo mv ./conf/nginx.conf /etc/nginx/
sudo cp -f ./conf/http3.conf.example /etc/nginx/sites-enabled/
echo done
