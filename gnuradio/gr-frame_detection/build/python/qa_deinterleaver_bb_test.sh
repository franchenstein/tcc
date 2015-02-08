#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/python
export PATH=/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/python:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export PYTHONPATH=/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/swig:$PYTHONPATH
/usr/bin/python2 /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/python/qa_deinterleaver_bb.py 
