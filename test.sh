SETTINGS=settings.json
if [ -f "$SETTINGS" ]; then
    echo "$SETTINGS exists."
else 
    echo "$SETTINGS does not exist."
    cp -R "/Users/maxim/Library/Application Support/Code/User/settings.json" "settings.json"
fi


PLUGINS=".vscode"
if [ -d "$PLUGINS" ]; then
    echo "Directory with extensions already exists: $PLUGINS"
else
    SRC="/Users/maxim/.vscode"
    cp -R $SRC $PLUGINS
    echo "Directory extensions created: $PLUGINS"
fi

#@TODO: Pyright
#@TODO: install plugins

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 && \

# -p <host port>:<container port>
docker run --rm -it -p 3000:8080 supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 --entrypoint="" supervisely/vscode bash


#@TODO: https://github.com/palantir/python-language-server

# docker run -it --init -p 4000:4000 gitpod/openvscode-server


# https://www.reddit.com/r/linux/comments/k0s8qw/vs_code_developers_prevent_running_the_new/
# https://github.com/microsoft/pyright



