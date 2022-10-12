FROM python:3.8

#############################################################################
##### Install code-server
#############################################################################

RUN curl -fsSL https://code-server.dev/install.sh | sh
# COPY product.json /usr/lib/code-server/vendor/modules/code-oss-dev/product.json

# RUN mkdir -p /root/.local/share/code-server
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension mhutchie.git-graph
RUN code-server --install-extension github.github-vscode-theme
RUN code-server --install-extension ecmel.vscode-html-css
RUN code-server --install-extension yzhang.markdown-all-in-one
RUN code-server --install-extension octref.vetur
RUN code-server --install-extension emmanuelbeziat.vscode-great-icons
RUN code-server --install-extension ms-pyright.pyright
# already installed
# RUN code-server --install-extension ms-toolsai.jupyter
# not supported
# RUN code-server --install-extension ms-python.vscode-pylance
# RUN code-server --install-extension visualstudioexptteam.vscodeintellicode


#############################################################################
##### NGinx
#############################################################################

RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get clean \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
RUN rm /etc/nginx/sites-enabled/default

#############################################################################
##### OpenCV and Supervisely with dependencies
#############################################################################

RUN apt-get install -y python3-opencv
RUN pip3 install virtualenv 
RUN pip3 install supervisely==6.7.0
# RUN pip3 install https://files.pythonhosted.org/packages/9f/37/f196767656c48b99c274294477da4807f460d6d2360e3dd1c9881b80eb1c/supervisely-6.7.0-py3-none-any.whl

#############################################################################
##### Demo project
#############################################################################

RUN mkdir -p /workdir
COPY demo/requirements.txt /workdir/requirements.txt
COPY demo/prepare_venv.sh /workdir/prepare_venv.sh
COPY init_terminal.sh /workdir/init_terminal.sh
WORKDIR /workdir
RUN ./prepare_venv.sh

#############################################################################
##### Configuration
#############################################################################

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts
# RUN touch /root/.ssh/known_hosts && ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY demo /workdir

COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# manual copy from local folder
COPY .vscode_for_docker/manual_extensions /root/.local/share/code-server/extensions
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal

RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json
COPY entrypoint.sh /entrypoint.sh  

# color terminal
RUN echo 'export LS_OPTIONS="--color=auto"' >> ~/.bashrc
# RUN echo 'eval "$(dircolors)"' >> ~/.bashrc
RUN echo 'alias ls="ls $LS_OPTIONS"' >> ~/.bashrc
RUN echo 'alias ll="ls $LS_OPTIONS -l"' >> ~/.bashrc
RUN echo 'alias l="ls $LS_OPTIONS -lA"' >> ~/.bashrc

run echo 'if [[ -n $SH_INIT_COMMAND ]]; then \
    echo "Running: $SH_INIT_COMMAND" \
    eval "$SH_INIT_COMMAND" \
fi' >> ~/.bashrc


ENTRYPOINT ["/entrypoint.sh"]
