#!/bin/sh

DWM_CONFIG_PATH=/home/${DOAS_USER}/proj/openbsd-helpers/conf/dwm/config.def.h

rm /usr/ports/packages/amd64/all/dwm-*
cd /usr/ports/x11/dwm
make clean
make patch
cp ${DWM_CONFIG_PATH} /usr/ports/pobj/dwm-*/dwm-*/
make package
pkg_delete dwm
pkg_add -D unsigned /usr/ports/packages/amd64/all/dwm-*
