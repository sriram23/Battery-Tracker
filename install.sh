start_install()
{
	echo "Installing..."
	sudo apt-get install python -y
	sudo apt-get install python-tk -y
	echo "Installed python-tk"
	touch PowerTracker.desktop
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
	gio set $PWD/PowerTracker.desktop "metadata::trusted" yes
	sudo chmod 777 *
	user=$(whoami)
	sudo chown $user *
	[ -d ~/.config/autostart ] && echo "Auto start enabled..." || echo $(sudo mkdir ~/.config/autostart) || echo "Auto start enabled..."
	sudo cp PowerTracker.desktop ~/.config/autostart/
	sh tracker.sh &
	echo "If there is no error messages, reboot your machine to run battery tracker"
	echo "Instead, you can run by double clicking \"PowerTracker\" icon"
}

echo "Hi, before installing Power Tracker, we would require a python library called python-tk to be installed. Allow us to install python-tk if it is not already installed."
echo "a - Allow"
echo "d - Deny"

# read opt

read -p "Your answer here:" yn
    case $yn in
        [Aa]* ) start_install; break;;
        [Bb]* ) exit;;
        * ) echo "Installation of Power Tracker has been stopped";;
    esac
