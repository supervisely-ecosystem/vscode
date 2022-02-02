# cp -a /Users/maxim/.vscode .vscode
docker build -t supervisely/vscode . && \

# -p <host port>:<container port>
# docker run --rm -it -p 3000:8080 supervisely/vscode
docker run --rm -it -p 3000:8080 --entrypoint="" supervisely/vscode bash


# code-server
# Using user-data-dir ~/.local/share/code-server
# root@e9476bdeba6b:/# cat ~/.config/code-server/config.yaml
# bind-addr: 127.0.0.1:8080
# auth: password
# password: b46323de299f1b500aaef381
# cert: false