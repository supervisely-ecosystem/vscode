# vscode

#@TODO: Pyright
#@TODO: install plugins
#@TODO: expose multiple ports - use nginx



- vscode (local)
- vscode (web: _product.json, pyright, https://github.com/pappasam/jedi-language-server, )
- https://vscodium.com/
- https://www.tabnine.com/
- https://github.com/palantir/python-language-server
- https://github.com/python-lsp/python-lsp-server
- https://www.pydev.org/vscode/index.html
- https://github.com/python/mypy
- https://github.com/pappasam/jedi-language-server
- https://gist.github.com/raveenb/c0001484a79214c21785227d0688f57f





дву двух словах тебе надо добавить в докер файл
# Install nginx
RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get clean \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm /etc/nginx/sites-enabled/default
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
добавить в запуск nginx -g "daemon off;" (это в фореграунт, можешь просто nginx и vscode будет пердеть в консоль) и конфиг nginx-default.conf:
server {
    listen 8000;
    charset utf-8;

    location /vscode/ {
        proxy_pass http://localhost:5000/;

        proxy_set_header Host $http_host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $proxy_connection;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $proxy_x_forwarded_proto;
        proxy_set_header X-Forwarded-Ssl $proxy_x_forwarded_ssl;
        proxy_set_header X-Forwarded-Port $proxy_x_forwarded_port;
    }

    location / {
        proxy_pass http://localhost:6000/;
        
        proxy_set_header Host $http_host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $proxy_connection;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $proxy_x_forwarded_proto;
        proxy_set_header X-Forwarded-Ssl $proxy_x_forwarded_ssl;
        proxy_set_header X-Forwarded-Port $proxy_x_forwarded_port;
    }
}
ну и это будет делать localhost:8000/vscode -> localhost:5000 (vscode стартуй на порте 5000) и localhost:8000/ -> localhost:6000 (main.py стартуй на порте 6000)