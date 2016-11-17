alias mm-stop='sudo systemctl stop ModemManager'
alias mm-start='sudo systemctl start ModemManager'
alias mm-restart='sudo systemctl daemon-reload && sudo systemctl restart ModemManager'
alias mm-log='journalctl -fu ModemManager | raffaello -p modemmanager'
