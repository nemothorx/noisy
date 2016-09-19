#!/bin/bash

# verbatim or derived from stuff at:
# http://unreasonable.org/white_noise_generator_with_sox_for_Linux
# and written up by me here
# https://www.facebook.com/nemothorx/posts/10154560062528216?pnref=story
# as well as discussed on #tron (15 Sept 2016)


# beach
play -n -n --combine merge synth $len pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50
play -r 44100 -n -r 44100 -n --combine merge synth pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50 earwax

# steam train
play -t sl - synth 15:00 pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
play -r 44100 -n -r 44100 -n --combine merge synth 15:00 pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 75 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 earwax

# rain from storm
play -t sl - synth 15:00 pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30 < /dev/zero
play -n synth 15:00 pinknoise band -n 1200 200 tremolo 7 5 tremolo 5 5 tremolo 3 5 tremolo .1 20 tremolo .2 20 tremolo .3 20 tremolo .1 20 tremolo .01 30

# ticktock clock (wishlist)

# TARDIS (wishlist)


# NOTES
# append 'vol 2' at the end to make louder. Can't go much beyond 3 without clipping
