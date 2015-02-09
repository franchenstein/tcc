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

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "preamble_detector_bb_impl.h"

namespace gr {
  namespace frame_detection {

    preamble_detector_bb::sptr
    preamble_detector_bb::make(const std::vector<int> &preamble, int preamble_length, int message_length)
    {
      return gnuradio::get_initial_sptr
        (new preamble_detector_bb_impl(preamble, preamble_length, message_length));
    }

    /*
     * The private constructor
     */
    preamble_detector_bb_impl::preamble_detector_bb_impl(const std::vector<int> &preamble, int preamble_length, int message_length)
      : gr::sync_block("preamble_detector_bb",
              gr::io_signature::make(1, 1, sizeof(char)),
              gr::io_signature::make(1, 1, sizeof(char)))
    {
        sequence = new char[preamble_length];
        sequence_length = preamble_length;
        for(int i = 0; i < preamble_length; i++)
            sequence[i] = char(preamble[i]);
        sequence_detected = false;
        counter = 0;
        message_counter = 0;
        m_length = message_length;
    }

    /*
     * Our virtual destructor.
     */
    preamble_detector_bb_impl::~preamble_detector_bb_impl()
    {
        delete[] sequence;
    }

    int
    preamble_detector_bb_impl::work(int noutput_items,
			  gr_vector_const_void_star &input_items,
			  gr_vector_void_star &output_items)
    {
        const char *in = (const char *) input_items[0];
        char *out = (char *) output_items[0];
        
        for(int i = 0; i < noutput_items; i++)
        {
            if(!sequence_detected)
            {
                if(in[i] == sequence[counter])
                    counter++;
                else
                    counter = 0;
                    
                if(counter == sequence_length)
                {
                    out[i] = char(254);
                    sequence_detected = true;
                    counter = 0;
                }
                else
                    if (message_counter > 0)
                    {
                        out[i] = char(255);
                        message_counter = 0;
                    }
                    else
                        out[i] = 0;
            }
            else
            {
                out[i] = in[i];
                if(message_counter < m_length - 1)
                    message_counter++;
                else
                    sequence_detected = false;
                
            }
        }
        
        return noutput_items;
    }

  } /* namespace frame_detection */
} /* namespace gr */

