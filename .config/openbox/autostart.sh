## tint2
(sleep 1s && tint2) &

## volume icon for tint2
volumeicon &

## keyboard layout switch
#setxkbmap -layout "us,ua" -variant -option "grp:lwin_toogle,compose:menu, terminate:ctrl_alt_bksp"
#setxkbmap -layout "us,ua"  -option "grp:alt_shift_toggle,compose:menu,terminate:ctrl_alt_bksp"
#setxkbmap -layout "us,ua" -option "grp:alt_shift_toggle"
setxkbmap -layout "us,ua" -option "grp:lwin_toggle, grp:rwin_toggle, nbsp:level3n, compose:menu, terminate:ctrl_alt_bksp"

## enable touchpad click
synclient TapButton1=1

## network manager applet for tint2
# nm-applet &

## gtk theme
(sleep 1s && gnome-settings-daemon) &
