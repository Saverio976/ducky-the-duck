#!/bin/bash

curl -fLo '/tmp/yadm' 'https://github.com/TheLocehiliosan/yadm/raw/master/yadm'

chmod +x '/tmp/yadm'

/tmp/yadm clone 'https://github.com/Saverio976/dotfiles.git'

echo "run \"$HOME/.config/yadm/bootstrap\""
