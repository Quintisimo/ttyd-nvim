#!/bin/ash
# shellcheck shell=ash

ttyd.nerd \
  -W \
  -t fontFamily="JetBrains" \
  -t 'theme={"background": "rgb(30, 30, 46)"}' \
  -t disableLeaveAlert=true \
  ./keep-nvim-open.sh