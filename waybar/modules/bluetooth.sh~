#! /bin/zsh

running=$(systemctl status bluetooth | grep running | wc -l | xargs)
non_blocked=$(rfkill -r | grep hci0 | wc -l | xargs)
# If not active display nothing
if [ "$running" -eq "1" ] && [ "$non_blocked" -eq "1" ]; then
    connection=$(echo "info" | bluetoothctl | grep "Name" | awk -F": " '{print $2}')
    count=$(echo "info" | bluetoothctl | grep "Name" | awk -F": " '{print $2}' |wc -l)

    # If active then check if there are any connections
    if [ "$count" -gt "0" ]; then
        text=" $connection"
        percentage=100
        class=("on")
    else
        text=' on'
        percentage=50
        class=("off")
    fi
else
    # If isn't running then dont display the icon
    text=' off'
    percentage=0
    class=("down")
fi

out="{\"text\": \"$text\", \"percentage\":$percentage, \"class\":[\"$class\"]}"
echo $out
