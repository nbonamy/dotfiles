#!/bin/bash
echo Pulling latest version
cd "$(dirname "$0")"
git pull
source install.sh
source .lscolors
