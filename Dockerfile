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
# RUN pip3 install supervisely==6.7.0
RUN pip3 install https://files.pythonhosted.org/packages/9f/37/f196767656c48b99c274294477da4807f460d6d2360e3dd1c9881b80eb1c/supervisely-6.7.0-py3-none-any.whl

#############################################################################
##### Configuration
#############################################################################

COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# manual copy from local folder
COPY .vscode_for_docker/manual_extensions /root/.local/share/code-server/extensions
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal

RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json
COPY entrypoint.sh /entrypoint.sh  

RUN echo 'alias ll="ls -al"' >> ~/.bashrc 

COPY demo /workdir

ENTRYPOINT ["/entrypoint.sh"]