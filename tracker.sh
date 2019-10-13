DIR1="/sys/class/power_supply/BAT0"
DIR2="/sys/class/power_supply/BAT1"
DIR3="/sys/class/power_supply/BAT2"
Flag="0"

[ -d "$DIR1" ] && echo "Power Tracker is Running..." && echo $(python power.py ${DIR1}) && Flag="1" || echo "Path is not found: ${DIR1}"
[ -d "$DIR2" ] && echo "Power Tracker is Running..." && echo $(python power.py ${DIR2}) && Flag="1" || echo "Path is not found: ${DIR2}"
[ -d "$DIR3" ] && echo "Power Tracker is Running..." && echo $(python power.py ${DIR3}) && Flag="1" || echo "Path is not found: ${DIR3}"


if [ "$Flag" = "0" ]; then
	echo "Power Tracker could not fetch the battery details"
fi
