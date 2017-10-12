#!/bin/bash

PROFILE=/etc/profile.d

sudo touch $PROFILE/{wallpaper,mute_speaker}.sh

sudo echo "nitrogen --restore &" >> $PROFILE/wallpaper.sh
sudo echo "xset b off" >> $PROFILE/mute_speaker.sh

echo "all done :)"
