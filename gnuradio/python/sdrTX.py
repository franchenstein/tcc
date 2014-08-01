#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: SDR Transmitter
# Author: Daniel Franch
# Description: Generates the transmitted message for the SDR system: channel coded, modulated and pulse shaped.
# Generated: Fri Aug  1 12:09:46 2014
##################################################

from gnuradio import blocks
from gnuradio import digital
from gnuradio import gr
from gnuradio.filter import firdes
import ConfigParser
import numpy

class sdrTX(gr.hier_block2):

    def __init__(self):
        gr.hier_block2.__init__(
            self, "SDR Transmitter",
            gr.io_signature(0, 0, 0),
            gr.io_signaturev(2, 2, [gr.sizeof_char*1, gr.sizeof_gr_complex*1]),
        )

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 32000
        self._mLength_config = ConfigParser.ConfigParser()
        self._mLength_config.read("./configs/sdrConfig.txt")
        try: mLength = self._mLength_config.getint("main", "key")
        except: mLength = 10000
        self.mLength = mLength

        ##################################################
        # Blocks
        ##################################################
        self.digital_psk_mod_0 = digital.psk.psk_mod(
          constellation_points=2,
          mod_code="gray",
          differential=False,
          samples_per_symbol=2,
          excess_bw=0.35,
          verbose=False,
          log=False,
          )
        self.analog_random_source_x_0 = blocks.vector_source_b(map(int, numpy.random.randint(0, 2, mLength)), True)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_random_source_x_0, 0), (self.digital_psk_mod_0, 0))
        self.connect((self.analog_random_source_x_0, 0), (self, 0))
        self.connect((self.digital_psk_mod_0, 0), (self, 1))


# QT sink close method reimplementation

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate

    def get_mLength(self):
        return self.mLength

    def set_mLength(self, mLength):
        self.mLength = mLength


