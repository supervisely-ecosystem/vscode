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

# already installed
# RUN code-server --install-extension ms-toolsai.jupyter

# not supported
# RUN code-server --install-extension ms-python.vscode-pylance
# RUN code-server --install-extension visualstudioexptteam.vscodeintellicode

# manual copy from local folder
COPY .vscode/manual_extensions /root/.local/share/code-server/extensions
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal

RUN mkdir -p /data/user-data/User
COPY settings.json /data/user-data/User/settings.json

RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json


#############################################################################
##### OpenCV and Supervisely with dependencies
#############################################################################

# RUN apt-get update
# RUN apt-get install -y libopencv-dev python3-opencv
# # RUN pip install opencv-python==4.5.5.62
# RUN pip install supervisely==6.6.3

EXPOSE 8080
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080"]