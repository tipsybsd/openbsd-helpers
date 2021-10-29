xrandr > /dev/null

# check for internal display interface
if [ "`xrandr | grep LVDS-1  | cut -d ' ' -f 2`" = 'connected' ]
then
  INTERNAL_DISPLAY=LVDS-1
elif [ "`xrandr | grep eDP-1  | cut -d ' ' -f 2`" = 'connected' ]
then
  INTERNAL_DISPLAY=eDP-1
fi

# we suggest, what if we have VGA-1 connected, when we have two external displays case
if [ "`xrandr | grep VGA-1  | cut -d ' ' -f 2`" = 'connected' ]
then
  xrandr --output ${INTERNAL_DISPLAY} --off    
  xrandr --output VGA-1 --auto

  if  [ "`xrandr | grep HDMI-1  | cut -d ' ' -f 2`" = 'connected' ]
  then
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --right-of VGA-1
  fi

  if  [ "`xrandr | grep DP-1  | cut -d ' ' -f 2`" = 'connected' ]
  then
    xrandr --output DP-1 --auto
    xrandr --output DP-1 --right-of VGA-1
  fi
else

# ... else - just activate second display
 if [ "`xrandr | grep HDMI-1  | cut -d ' ' -f 2`" = 'connected' ]
 then
   xrandr --output HDMI-1 --auto
   xrandr --output HDMI-1 --right-of ${INTERNAL_DISPLAY}
 elif [ "`xrandr | grep DP-1  | cut -d ' ' -f 2`" = 'connected' ]
 then 
   xrandr --output DP-1 --auto
   xrandr --output DP-1 --right-of ${INTERNAL_DISPLAY}
 fi

fi    

feh --bg-scale ~/.wallpaper &
xset m
