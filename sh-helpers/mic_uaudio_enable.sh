#!/bin/sh
sysctl kern.audio.record=1
rcctl set sndiod flags -f rsnd/0 -F rsnd/1
rcctl restart sndiod
