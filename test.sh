# [ -d "./demo/venv" ] && rm -rf ./demo/venv
# [ -d "./demo/__pycache__" ] && rm -rf ./demo/__pycache__

docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
docker push supervisely/vscode:0.0.1 

# docker run --rm -it -p 8000:8000 \
#     --env USER_LOGIN=max \
#     --env TASK_ID=777 \
#     --entrypoint="" \
#     supervisely/vscode:0.0.1 bash

# docker run --rm -it -p 8000:8000 \
#     --env USER_LOGIN=max \
#     --env TASK_ID=777 \
#     supervisely/vscode:0.0.1

# -v $PWD/demo:/workdir \



#@TODO: 
# - use base py sdk
# -  