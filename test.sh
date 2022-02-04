# [ -d "./demo/venv" ] && rm -rf ./demo/venv
# [ -d "./demo/__pycache__" ] && rm -rf ./demo/__pycache__

# docker build --progress=plain -t supervisely/vscode:0.0.1 . && \
# docker push supervisely/vscode:0.0.1 

# docker run --rm -it -p 8000:8000 \
#     --env USER_LOGIN=max \
#     --env TASK_ID=777 \
#     --entrypoint="" \
#     supervisely/vscode:0.0.1 bash

docker run --rm -it -p 8000:8000 \
    --env USER_LOGIN=max \
    --env TASK_ID=777 \
    supervisely/vscode:0.0.1

# -v $PWD/demo:/workdir \

#@TODO: 

# teamfiles-run from vscode from folder (os like dev environment - files + apps)
# team files right click on agent gile - auto select correct agent in advanced settings (run app modal window)
# todo: create startpage
# how to save session configuration and restart it later?
# modal window - simplify github integration
# github tab - try connect github account (doesnt work)
# if remove agent tocken from app container env
# dont allow to run some apps on our agents in community