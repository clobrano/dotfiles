#/usr/bin/bash


sudo apt install -y libgtk-3-dev gtk-3-examples meson sassc

gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true

# update-alternatives --install /usr/share/gnome-shell/theme/gdm3.css gdm3.css /usr/local/share/gnome-shell/theme/Yaru/gnome-shell.css 15
