unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix

# Custom
bind-key -n M-o display-panes \; split-window -v -c "#{pane_current_path}"
bind-key -n M-e display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n M-k kill-pane
unbind-key -n F2
bind-key -n M-n new-window -c "#{pane_current_path}" \; rename-window "-"

# move x clipboard into tmux paste buffer
bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"
# move tmux copy buffer into x clipboard (select, then press y)
bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'
