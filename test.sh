# SETTINGS=settings.json
# if [ -f "$SETTINGS" ]; then
#     echo "$SETTINGS exists."
# else 
#     echo "$SETTINGS does not exist."
#     cp -R "/Users/maxim/Library/Application Support/Code/User/settings.json" "settings.json"
# fi


# PLUGINS=".vscode"
# if [ -d "$PLUGINS" ]; then
#     echo "Directory with extensions already exists: $PLUGINS"
# else
#     SRC="/Users/maxim/.vscode"
#     cp -R $SRC $PLUGINS
#     echo "Directory extensions created: $PLUGINS"
# fi

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 && \
# settings does not work
# -p <host port>:<container port>
# docker run --rm -it -p 3000:5000 -v $PWD:/workdir supervisely/vscode:0.0.1
docker run --rm -it -p 3000:8000 -v $PWD:/workdir supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 -v $PWD/demo:/demo supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 -v $PWD/demo:/demo --entrypoint="" supervisely/vscode:0.0.1 bash




