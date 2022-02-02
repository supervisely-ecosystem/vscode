FROM python:3.8

RUN curl -fsSL https://code-server.dev/install.sh | sh

# COPY product.json /usr/lib/code-server/vendor/modules/code-oss-dev/product.json

RUN mkdir -p /data/user-data/User
COPY settings.json /data/user-data/User/settings.json

RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json

RUN mkdir -p /root/.local/share/code-server
COPY .vscode/extensions /root/.local/share/code-server/extensions
# RUN code-server --install-extension ms-python.python

# RUN pip install 'python-language-server[all]'
# Pyright from marketplace

# RUN code-server --install-extension mhutchie.git-graph
# RUN code-server --install-extension github.github-vscode-theme
# RUN code-server --install-extension ms-python.python
# RUN code-server --install-extension ecmel.vscode-html-css
# RUN code-server --install-extension ms-toolsai.jupyter
# RUN code-server --install-extension yzhang.markdown-all-in-one
# RUN code-server --install-extension ms-python.vscode-pylance
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension formulahendry.terminal
# RUN code-server --install-extension octref.vetur
# RUN code-server --install-extension visualstudioexptteam.vscodeintellicode
# RUN code-server --install-extension emmanuelbeziat.vscode-great-icons


EXPOSE 8080
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080"]








# download extensions
# RUN code-server --install-extension mikestead.dotenv

# RUN curl -L -o /tmp/git-graph-release.vsix "https://github.com/mhutchie/vscode-git-graph/releases/download/v1.30.0/git-graph-1.30.0.vsix"
# RUN code-server --install-extension /tmp/git-graph-release.vsix

# RUN curl -L -o /tmp/ms-python-release.vsix "https://github.com/microsoft/vscode-python/releases/download/2021.12.1559732655/ms-python-release.vsix"
# RUN code-server --install-extension /tmp/ms-python-release.vsix






# RUN curl -L -o /tmp/ms-python-release.vsix "https://github.com/microsoft/vscode-python/releases/download/2021.12.1559732655/ms-python-release.vsix" && \
#     code-server --version && \ 
#     # Below line doesn't work due to a bug that always installs latest version... working around this with vsix file install
#     #code-server --install-extension ms-python.python@2020.5.86806 && \
#     code-server --install-extension /tmp/ms-python-release.vsix && \
#     code-server --list-extensions --show-versions

# Add pre-defined user settings for convenience
# COPY user_settings.yaml /home/coder/.local/share/code-server/User/settings.json



# [10:15:04] vscode-icons-team.vscode-icons 11.8.0 post-uninstall Unhandled Error: Error: ENOENT: no such file or directory, open '/data/user-data/User/settings.json'
# /data/user-data/User/settings.json

# RUN mkdir -p /root/.local/share/code-server
# COPY .vscode/extensions /root/.local/share/code-server/extensions
# RUN curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/formulahendry/vsextensions/terminal/0.0.10/vspackage | tar -xvf -f /extension
# RUN mv /extension /root/.local/share/code-server/extensions/formulahendry.terminal-0.0.10

# RUN code-server --install-extension mhutchie.git-graph
# RUN code-server --install-extension github.github-vscode-theme
# RUN code-server --install-extension ms-python.python
# RUN code-server --install-extension ecmel.vscode-html-css
# RUN code-server --install-extension ms-toolsai.jupyter
# RUN code-server --install-extension yzhang.markdown-all-in-one
# RUN code-server --install-extension ms-python.vscode-pylance
# RUN code-server --install-extension twixes.pypi-assistant
# RUN code-server --install-extension ms-python.python
# RUN code-server --install-extension formulahendry.terminal
# RUN code-server --install-extension octref.vetur
# RUN code-server --install-extension visualstudioexptteam.vscodeintellicode
# RUN code-server --install-extension emmanuelbeziat.vscode-great-icons


# RUN mkdir -p /root/.local/share/code-server/User
# COPY settings.json /root/.local/share/code-server/User/settings.json
