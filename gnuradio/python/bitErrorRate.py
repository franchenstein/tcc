#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Bit Error Rate
# Author: Daniel Franch
# Description: Calculates the BER based on the known original message and the final received message.
# Generated: Fri Aug  1 12:30:06 2014
##################################################

from gnuradio import blocks
from gnuradio import gr
from gnuradio.filter import firdes
import ConfigParser

class bitErrorRate(gr.hier_block2):

    def __init__(self):
        gr.hier_block2.__init__(
            self, "Bit Error Rate",
            gr.io_signaturev(2, 2, [gr.sizeof_char*1, gr.sizeof_char*1]),
            gr.io_signature(1, 1, gr.sizeof_float*1),
        )

        ##################################################
        # Variables
        ##################################################
        self._msgLength_config = ConfigParser.ConfigParser()
        self._msgLength_config.read("./configs/sdrConfig.txt")
        try: msgLength = self._msgLength_config.getint("main", "key")
        except: msgLength = 10000
        self.msgLength = msgLength
        self._bits_per_byte_config = ConfigParser.ConfigParser()
        self._bits_per_byte_config.read("./configs/sdrConfig.txt")
        try: bits_per_byte = self._bits_per_byte_config.getint("main", "key")
        except: bits_per_byte = 8
        self.bits_per_byte = bits_per_byte

        intdecim = 100000
        if msgLength < intdecim:
            intdecim = msgLength
        
        ##################################################
        # Blocks
        ##################################################
        self.blocks_xor_xx_0 = blocks.xor_bb()
        self.blocks_unpack_k_bits_bb_0 = blocks.unpack_k_bits_bb(bits_per_byte)
        self.blocks_uchar_to_float_0 = blocks.uchar_to_float()
        self.blocks_multiply_const_vxx_0 = blocks.multiply_const_vff((1.0/msgLength, ))
        self.blocks_integrate_xx_0 = blocks.integrate_ff(intdecim)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_integrate_xx_0, 0), (self.blocks_multiply_const_vxx_0, 0))
        self.connect((self, 1), (self.blocks_xor_xx_0, 1))
        self.connect((self, 0), (self.blocks_xor_xx_0, 0))
        self.connect((self.blocks_multiply_const_vxx_0, 0), (self, 0))
        self.connect((self.blocks_xor_xx_0, 0), (self.blocks_unpack_k_bits_bb_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_uchar_to_float_0, 0))
        self.connect((self.blocks_uchar_to_float_0, 0), (self.blocks_integrate_xx_0, 0))


# QT sink close method reimplementation

    def get_msgLength(self):
        return self.msgLength

    def set_msgLength(self, msgLength):
        self.msgLength = msgLength
        self.blocks_multiply_const_vxx_0.set_k((1.0/self.msgLength, ))

    def get_bits_per_byte(self):
        return self.bits_per_byte

    def set_bits_per_byte(self, bits_per_byte):
        self.bits_per_byte = bits_per_byte


