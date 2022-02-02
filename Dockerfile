FROM python:3.8

RUN curl -fsSL https://code-server.dev/install.sh | sh


# https://coder.com/docs/code-server/latest/FAQ#how-can-i-request-an-extension-thats-missing-from-the-marketplace
# VSCode extensions
RUN mkdir -p /root/.local/share/code-server
COPY /Users/maxim/.vscode /root/.local/share/code-server

CMD ["code-server", "--allow-http", "--no-auth", "", "--user-data-dir", "~/.vscode"]