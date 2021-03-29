#!/bin/sh
#
# dont use that, it really quick and dirty 

pkg_add -uI &

./ports_update.sh & 

sleep 20

./install_dwm.sh
