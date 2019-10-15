echo $(touch PowerTracker.desktop)
tracker=$PWD/tracker.sh
tracker_txt=$PWD/tracker.txt

echo "dir=$PWD" > $tracker
# echo $(cat $tracker_txt)
# echo $(cat $tracker_txt) >> $tracker
# echo $(cp -n $tracker_txt $tracker)
# sudo cp -vnpr /xxx/* /yyy

while IFS= read -r line
do
# echo "$line"
echo "$line\n" >>$tracker

done <"$tracker_txt"


my_desktop=$PWD/PowerTracker.desktop
echo "[Desktop Entry]" > $my_desktop
echo "Type=Application" >> $my_desktop
echo "Exec=sh $PWD/tracker.sh" >> $my_desktop
echo "Icon=$PWD/battery.png" >> $my_desktop
echo "Name=Power Tracker" >> $my_desktop
echo "Terminal=false" >> $my_desktop
echo "X-GNOME-Autostart-enabled=true" >> $my_desktop
echo $(sudo chmod 777 *)
[ -d ~/.config/autostart ] && echo "Auto start enabled..." || echo $(sudo mkdir ~/.config/autostart) || echo "Auto start enabled..."
echo $(sudo cp PowerTracker.desktop ~/.config/autostart/)
# echo $(~/.config/autostart/PowerTracker.desktop)
echo "If there is no error messages, reboot your machine to run battery tracker"
echo "Instead, you can run by double clicking \"PowerTracker\" icon"
# [ -d ~/.config/autostart/PowerTracker.desktop ] && echo "Installed Successfully!" || echo "Installation Failed"
# echo "If this you do not see any messages above, then the battery tracker is installed :-)"
# echo "Else if, you got some messages, we are sorry to say Battery saver is not installed :-("
