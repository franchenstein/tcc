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
#include "interleaver_bb_impl.h"

namespace gr {
  namespace tcc_sdr {

    interleaver_bb::sptr
    interleaver_bb::make(int n, int m)
    {
      return gnuradio::get_initial_sptr
        (new interleaver_bb_impl(n, m));
    }

    /*
     * The private constructor*
     */
    interleaver_bb_impl::interleaver_bb_impl(int n, int m)
      : gr::block("interleaver",
              gr::io_signature::make(1, 1, sizeof(char)),
              gr::io_signature::make(1, 1, sizeof(char)))
    {
        i_n = n;
        i_m = m;
        counter = 0;
        n_count = 0;
        m_count = 0;
        set_history(n*m + 1);
        buffer = new char[n*m];
        buffer2 = new char[n*m];
        buf_count = 0;
    }

    /*
     * Our virtual destructor.
     */
    interleaver_bb_impl::~interleaver_bb_impl()
    {
        delete[] buffer;
        delete[] buffer2;
    }

    void
    interleaver_bb_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
        ninput_items_required[0] = noutput_items;
    }

    int
    interleaver_bb_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
        const char *in = (const char *) input_items[0];
        char *out = (char *) output_items[0];
        
        for (int i = 0; i < noutput_items; i++)
        {                           
            if(counter < i_n*i_m)
            {
                counter++;
                out[i] = in[i];
            }
            else
                out[i] = buffer2[buf_count++];
                
            if (buf_count >= i_n*i_m)
                buf_count = 0;
               
            buffer[n_count + i_m*m_count] = in[i + i_n*i_m];
            
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
        }
                
        consume_each(noutput_items);
        // Tell runtime system how many output items we produced.
        return noutput_items;
    }

  } /* namespace tcc_sdr */
} /* namespace gr */

