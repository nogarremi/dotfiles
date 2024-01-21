hyprctl keyword windowrule "workspace 1 silent, firefox"
hyprctl keyword windowrule "workspace 7 silent, kitty"
sleep 15
hyprctl keyword windowrule "workspace unset, kitty"
hyprctl keyword windowrule "workspace unset, firefox"
