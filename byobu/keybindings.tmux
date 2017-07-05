#unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
set -g mode-keys vi
bind a send-prefix

# Custom
bind-key -n M-o display-panes \; split-window -v -c "#{pane_current_path}"
bind-key -n M-e display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n M-x kill-pane

# Switch panes
bind-key -n M-h select-pane -L
bind-key -n M-j select-pane -D
bind-key -n M-k select-pane -U
bind-key -n M-l select-pane -R

# Switch windows
bind -n M-p previous-window
bind -n M-n next-window

# Copy/Paste vim-like
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

unbind-key -n F2
bind-key -n M-c new-window -c "#{pane_current_path}" \; rename-window "-"

# Enable Search mode
#unbind-key -n F7
bind-key -n M-c new-window -c "#{pane_current_path}" \; rename-window "-"

bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'
bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"
