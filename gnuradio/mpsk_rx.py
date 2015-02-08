#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: MPSK Receiver
# Author: Daniel Franch
# Generated: Sun Feb  8 17:03:10 2015
##################################################

from PyQt4 import Qt
from gnuradio import blocks
from gnuradio import digital
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import qtgui
from gnuradio import uhd
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import frame_detection
import sip
import sys
import time

class mpsk_rx(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "MPSK Receiver")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("MPSK Receiver")
        try:
             self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
             pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "mpsk_rx")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.sps = sps = 4
        self.nfilts = nfilts = 32
        self.eb = eb = 0.35
        self.usrp_gain = usrp_gain = 40
        self.timing_loop_bw = timing_loop_bw = 0.01
        self.samp_rate = samp_rate = 1e6
        self.rrc_taps = rrc_taps = firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, 11*sps*nfilts)
        self.qpsk = qpsk = digital.constellation_rect(([0.707+0.707j, -0.707+0.707j, -0.707-0.707j, 0.707-0.707j]), ([0, 1, 2, 3]), 4, 2, 2, 1, 1).base()
        self.preamble = preamble = [1,-1,1,-1,1,1,-1,-1,1,1,-1,1,1,1,-1,1,1,-1,1,-1,-1,1,-1,-1,1,1,1,-1,-1,-1,1,-1,1,1,1,1,-1,-1,1,-1,1,-1,-1,-1,1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1]
        self.phase_bw = phase_bw = 0.1
        self.n = n = 4
        self.matched_filter = matched_filter = firdes.root_raised_cosine(nfilts, nfilts, 1, eb, int(11*sps*nfilts))
        self.eq_gain = eq_gain = 0.01
        self.arity = arity = 4

        ##################################################
        # Blocks
        ##################################################
        self._usrp_gain_layout = Qt.QVBoxLayout()
        self._usrp_gain_tool_bar = Qt.QToolBar(self)
        self._usrp_gain_layout.addWidget(self._usrp_gain_tool_bar)
        self._usrp_gain_tool_bar.addWidget(Qt.QLabel("USRP Gain"+": "))
        self._usrp_gain_counter = Qwt.QwtCounter()
        self._usrp_gain_counter.setRange(0, 100, 1)
        self._usrp_gain_counter.setNumButtons(2)
        self._usrp_gain_counter.setValue(self.usrp_gain)
        self._usrp_gain_tool_bar.addWidget(self._usrp_gain_counter)
        self._usrp_gain_counter.valueChanged.connect(self.set_usrp_gain)
        self._usrp_gain_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._usrp_gain_slider.setRange(0, 100, 1)
        self._usrp_gain_slider.setValue(self.usrp_gain)
        self._usrp_gain_slider.setMinimumWidth(200)
        self._usrp_gain_slider.valueChanged.connect(self.set_usrp_gain)
        self._usrp_gain_layout.addWidget(self._usrp_gain_slider)
        self.top_layout.addLayout(self._usrp_gain_layout)
        self._timing_loop_bw_layout = Qt.QVBoxLayout()
        self._timing_loop_bw_label = Qt.QLabel("Time: BW")
        self._timing_loop_bw_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._timing_loop_bw_slider.setRange(0.0, 0.2, 0.005)
        self._timing_loop_bw_slider.setValue(self.timing_loop_bw)
        self._timing_loop_bw_slider.setMinimumWidth(200)
        self._timing_loop_bw_slider.valueChanged.connect(self.set_timing_loop_bw)
        self._timing_loop_bw_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._timing_loop_bw_layout.addWidget(self._timing_loop_bw_label)
        self._timing_loop_bw_layout.addWidget(self._timing_loop_bw_slider)
        self.top_grid_layout.addLayout(self._timing_loop_bw_layout, 0,0,1,1)
        self._phase_bw_layout = Qt.QVBoxLayout()
        self._phase_bw_label = Qt.QLabel("Phase: Bandwidth")
        self._phase_bw_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._phase_bw_slider.setRange(0.0, 1.0, 0.01)
        self._phase_bw_slider.setValue(self.phase_bw)
        self._phase_bw_slider.setMinimumWidth(200)
        self._phase_bw_slider.valueChanged.connect(self.set_phase_bw)
        self._phase_bw_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._phase_bw_layout.addWidget(self._phase_bw_label)
        self._phase_bw_layout.addWidget(self._phase_bw_slider)
        self.top_grid_layout.addLayout(self._phase_bw_layout, 0,2,1,1)
        self._eq_gain_layout = Qt.QVBoxLayout()
        self._eq_gain_label = Qt.QLabel("Equalizer: rate")
        self._eq_gain_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._eq_gain_slider.setRange(0.0, 0.1, 0.001)
        self._eq_gain_slider.setValue(self.eq_gain)
        self._eq_gain_slider.setMinimumWidth(200)
        self._eq_gain_slider.valueChanged.connect(self.set_eq_gain)
        self._eq_gain_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._eq_gain_layout.addWidget(self._eq_gain_label)
        self._eq_gain_layout.addWidget(self._eq_gain_slider)
        self.top_grid_layout.addLayout(self._eq_gain_layout, 0,1,1,1)
        self.uhd_usrp_source_0 = uhd.usrp_source(
        	device_addr="",
        	stream_args=uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_source_0.set_samp_rate(samp_rate)
        self.uhd_usrp_source_0.set_center_freq(2.4e9, 0)
        self.uhd_usrp_source_0.set_gain(usrp_gain, 0)
        self.qtgui_sink_x_1 = qtgui.sink_c(
        	1024, #fftsize
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	0, #fc
        	samp_rate, #bw
        	"QT GUI Plot", #name
        	True, #plotfreq
        	True, #plotwaterfall
        	True, #plottime
        	True, #plotconst
        )
        self.qtgui_sink_x_1.set_update_time(1.0/10)
        self._qtgui_sink_x_1_win = sip.wrapinstance(self.qtgui_sink_x_1.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_sink_x_1_win)
        
        
        self.qtgui_sink_x_0 = qtgui.sink_f(
        	1024, #fftsize
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	0, #fc
        	samp_rate, #bw
        	"QT GUI Plot", #name
        	True, #plotfreq
        	True, #plotwaterfall
        	True, #plottime
        	True, #plotconst
        )
        self.qtgui_sink_x_0.set_update_time(1.0/10)
        self._qtgui_sink_x_0_win = sip.wrapinstance(self.qtgui_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_sink_x_0_win)
        
        
        self.frame_detection_deinterleaver_bb_0 = frame_detection.deinterleaver_bb(n, n)
        self.digital_pfb_clock_sync_xxx_0 = digital.pfb_clock_sync_ccf(sps, timing_loop_bw, (rrc_taps), nfilts, nfilts/2, 1.5, 2)
        self.digital_diff_decoder_bb_0 = digital.diff_decoder_bb(4)
        self.digital_costas_loop_cc_0 = digital.costas_loop_cc(phase_bw, arity)
        self.digital_correlate_and_sync_cc_0 = digital.correlate_and_sync_cc((preamble), (matched_filter), sps)
        self.digital_constellation_decoder_cb_0 = digital.constellation_decoder_cb(qpsk)
        self.digital_cma_equalizer_cc_0 = digital.cma_equalizer_cc(15, 1, eq_gain, 2)
        self.blocks_unpack_k_bits_bb_0 = blocks.unpack_k_bits_bb(2)
        self.blocks_pack_k_bits_bb_1 = blocks.pack_k_bits_bb(8)
        self.blocks_null_sink_0 = blocks.null_sink(gr.sizeof_gr_complex*1)
        self.blocks_file_sink_0 = blocks.file_sink(gr.sizeof_char*1, "/home/ubuntu/rx_message", False)
        self.blocks_file_sink_0.set_unbuffered(False)
        self.blocks_char_to_float_0 = blocks.char_to_float(1, 1)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_char_to_float_0, 0))
        self.connect((self.blocks_char_to_float_0, 0), (self.qtgui_sink_x_0, 0))
        self.connect((self.digital_correlate_and_sync_cc_0, 1), (self.blocks_null_sink_0, 0))
        self.connect((self.digital_diff_decoder_bb_0, 0), (self.blocks_unpack_k_bits_bb_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_pack_k_bits_bb_1, 0))
        self.connect((self.uhd_usrp_source_0, 0), (self.digital_correlate_and_sync_cc_0, 0))
        self.connect((self.digital_correlate_and_sync_cc_0, 0), (self.digital_pfb_clock_sync_xxx_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.digital_cma_equalizer_cc_0, 0))
        self.connect((self.digital_cma_equalizer_cc_0, 0), (self.digital_costas_loop_cc_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.digital_constellation_decoder_cb_0, 0))
        self.connect((self.digital_constellation_decoder_cb_0, 0), (self.digital_diff_decoder_bb_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.qtgui_sink_x_1, 0))
        self.connect((self.blocks_pack_k_bits_bb_1, 0), (self.frame_detection_deinterleaver_bb_0, 0))
        self.connect((self.frame_detection_deinterleaver_bb_0, 0), (self.blocks_file_sink_0, 0))


# QT sink close method reimplementation
    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "mpsk_rx")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.set_rrc_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.set_rrc_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_eb(self):
        return self.eb

    def set_eb(self, eb):
        self.eb = eb
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_usrp_gain(self):
        return self.usrp_gain

    def set_usrp_gain(self, usrp_gain):
        self.usrp_gain = usrp_gain
        self.uhd_usrp_source_0.set_gain(self.usrp_gain, 0)
        self._usrp_gain_counter.setValue(self.usrp_gain)
        self._usrp_gain_slider.setValue(self.usrp_gain)

    def get_timing_loop_bw(self):
        return self.timing_loop_bw

    def set_timing_loop_bw(self, timing_loop_bw):
        self.timing_loop_bw = timing_loop_bw
        self.digital_pfb_clock_sync_xxx_0.set_loop_bandwidth(self.timing_loop_bw)
        self._timing_loop_bw_slider.setValue(self.timing_loop_bw)

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.uhd_usrp_source_0.set_samp_rate(self.samp_rate)
        self.qtgui_sink_x_1.set_frequency_range(0, self.samp_rate)
        self.qtgui_sink_x_0.set_frequency_range(0, self.samp_rate)

    def get_rrc_taps(self):
        return self.rrc_taps

    def set_rrc_taps(self, rrc_taps):
        self.rrc_taps = rrc_taps
        self.digital_pfb_clock_sync_xxx_0.set_taps((self.rrc_taps))

    def get_qpsk(self):
        return self.qpsk

    def set_qpsk(self, qpsk):
        self.qpsk = qpsk

    def get_preamble(self):
        return self.preamble

    def set_preamble(self, preamble):
        self.preamble = preamble

    def get_phase_bw(self):
        return self.phase_bw

    def set_phase_bw(self, phase_bw):
        self.phase_bw = phase_bw
        self._phase_bw_slider.setValue(self.phase_bw)
        self.digital_costas_loop_cc_0.set_loop_bandwidth(self.phase_bw)

    def get_n(self):
        return self.n

    def set_n(self, n):
        self.n = n

    def get_matched_filter(self):
        return self.matched_filter

    def set_matched_filter(self, matched_filter):
        self.matched_filter = matched_filter

    def get_eq_gain(self):
        return self.eq_gain

    def set_eq_gain(self, eq_gain):
        self.eq_gain = eq_gain
        self.digital_cma_equalizer_cc_0.set_gain(self.eq_gain)
        self._eq_gain_slider.setValue(self.eq_gain)

    def get_arity(self):
        return self.arity

    def set_arity(self, arity):
        self.arity = arity

if __name__ == '__main__':
    import ctypes
    import os
    if os.name == 'posix':
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"
    parser = OptionParser(option_class=eng_option, usage="%prog: [options]")
    (options, args) = parser.parse_args()
    qapp = Qt.QApplication(sys.argv)
    tb = mpsk_rx()
    tb.start()
    tb.show()
    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()
    tb = None #to clean up Qt widgets

