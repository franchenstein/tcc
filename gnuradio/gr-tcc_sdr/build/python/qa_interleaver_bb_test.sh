#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/python
export PATH=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/python:$PATH
export LD_LIBRARY_PATH=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/swig:$PYTHONPATH
/usr/bin/python /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/python/qa_interleaver_bb.py 
