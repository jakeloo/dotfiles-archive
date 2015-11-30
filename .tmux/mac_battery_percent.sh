pmset -g batt | grep InternalBattery | cut -d" " -f2 | sed "s/[^0-9]*//g" | cut -c2-4
