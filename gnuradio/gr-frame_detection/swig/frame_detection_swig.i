/* -*- c++ -*- */

#define FRAME_DETECTION_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "frame_detection_swig_doc.i"

%{
#include "frame_detection/deinterleaver_bb.h"
#include "frame_detection/preamble_detector_bb.h"
%}


%include "frame_detection/deinterleaver_bb.h"
GR_SWIG_BLOCK_MAGIC2(frame_detection, deinterleaver_bb);
%include "frame_detection/preamble_detector_bb.h"
GR_SWIG_BLOCK_MAGIC2(frame_detection, preamble_detector_bb);
