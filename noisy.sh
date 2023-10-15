#!/bin/bash

target=${1:-help}   # target noise
dur=$2      # duration

playopts="-q"   # global options to play. -q for quiet


case $target in
    beach1)     # beach v1
        play $playopts -n -n --combine merge synth $dur pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50
        ;;
    beach|beach2)   # beach v2
        play $playopts -r 44100 -n -r 44100 -n --combine merge $dur synth pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50 earwax
        ;;
    train1)     # steam train v1
        play $playopts -t sl - synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
        ;;
    train|train2)   # steam train v2
        play $playopts -r 44100 -n -r 44100 -n --combine merge synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 earwax
        ;;
    storm1|rain1)   # rain from a storm v1
        play $playopts -t sl - synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
        ;;
    storm|rain|storm2|rain2)   # rain from a storm v2
        play $playopts -n synth $dur pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30
        ;;
    enterprise1)  # TNG Starship Enterprise v1 (h/t Neale)
        play -q -c2 -n synth $dur whitenoise band -n 80 40 band -n 310 50 gain +15
        ;;
    enterprise2)    # TNG Starship Enterprise v2 (h/t Neale)
        play -q -c2 -n synth $dur whitenoise band -n 220 50 band -n 80 40 gain +15
        ;;
    enterprise3)    # TNG Starship Enterprise v3 (h/t Neale)
        play $playopts -n -c1 synth $dur whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +16
        ;;
    enterprise|enterprise4) # TNG Starship Enterprise v4 (h/t Neale / Paul)
        play -q -c2 -n synth $dur whitenoise band -n 100 24 band -n 300 100 gain +20
        ;;
    *)
        echo "Invocation: '$0 [theme] [duration]', where theme is one of the following:"
        egrep "^    [a-z0-9|]*\).*# " $0 | sed -e 's/)//1' | column -t -s'#'
        echo "Duration is optional, in HH:MM:SS format. Defaults to play till interrupted"

esac

# NOTES
# append 'vol 2' at the end to make louder. Can't go much beyond 3 without clipping

# Wishlist
# - ticktock clock
# - TARDIS


