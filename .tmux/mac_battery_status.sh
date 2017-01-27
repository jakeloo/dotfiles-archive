pmset -g batt | grep InternalBattery | cut -d" " -f4 | sed "s/[^a-zA-Z]*//g"
