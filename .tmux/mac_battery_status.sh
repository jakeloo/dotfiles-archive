pmset -g batt | grep InternalBattery | cut -d" " -f3 | sed "s/[^0-9a-zA-Z]*//g"
