xrandr > /dev/null

if [ `xrandr | grep VGA-1  | cut -d ' ' -f 2` = 'connected' ]
then
    xrandr --output eDP-1 --off    
    xrandr --output VGA-1 --auto
    #xrandr --output HDMI-1 --mode 1920x1200
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --right-of VGA-1
else
    #xrandr --output HDMI-1 --mode 1920x1200
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --right-of eDP-1
fi    

feh --bg-scale ~/.wallpaper &
xset m
