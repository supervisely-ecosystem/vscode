# SETTINGS=settings.json
# if [ -f "$SETTINGS" ]; then
#     echo "$SETTINGS exists."
# else 
#     echo "$SETTINGS does not exist."
#     cp -R "/Users/maxim/Library/Application Support/Code/User/settings.json" "settings.json"
# fi


# PLUGINS=".vscode"
# if [ -d "$PLUGINS" ]; then
#     echo "Directory with extensions already exists: $PLUGINS"
# else
#     SRC="/Users/maxim/.vscode"
#     cp -R $SRC $PLUGINS
#     echo "Directory extensions created: $PLUGINS"
# fi