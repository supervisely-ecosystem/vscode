FROM python:3.8

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN code-server --install-extension mikestead.dotenv
RUN code-server --install-extension mhutchie.git-graph
RUN code-server --install-extension github.github-vscode-theme
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ecmel.vscode-html-css
RUN code-server --install-extension ms-toolsai.jupyter
RUN code-server --install-extension yzhang.markdown-all-in-one
RUN code-server --install-extension ms-python.vscode-pylance
RUN code-server --install-extension twixes.pypi-assistant
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension formulahendry.terminal
RUN code-server --install-extension octref.vetur
RUN code-server --install-extension visualstudioexptteam.vscodeintellicode
RUN code-server --install-extension emmanuelbeziat.vscode-great-icons

RUN mkdir -p /root/.local/share/code-server/User
COPY settings.json /root/.local/share/code-server/User/settings.json

EXPOSE 8080
CMD ["code-server", "--allow-http", "--no-auth", "", "--bind-addr", "0.0.0.0:8080"]
# "--user-data-dir", "~/.vscode"