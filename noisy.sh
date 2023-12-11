#!/bin/bash

target=${1:-help}   # target noise
dur=$2      # duration

playopts="-q"   # global options to play. -q for quiet


case $target in
    beach1)     #~ beach v1
        play $playopts -n -n --combine merge synth $dur pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50
        ;;
    beach|beach2)   #~ beach v2
        play $playopts -r 44100 -n -r 44100 -n --combine merge $dur synth pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50 earwax
        ;;
    train1)     #~ steam train v1
        play $playopts -t sl - synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
        ;;
    train|train2)   #~ steam train v2
        play $playopts -r 44100 -n -r 44100 -n --combine merge synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 earwax
        ;;
    storm1|rain1)   #~ rain from a storm v1
        play $playopts -t sl - synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
        ;;
    storm|rain|storm2|rain2)   #~ rain from a storm v2
        play $playopts -n synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30
        ;;
    enterprise1)  #~ TNG Starship Enterprise v1 (h/t Neale)
        play -q -c2 -n synth $dur whitenoise band -n 80 40 band -n 310 50 gain +15
        ;;
    enterprise2)    #~ TNG Starship Enterprise v2 (h/t Neale)
        play -q -c2 -n synth $dur whitenoise band -n 220 50 band -n 80 40 gain +15
        ;;
    enterprise3)    #~ TNG Starship Enterprise v3 (h/t Neale)
        play $playopts -n -c1 synth $dur whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +16
        ;;
    enterprise|enterprise4) #~ TNG Starship Enterprise v4 (h/t Neale / Paul) 
        play -q -c2 -n synth $dur whitenoise band -n 100 24 band -n 300 100 gain +20
        ;;
    enterpriseb|breathing) #~ Breathing variant - 12.5second tremolo
        play -q -c2 -n synth $dur whitenoise band -n 100 24 band -n 300 100 gain +10 tremolo 0.08 75
        ;;
    anxiety1) #~ Higher pitched and pulsing effect. Not pleasant
        play -q -c2 -n synth $dur triangle band -n 400 124 band -n 600 100 gain +10  tremolo 1 80 tremolo 2 30 tremolo 3 40 tremolo 4 50 tremolo 6 80
        ;;
    #) #~ Enterprise themes attempted to be tuned towards TV accuracy
    *)
        echo "Invocation: '$0 [theme] [duration]'
where theme is one of the following:"
        # Any lines of code with [space][hash][tilde] are formatted into help via the following:
        egrep "[ ]#~" $0 | sed -e 's/)//1 ; s/#~/~/g' | column -t -s'~'
        echo "Duration is optional, in HH:MM:SS format. Defaults to play till interrupted"

esac

# NOTES
# * append 'vol 2' at the end to make louder. Can't go much beyond 3 without clipping
# * want to save it to a regular audiofile to play on another system? 
#   - run it as "rec", set a duration, and put the filename in the right spot
#       - note: this still runs in real time
#       - based on a single test, this works by way of example:
#           rec -q -c2 -n 10sec-of-enterprise.wav synth 00:10 whitenoise band -n 100 24 band -n 300 100 gain +20
# 

# Wishlist
# - ticktock clock
# - TARDIS

