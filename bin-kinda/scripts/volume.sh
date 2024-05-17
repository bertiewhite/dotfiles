#! /bin/bash

HEADPHONES_ID=$(wpctl status | grep '*.*Logitech' | grep -Eo '[0-9]{1,2}' | head -n 1)


if [ -z "$1" ]
    then 
        echo "please supply up or down"
fi

if [[ $1 == "up" ]]; then
    UPDOWN='+'
elif [[ $1 == "down" ]]; then 
    UPDOWN='-'
else 
    echo "arguement has to be up or down"
    exit 1
fi

wpctl set-volume $HEADPHONES_ID 0.1$UPDOWN
