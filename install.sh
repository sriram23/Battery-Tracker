echo $(touch PowerTracker.desktop)
my_desktop=$PWD/PowerTracker.desktop
echo "[Desktop Entry]" > $my_desktop
echo "Type=Application" >> $my_desktop
echo "Exec=sh $PWD/tracker.sh" >> $my_desktop
echo "Icon=$PWD/battery.png" >> $my_desktop
echo "Name=Power Tracker" >> $my_desktop
echo "Terminal=false" >> $my_desktop
echo "X-GNOME-Autostart-enabled=true" >> $my_desktop
echo $(sudo chmod 775 *)
echo $(sudo cp PowerTracker.desktop ~/.config/autostart/)
echo "<<<<<<<<<<<<<<<Successfully Installed!>>>>>>>>>>>>>>>>"