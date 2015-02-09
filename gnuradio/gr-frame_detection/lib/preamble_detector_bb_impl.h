/* -*- c++ -*- */
/* 
 * Copyright 2015 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifndef INCLUDED_FRAME_DETECTION_PREAMBLE_DETECTOR_BB_IMPL_H
#define INCLUDED_FRAME_DETECTION_PREAMBLE_DETECTOR_BB_IMPL_H

#include <frame_detection/preamble_detector_bb.h>

namespace gr {
  namespace frame_detection {

    class preamble_detector_bb_impl : public preamble_detector_bb
    {
     private:
      char* sequence;
      int sequence_length;
      bool sequence_detected;
      int counter;
      int message_counter;
      int m_length;
      int item_size;

     public:
      preamble_detector_bb_impl(const std::vector<int> &preamble, 
                                int preamble_length, 
                                int message_length, 
                                int item_size);
      ~preamble_detector_bb_impl();

      // Where all the action really happens
      int general_work(int noutput_items,
		   gr_vector_int &ninput_items,
	       gr_vector_const_void_star &input_items,
	       gr_vector_void_star &output_items);
    };

  } // namespace frame_detection
} // namespace gr

#endif /* INCLUDED_FRAME_DETECTION_PREAMBLE_DETECTOR_BB_IMPL_H */

