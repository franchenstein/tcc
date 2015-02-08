#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib
export PATH=/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH
test-frame_detection 
