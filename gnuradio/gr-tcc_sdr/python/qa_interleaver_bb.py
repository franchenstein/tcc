#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Copyright 2015 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

from gnuradio import gr, gr_unittest
from gnuradio import blocks
import tcc_sdr_swig as tcc_sdr

class qa_interleaver_bb_bb (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None

    def test_001_t (self):
        src_data = (1, 2, 3, 4, 5, 6)
        expected_result = (0, 0, 0, 0, 0, 0, 1, 3, 5, 2, 4, 6)
        src = blocks.vector_source_b(src_data)
        intlv = tcc_sdr.interleaver_bb(2,3)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv)
        self.tb.connect(intlv, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
        
    def test_002_t (self):
        src_data = (1, 2, 3, 4)
        expected_result = (0, 0, 0, 0, 1, 3, 2, 4)
        src = blocks.vector_source_b(src_data)
        intlv = tcc_sdr.interleaver_bb(2,2)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv)
        self.tb.connect(intlv, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)       
       
    def test_003_t (self):
        src_data = (1, 2, 3, 4, 5, 6)
        expected_result = (0, 0, 0, 0, 0, 0, 1, 4, 2, 5, 3, 6)
        src = blocks.vector_source_b(src_data)
        intlv = tcc_sdr.interleaver_bb(3,2)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv)
        self.tb.connect(intlv, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
                
    def test_004_t (self):
        src_data = (1, 0, 0, 1, 0, 0, 1, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        intlv = tcc_sdr.interleaver_bb(3,3)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv)
        self.tb.connect(intlv, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
        
    def test_005_t (self):
        src_data = (1, 2, 3, 4)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4)
        src = blocks.vector_source_b(src_data)
        intlv1 = tcc_sdr.interleaver_bb(2,2)
        intlv2 = tcc_sdr.interleaver_bb(2,2)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv1)
        self.tb.connect(intlv1, intlv2)
        self.tb.connect(intlv2, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
        
    def test_006_t (self):
        src_data = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
        expected_result = (0, 0, 0, 0, 1, 3, 2, 4, 5, 7, 6, 8, 9, 11, 10, 12)
        src = blocks.vector_source_b(src_data)
        intlv = tcc_sdr.interleaver_bb(2,2)
        dst = blocks.vector_sink_b()
        self.tb.connect(src, intlv)
        self.tb.connect(intlv, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)


if __name__ == '__main__':
    gr_unittest.run(qa_interleaver_bb_bb, "qa_interleaver_bb_bb.xml")
