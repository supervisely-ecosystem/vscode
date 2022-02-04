DIR="venv"
if [ -d "$DIR" ]; then
    echo "VENV already exists, will be removed"
    rm -rf venv
fi

echo "VENV will be created"
python3 -m venv $DIR
source venv/bin/activate
pip3 install -r requirements.txt
# deactivate