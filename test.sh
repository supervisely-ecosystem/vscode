[ -d "./demo/venv" ] && rm -rf ./demo/venv
[ -d "./demo/__pycache__" ] && rm -rf ./demo/__pycache__

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 && \

# docker run --rm -it --entrypoint="" supervisely/vscode:0.0.1 bash
# -p <host port>:<container port>
docker run --rm -it \
    -p 8000:8000 \
    # -v $PWD/demo:/workdir \
    supervisely/vscode:0.0.1

#@TODO: 
# vscode on /, app on /app (- / - return 200) + change uvicorn config
# prepare venv
# launch.json - create venv

# modal window - empty git repo
# git ssh token for single repo
# how to github login in terminal
# vscode "github login" plugin https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github