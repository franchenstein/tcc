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
#include <iostream>
using namespace std;

namespace gr {
  namespace frame_detection {

    preamble_detector_bb::sptr
    preamble_detector_bb::make(const std::vector<int> &preamble, int preamble_length, int message_length, int i_size)
    {
      return gnuradio::get_initial_sptr
        (new preamble_detector_bb_impl(preamble, preamble_length, message_length, i_size));
    }

    /*
     * The private constructor
     */
    preamble_detector_bb_impl::preamble_detector_bb_impl(const std::vector<int> &preamble,
                                                         int preamble_length, 
                                                         int message_length,
                                                         int i_size)
      : gr::block("preamble_detector_bb",
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
        item_size = i_size;
    }

    /*
     * Our virtual destructor.
     */
    preamble_detector_bb_impl::~preamble_detector_bb_impl()
    {
        delete[] sequence;
    }

    int
    preamble_detector_bb_impl::general_work(int noutput_items,
		      gr_vector_int &ninput_items,
			  gr_vector_const_void_star &input_items,
			  gr_vector_void_star &output_items)
    {
        const char *in = (const char *) input_items[0];
        char *out = (char *) output_items[0];
        int n = ninput_items[0];
        int i = 0;
        bool thresh_sent = false;
        int thresh_count = 0;
        char* buffer = new char[item_size];
        int buf_count = 0; 
        
        while(n > 0)
        {
            if(!thresh_sent)
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
                        thresh_count++;
                    }
                    else
                    {
                        out[i] = 0;
                    }
                    
                    n--;
                }
                else
                {
                    buffer[buf_count++] = in[i];
                    
                    if(thresh_count < item_size)
                    {
                        thresh_count++;
                        out[i] = char(254);
                    }
                    else
                    {
                        thresh_sent = true;
                        sequence_detected = false;
                        thresh_count = 0;
                        out[i] = buffer[0];
                        message_counter++;
                        n--;
                    }
                }
                
            }
            else
            {
                if(message_counter < m_length)
                {
                    if(buf_count == item_size)
                        buf_count = 0;
                    buffer[buf_count++] = in[i];
                    if(buf_count == item_size)
                        out[i] = buffer[0];
                    else
                        out[i] = buffer[buf_count];
                    message_counter++;
                        
                }
                else
                {
                    thresh_sent = false;
                    out[i] = 0;
                }
                    
                n--;
                
            }
            
            i++;
        }
        
        consume_each(ninput_items[0]);
        
        delete[] buffer;
        
        return i;
    }

  } /* namespace frame_detection */
} /* namespace gr */

