[ -d "./demo/venv" ] && rm -rf ./demo/venv
[ -d "./demo/__pycache__" ] && rm -rf ./demo/__pycache__

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 && \

# docker run --rm -it --entrypoint="" supervisely/vscode:0.0.1 bash
# -p <host port>:<container port>
# docker run --rm -it \
#     -p 8000:8000 \
#     --entrypoint="" \
#     supervisely/vscode:0.0.1 bash



docker run --rm -it -p 8000:8000 supervisely/vscode:0.0.1
# -v $PWD/demo:/workdir \

#@TODO: 
# modal window - empty git repo
# git ssh token for single repo
# how to github login in terminal
# vscode "github login" plugin https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github