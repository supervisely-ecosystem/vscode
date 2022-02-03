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
##### OpenCV and Supervisely with dependencies
#############################################################################

RUN apt-get update
RUN apt-get install -y python3-opencv
RUN pip3 install supervisely==6.6.3

# Install nginx
RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get clean \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
RUN rm /etc/nginx/sites-enabled/default
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# manual copy from local folder
COPY .vscode_for_docker/manual_extensions /root/.local/share/code-server/extensions
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal
RUN mkdir -p /data/user-data/User
COPY settings.json /data/user-data/User/settings.json
RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json
# COPY demo /demo

# EXPOSE 8080

ENTRYPOINT ["/workdir/entrypoint.sh"]
# CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "/workdir"]