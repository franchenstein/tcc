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


#ifndef INCLUDED_TCC_SDR_INTERLEAVER_BB_H
#define INCLUDED_TCC_SDR_INTERLEAVER_BB_H

#include <tcc_sdr/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace tcc_sdr {

    /*!
     * \brief <+description of block+>
     * \ingroup tcc_sdr
     *
     */
    class TCC_SDR_API interleaver_bb : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<interleaver_bb> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of tcc_sdr::interleaver_bb.
       *
       * To avoid accidental use of raw pointers, tcc_sdr::interleaver_bb's
       * constructor is in a private implementation
       * class. tcc_sdr::interleaver_bb::make is the public interface for
       * creating new instances.
       */
      static sptr make(int n, int m);
    };

  } // namespace tcc_sdr
} // namespace gr

#endif /* INCLUDED_TCC_SDR_INTERLEAVER_BB_H */

