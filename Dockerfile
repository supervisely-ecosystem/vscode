FROM python:3.8

RUN curl -fsSL https://code-server.dev/install.sh | sh


# https://coder.com/docs/code-server/latest/FAQ#how-can-i-request-an-extension-thats-missing-from-the-marketplace
# VSCode extensions
# RUN mkdir -p /root/.local/share/code-server
# RUN echo 123
# COPY ./.vscode /root/.local/share/code-server

RUN code-server --install-extension ms-python.python --force \
                --install-extension 

EXPOSE 3000
# CMD ["code-server", "--allow-http", "--no-auth", "", "--bind-addr", "localhost:3000"]
# "--user-data-dir", "~/.vscode"