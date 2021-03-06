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
import frame_detection_swig as frame_detection

class qa_preamble_detector_bb (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None

    def test_001_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 255, 1, 0, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 1)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_002_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (5, 9, 4, 3, 2, 4, 8, 16, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 255, 1, 0, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 1)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_003_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 15, 2, 4, 8, 16, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 255, 1, 0, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 1)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_004_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 15, 2, 4, 8, 16, 1, 0, 1, 0, 1, 2, 4, 8, 16, 1)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 255, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 6, 1)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_005_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 15, 2, 4, 8, 16, 1, 1, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 1)
        deint = frame_detection.deinterleaver_bb(2, 2, 4)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_006_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 15, 2, 4, 8, 16, 1, 1, 0, 0, 1, 0, 1, 0, 5, 9, 12)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 8, 1)
        deint = frame_detection.deinterleaver_bb(2, 2, 8)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_007_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 255, 1, 0, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 4)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_008_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        expected_result = (0, 0, 0, 255, 255, 255, 1, 2, 3, 4, 5, 6, 7, 8, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 8, 6)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_009_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24)
        expected_result = (0, 0, 0, 255, 255, 255, 255, 255, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        pck = blocks.pack_k_bits_bb(8)
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 16, 8)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_009_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 17, 18, 19, 20, 21, 22, 23, 24)
        expected_result = (31, 172, 240, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        pck = blocks.pack_k_bits_bb(8)
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 16, 8)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, pck, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
        
    def test_010_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 2, 4, 8, 16, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0)
        #expected_result = (0, 0, 0, 255, 255, 255, 255, 255, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 255, 255, 255, 255, 255, 1, 0, 1, 0, 1, 0, 1, 0)
        expected_result = (31, 173, 15, 31, 170, 150)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        pck = blocks.pack_k_bits_bb(8)
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 16, 8)
        self.maxDiff = None
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, pck,  dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)
        
    def test_011_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 0, 1, 0, 2, 4, 8, 16, 1, 1, 0, 0)
        expected_result = (0, 0, 0, 255, 1, 0, 1, 0, 0, 0, 0, 255, 1, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 1)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_012_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (2, 4, 8, 16, 1, 2, 3, 4, 2, 4, 8, 16, 8, 7, 6, 5)
        expected_result = (0, 0, 0, 255, 255, 255, 1, 2, 3, 4, 0, 0, 0, 255, 255, 255, 8, 7, 6, 5)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 6)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_013_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (5, 9, 4, 3, 2, 4, 8, 16, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 255, 255, 1, 0, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 3)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_014_t (self):
        preamble = [2, 4, 8, 16]
        pre_len = len(preamble);
        src_data = (5, 9, 4, 3, 2, 4, 8, 16, 1, 0, 1, 0, 5, 9, 4, 3, 2, 4, 8, 16, 1, 0, 1, 0)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 255, 255, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 1, 0, 1, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        dtct = frame_detection.preamble_detector_bb(preamble, pre_len, 4, 3)
        self.tb.connect(src, dtct)
        self.tb.connect(dtct, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

        
if __name__ == '__main__':
    gr_unittest.run(qa_preamble_detector_bb, "qa_preamble_detector_bb.xml")
