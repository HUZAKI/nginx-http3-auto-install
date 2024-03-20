# nginx-http3-auto-install

Скомпілюйте та встановіть NGINX із вихідного коду з додатковими функціями, модулями та патчами.

## Сумісність

- Debian 9 і новіші версії
- Ubuntu 18.04 і новіших версій



### Які  додаткові модулі/функції будуть в майбутньому 

- [LibreSSL from source](http://www.libressl.org/) (CHACHA20, ALPN for HTTP/2, HTTP/3, X25519, P-521) >  ✔️
- [ngx_http_v3](https://nginx.org/ru/docs/http/ngx_http_v3_module.html): модуль ngx_http_v3_module > ✔️
- [ngx_pagespeed](https://github.com/pagespeed/ngx_pagespeed): модуль продуктивності Google > ❌
- [ngx_brotli](https://github.com/google/ngx_brotli): алгоритм стиснення Brotli > ❌
- [ngx_headers_more](https://github.com/openresty/headers-more-nginx-module): спеціальні заголовки HTTP > ❌
- [ngx_cache_purge](https://github.com/FRiCKLE/ngx_cache_purge): видалення вмісту з кешів FastCGI, проксі, SCGI та uWSGI > ❌
- [ngx-fancyindex](https://github.com/aperezdc/ngx-fancyindex) : фантастичні списки файлів > ❌
- [nginx-dav-ext-module](https://github.com/arut/nginx-dav-ext-module): підтримка PROPFIND WebDAV, OPTIONS, LOCK, UNLOCK) > ❌
- [nginx-module-vts](https://github.com/vozlt/nginx-module-vts): модуль стану трафіку віртуального хосту Nginx ([інструкції зі встановлення](https://github.com/vozlt/nginx-module-vts?tab=readme-ov-file#installation)) > ❌
- [ModSecurity-nginx](https://github.com/SpiderLabs/ModSecurity-nginx): роз’єм для [ModSecurity](https://github.com/SpiderLabs/ModSecurity) брандмауера веб-програми з відкритим кодом (WAF) > ❌
- [testcookie-nginx-module](https://github.com/kyprizel/testcookie-nginx-module): простий модуль пом'якшення роботів за допомогою запиту/відповіді на основі файлів cookie ([приклад конфігурації](https://github.com/) kyprizel/testcookie-nginx-module#example-configuration)) > ❌
- [lua-nginx-module](https://github.com/openresty/lua-nginx-module): розширте NGINX за допомогою Lua. Використання [luajit2](https://github.com/openresty/luajit2) (гілка LuaJIT, яку підтримує OpenResty) і [ngx_devel_kit](https://github.com/simplresty/ngx_devel_kit) (Набір для розробки Nginx (NDK)) > ❌
- [nginx_substitutions_filter](https://github.com/yaoweibin/ngx_http_substitutions_filter_module): регулярні вирази та фіксовані підстановки рядків для nginx > ❌
- [Модуль RTMP](https://github.com/arut/nginx-rtmp-module) (сервер потокової передачі медіа на основі NGINX) > ❌
- [nginx-ultimate-bad-bot-blocker](https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker): блокувальник поганих ботів і агентів користувачів, блокувальник спаму, анти-DDOS, поганий Блокувальник IP-адрес і блокувальник детекторів тем Wordpress > ❌

#### Модулі кешу

- [redis2-nginx-module](https://github.com/openresty/redis2-nginx-module) : висхідний модуль Nginx для протоколу Redis 2.0 > ❌
- [ngx_http_redis](https://www.nginx.com/resources/wiki/modules/redis/): Модуль redis HTTP nginx для кешування за допомогою redis > ❌
- [srcache-nginx-module](https://github.com/openresty/srcache-nginx-module): прозорий макет кешування на основі підзапитів для довільних місць розташування nginx > ❌
- [set-misc-nginx-module](https://github.com/openresty/set-misc-nginx-module): різноманітні директиви set_xxx додано до модуля перезапису nginx (md5/sha1, цитування sql/json та багато інших). більше) > ❌
- [echo-nginx-module](https://github.com/openresty/echo-nginx-module) : додає Nginx "echo", "sleep", "time", "exec" та інші переваги оболонки. конфігураційний файл. > ❌
## Використання

Просто завантажте та виконайте сценарій:

```sh
git clone https://github.com/HUZAKI/nginx-http3-auto-install.git
cd nginx-http3-auto-install
bash install.sh
```

## LICENSE

GPL v3.0
