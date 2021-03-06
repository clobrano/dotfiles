#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
alias binit='source ~/.bashrc'
alias cppcheck_all='raffaello --file=cppcheck.cfg --- cppcheck --enable=all --inconclusive'
alias dmesg-w='dmesg -wH | raffaello -p dmesg'
alias installedbyme="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias ll='ls -l'
alias memusage='du -h -t 10M -d 1'
alias dirusage='du -d1 -t10M -h 2>/dev/null | sort -hr'
alias psaux='ps aux | grep'
alias soundindicatorback='gsettings set com.canonical.indicator.sound visible true'
alias xcopy='xclip'
alias xpaste='xclip -o'

alias usif0='sudo minicom -D /dev/ttyS0'
alias usif1='sudo minicom -D /dev/ttyS1'
alias pusif0='sudo pynicom --port=/dev/ttyS0'
alias pusif1='sudo pynicom --port /dev/ttyS1'

alias v='gvim -geom 190x40'
alias vm='gvim -c Monokai'
alias vg='gvim -c Gruvbox'
alias nvm='nvim -c "Monokai"'
alias nvd='nvim -c "colorscheme onedark"'
alias nvg='nvim -c Gruvbox'
alias nvc='nvim -c "Papercolor"'
alias nvp='nvim -c "colorscheme pencil"'

alias pw='pwd'
alias mkd='mkdir -p'

alias wiresharkqmi='wireshark -X lua_script:qmi_dissector_gen.lua'

alias rn='ranger'

alias f='fuz'
alias fv='fuz -e gvim'
alias fn='fuz -e gvim -d ~/Dropbox/Notes/'
alias fnn='fuz -e gvim -d /mnt/4EBCC563BCC545E5/Store/Notes/'
