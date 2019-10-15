echo "Hi, before installing Power Tracker, we would require a python library called python-tk to be installed. Allow us to install python-tk if it is not already installed."
echo "a - Allow"
echo "d - Deny"

read opt

if [ $opt='a' ]; then
	echo $(sudo apt-get install python-tk)
	echo $(touch PowerTracker.desktop)
	tracker=$PWD/tracker.sh
	tracker_txt=$PWD/tracker.txt

	echo "dir=$PWD" > $tracker


	while IFS= read -r line
	do
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
	echo "If there is no error messages, reboot your machine to run battery tracker"
echo "Instead, you can run by double clicking \"PowerTracker\" icon"
fi