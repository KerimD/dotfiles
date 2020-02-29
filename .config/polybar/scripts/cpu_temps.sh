# location = /sys/devices/platform/coretemp.0/hwmon/hwmon4/*

# icons
icon_low="%{F#FF4500} %{F-}"
icon_high=" "

t=0

toggle() {
  t=$(( (${t} + 1) % 2 ))
}

trap "toggle" USR1

while true; do

  # setting temps
  temp_avg=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp1_input`
  temp1=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp2_input`
  temp2=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp3_input`
  temp3=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp4_input`
  temp4=`cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp5_input`

  temp_avg=$(( ${temp_avg} / 1000 ))
  temp1=$(( ${temp1} / 1000 ))
  temp2=$(( ${temp2} / 1000 ))
  temp3=$(( ${temp3} / 1000 ))
  temp4=$(( ${temp4} / 1000 ))

  # setting icons
  if [[ $temp_avg -gt 80 ]]; then
    temp_avg_icon="%{B#FF4500} ${icon_high}${temp_avg}°C %{B-}"
  else
    temp_avg_icon="${icon_low}${temp_avg}°C"
  fi

  if [[ $temp1 -gt 80 ]]; then
    temp1_icon="%{B#FF4500} ${icon_high}${temp1}°C %{B-}"
  else
    temp1_icon="${icon_low}${temp1}°C"
  fi

  if [[ $temp2 -gt 80 ]]; then
    temp2_icon="%{B#FF4500} ${icon_high}${temp2}°C %{B-}"
  else
    temp2_icon="${icon_low}${temp2}°C"
  fi

  if [[ $temp3 -gt 80 ]]; then
    temp3_icon="%{B#FF4500} ${icon_high}${temp3}°C %{B-}"
  else
    temp3_icon="${icon_low}${temp3}°C"
  fi

  if [[ $temp4 -gt 80 ]]; then
    temp4_icon="%{B#FF4500} ${icon_high}${temp4}°C %{B-}"
  else
    temp4_icon="${icon_low}${temp4}°C"
  fi

  # print to screen
  if [[ $t -eq 0 ]]; then
    echo "$temp_avg_icon"
  else
    echo "$temp1_icon    $temp2_icon    $temp3_icon    $temp4_icon"
  fi

  # sleep
  sleep 5 &
  wait
done

