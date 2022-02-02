# cp -a /Users/maxim/.vscode .vscode
docker build -t supervisely/vscode . && \

# -p <container port>:<host port>
docker run --rm -it -p 8080:7777 supervisely/vscode


# code-server
# Using user-data-dir ~/.local/share/code-server
# root@e9476bdeba6b:/# cat ~/.config/code-server/config.yaml
# bind-addr: 127.0.0.1:8080
# auth: password
# password: b46323de299f1b500aaef381
# cert: false