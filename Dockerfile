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

COPY .vscode/manual_extensions /root/.local/share/code-server/extensions
# manual copy from local folder
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal

RUN mkdir -p /data/user-data/User
COPY settings.json /data/user-data/User/settings.json
RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json
COPY demo /demo

EXPOSE 8080
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "/demo"]