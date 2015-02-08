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
#include "deinterleaver_bb_impl.h"

namespace gr {
  namespace frame_detection {

    deinterleaver_bb::sptr
    deinterleaver_bb::make(int n, int m)
    {
      return gnuradio::get_initial_sptr
        (new deinterleaver_bb_impl(n, m));
    }

    /*
     * The private constructor
     */
    deinterleaver_bb_impl::deinterleaver_bb_impl(int n, int m)
      : gr::block("deinterleaver_bb",
              gr::io_signature::make(1, 1, sizeof(char)),
              gr::io_signature::make(1, 1, sizeof(char)))
    {
        i_n = n;
        i_m = m;
        counter = 0;
        n_count = 0;
        m_count = 0;
        buffer = new char[n*m];
        buffer2 = new char[n*m];
        buf_count = 0;
        frame_detected = false;
        end_of_frame = false;
        eof_pos = 0;
    }

    /*
     * Our virtual destructor.
     */
    deinterleaver_bb_impl::~deinterleaver_bb_impl()
    {
        delete[] buffer;
        delete[] buffer2;
    }

    void
    deinterleaver_bb_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
        ninput_items_required[0] = noutput_items;
    }

    int
    deinterleaver_bb_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
        const char *in = (const char *) input_items[0];
        char *out = (char *) output_items[0];
        
        int n = ninput_items[0];
        int i = 0;
        
        while (n > 0)
        {
            if(!frame_detected)
            {
                if(in[i] == char(10))
                {
                    frame_detected = true;
                    end_of_frame = false;
                    out[i] = 6;
                }
                else
                    out[i] = 5;
                    
                consume_each(1);
                n--;
                i++;
            }
            
            else
            {
               if(in[i] == char(11))
               {
                   end_of_frame = true;
                   eof_pos = i;
               }
                
               if ((i == eof_pos + i_n*i_m) && (end_of_frame))
               {
                    out[i++] = 7;
                    n--;
                    consume_each(1);
                    frame_detected = false;
               }
               
               else
               { 
                   if(counter < i_n*i_m)
                    {
                        counter++;
                        out[i] = 0;
                    }
                    else
                    {
                        out[i] = buffer2[buf_count++];
                        n--;
                        consume_each(1);
                    }
                        
                    if (buf_count >= i_n*i_m)
                        buf_count = 0;
                       
                    buffer[n_count + i_m*m_count] = in[i];
                    
                    if (n_count + i_m*m_count == i_n*i_m - 1)
                    {
                        for(int j = 0; j < i_n*i_m; j++)
                            buffer2[j] = buffer[j];
                    }
                    
                    if(m_count < i_n - 1)
                        m_count++;
                    else
                    {
                        m_count = 0;
                        n_count++;
                    }
                        
                    if(n_count == i_m)
                        n_count = 0;
                        
                    i++;
                }
            }   
        }
   
        // Tell runtime system how many output items we produced.
        return i;
    }

  } /* namespace frame_detection */
} /* namespace gr */

