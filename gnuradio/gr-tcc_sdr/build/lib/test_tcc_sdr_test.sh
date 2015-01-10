#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib
export PATH=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib:$PATH
export LD_LIBRARY_PATH=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH
test-tcc_sdr 
