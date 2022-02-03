docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 && \

# -p <host port>:<container port>
docker run --rm -it -p 3000:8000 -v $PWD/demo:/workdir supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 -v $PWD/demo:/demo supervisely/vscode:0.0.1
# docker run --rm -it -p 3000:8080 -v $PWD/demo:/demo --entrypoint="" supervisely/vscode:0.0.1 bash
