DST=".vscode"
if [ -d "$DST" ]; then
    echo "Directory with extensions already exists: $DST"
else
    SRC="/Users/maxim/.vscode"
    cp -R $SRC $DST
    echo "Directory extensions created: $DST"
fi

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1

# -p <host port>:<container port>
docker run --rm -it -p 3000:8080 supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 --entrypoint="" supervisely/vscode bash
