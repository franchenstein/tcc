#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/python
export PATH=/home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/python:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export PYTHONPATH=/home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/swig:$PYTHONPATH
/usr/bin/python2 /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/python/qa_my_qpsk_demod_cb.py 
