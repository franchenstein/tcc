/* -*- c++ -*- */

#define TCC_SDR_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "tcc_sdr_swig_doc.i"

%{
#include "tcc_sdr/interleaver_bb.h"
%}


%include "tcc_sdr/interleaver_bb.h"
GR_SWIG_BLOCK_MAGIC2(tcc_sdr, interleaver_bb);
