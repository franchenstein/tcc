#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Mpsk Sim
# Generated: Sun Feb  8 07:11:38 2015
##################################################

from PyQt4 import Qt
from gnuradio import blocks
from gnuradio import channels
from gnuradio import digital
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import frame_detection
import sip
import sys
import tcc_sdr

class mpsk_sim(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Mpsk Sim")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Mpsk Sim")
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

        self.settings = Qt.QSettings("GNU Radio", "mpsk_sim")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.n = n = 4
        self.sps = sps = 4
        self.preamble = preamble = [1,-1,1,-1,1,1,-1,-1,1,1,-1,1,1,1,-1,1,1,-1,1,-1,-1,1,-1,-1,1,1,1,-1,-1,-1,1,-1,1,1,1,1,-1,-1,1,-1,1,-1,-1,-1,1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1]
        self.nfilts = nfilts = 32
        self.m = m = n
        self.eb = eb = 0.35
        self.timing_loop_bw = timing_loop_bw = 0.01
        self.time_offset = time_offset = 1.00
        self.taps = taps = [1.0, 0.25-0.25j, 0.50 + 0.10j, -0.3 + 0.2j]
        self.samp_rate = samp_rate = 32000
        self.rrc_taps = rrc_taps = firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, 11*sps*nfilts)
        self.qpsk = qpsk = digital.constellation_rect(([0.707+0.707j, -0.707+0.707j, -0.707-0.707j, 0.707-0.707j]), ([0, 1, 2, 3]), 4, 2, 2, 1, 1).base()
        self.phase_bw = phase_bw = 0.1
        self.payload_size = payload_size = 10000*n*m - len(preamble)/8
        self.packed_preamble = packed_preamble = [83, 34, 91, 29, 13, 115, -33, 3]
        self.noise_volt = noise_volt = 0
        self.matched_filter = matched_filter = firdes.root_raised_cosine(nfilts, nfilts, 1, eb, int(11*sps*nfilts))
        self.freq_offset = freq_offset = 0
        self.excess_bw = excess_bw = 0.35
        self.eq_gain = eq_gain = 0.01
        self.arity = arity = 4

        ##################################################
        # Blocks
        ##################################################
        self.controls = Qt.QTabWidget()
        self.controls_widget_0 = Qt.QWidget()
        self.controls_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.controls_widget_0)
        self.controls_grid_layout_0 = Qt.QGridLayout()
        self.controls_layout_0.addLayout(self.controls_grid_layout_0)
        self.controls.addTab(self.controls_widget_0, "Transmitter")
        self.controls_widget_1 = Qt.QWidget()
        self.controls_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.controls_widget_1)
        self.controls_grid_layout_1 = Qt.QGridLayout()
        self.controls_layout_1.addLayout(self.controls_grid_layout_1)
        self.controls.addTab(self.controls_widget_1, "Receiver")
        self.top_grid_layout.addWidget(self.controls, 0,0,1,2)
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
        self.controls_grid_layout_1.addLayout(self._timing_loop_bw_layout, 0,0,1,1)
        self._time_offset_layout = Qt.QVBoxLayout()
        self._time_offset_tool_bar = Qt.QToolBar(self)
        self._time_offset_layout.addWidget(self._time_offset_tool_bar)
        self._time_offset_tool_bar.addWidget(Qt.QLabel("Timing Offset"+": "))
        self._time_offset_counter = Qwt.QwtCounter()
        self._time_offset_counter.setRange(0.999, 1.001, 0.0001)
        self._time_offset_counter.setNumButtons(2)
        self._time_offset_counter.setValue(self.time_offset)
        self._time_offset_tool_bar.addWidget(self._time_offset_counter)
        self._time_offset_counter.valueChanged.connect(self.set_time_offset)
        self._time_offset_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._time_offset_slider.setRange(0.999, 1.001, 0.0001)
        self._time_offset_slider.setValue(self.time_offset)
        self._time_offset_slider.setMinimumWidth(200)
        self._time_offset_slider.valueChanged.connect(self.set_time_offset)
        self._time_offset_layout.addWidget(self._time_offset_slider)
        self.controls_grid_layout_0.addLayout(self._time_offset_layout,  0,2,1,1)
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
        self.controls_grid_layout_1.addLayout(self._phase_bw_layout, 0,2,1,1)
        self._noise_volt_layout = Qt.QVBoxLayout()
        self._noise_volt_tool_bar = Qt.QToolBar(self)
        self._noise_volt_layout.addWidget(self._noise_volt_tool_bar)
        self._noise_volt_tool_bar.addWidget(Qt.QLabel("Noise Voltage"+": "))
        self._noise_volt_counter = Qwt.QwtCounter()
        self._noise_volt_counter.setRange(0, 1, 0.01)
        self._noise_volt_counter.setNumButtons(2)
        self._noise_volt_counter.setValue(self.noise_volt)
        self._noise_volt_tool_bar.addWidget(self._noise_volt_counter)
        self._noise_volt_counter.valueChanged.connect(self.set_noise_volt)
        self._noise_volt_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._noise_volt_slider.setRange(0, 1, 0.01)
        self._noise_volt_slider.setValue(self.noise_volt)
        self._noise_volt_slider.setMinimumWidth(200)
        self._noise_volt_slider.valueChanged.connect(self.set_noise_volt)
        self._noise_volt_layout.addWidget(self._noise_volt_slider)
        self.controls_grid_layout_0.addLayout(self._noise_volt_layout,  0,0,1,1)
        self._freq_offset_layout = Qt.QVBoxLayout()
        self._freq_offset_tool_bar = Qt.QToolBar(self)
        self._freq_offset_layout.addWidget(self._freq_offset_tool_bar)
        self._freq_offset_tool_bar.addWidget(Qt.QLabel("Frequency Offset"+": "))
        self._freq_offset_counter = Qwt.QwtCounter()
        self._freq_offset_counter.setRange(-0.1, 0.1, 0.001)
        self._freq_offset_counter.setNumButtons(2)
        self._freq_offset_counter.setValue(self.freq_offset)
        self._freq_offset_tool_bar.addWidget(self._freq_offset_counter)
        self._freq_offset_counter.valueChanged.connect(self.set_freq_offset)
        self._freq_offset_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._freq_offset_slider.setRange(-0.1, 0.1, 0.001)
        self._freq_offset_slider.setValue(self.freq_offset)
        self._freq_offset_slider.setMinimumWidth(200)
        self._freq_offset_slider.valueChanged.connect(self.set_freq_offset)
        self._freq_offset_layout.addWidget(self._freq_offset_slider)
        self.controls_grid_layout_0.addLayout(self._freq_offset_layout,  0,1,1,1)
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
        self.controls_grid_layout_1.addLayout(self._eq_gain_layout, 0,1,1,1)
        self.tcc_sdr_interleaver_bb_2 = tcc_sdr.interleaver_bb(n, m)
        self.qtgui_time_sink_x_0 = qtgui.time_sink_c(
        	1024, #size
        	samp_rate, #samp_rate
        	"QT GUI Plot", #name
        	1 #number of inputs
        )
        self.qtgui_time_sink_x_0.set_update_time(0.10)
        self.qtgui_time_sink_x_0.set_y_axis(-1, 1)
        self.qtgui_time_sink_x_0.enable_tags(-1, True)
        self.qtgui_time_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, 0, "")
        self._qtgui_time_sink_x_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0.pyqwidget(), Qt.QWidget)
        self.controls_grid_layout_0.addWidget(self._qtgui_time_sink_x_0_win, 1,0,2,2)
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
        self.controls_grid_layout_1.addWidget(self._qtgui_sink_x_1_win, 1,0,2,2)
        
        
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
        self.controls_grid_layout_1.addWidget(self._qtgui_sink_x_0_win, 3,0,2,2)
        
        
        self.frame_detection_deinterleaver_bb_0 = frame_detection.deinterleaver_bb(n, n)
        self.digital_pfb_clock_sync_xxx_0 = digital.pfb_clock_sync_ccf(sps, timing_loop_bw, (rrc_taps), nfilts, nfilts/2, 1.5, 2)
        self.digital_diff_decoder_bb_0 = digital.diff_decoder_bb(4)
        self.digital_costas_loop_cc_0 = digital.costas_loop_cc(phase_bw, arity)
        self.digital_correlate_and_sync_cc_0 = digital.correlate_and_sync_cc((preamble), (matched_filter), sps)
        self.digital_constellation_modulator_0 = digital.generic_mod(
          constellation=qpsk,
          differential=True,
          samples_per_symbol=sps,
          pre_diff_code=True,
          excess_bw=excess_bw,
          verbose=False,
          log=False,
          )
        self.digital_constellation_decoder_cb_0 = digital.constellation_decoder_cb(qpsk)
        self.digital_cma_equalizer_cc_0 = digital.cma_equalizer_cc(15, 1, eq_gain, 2)
        self.channels_channel_model_0 = channels.channel_model(
        	noise_voltage=noise_volt,
        	frequency_offset=freq_offset,
        	epsilon=time_offset,
        	taps=(taps),
        	noise_seed=0,
        	block_tags=False
        )
        self.blocks_vector_source_x_0_0 = blocks.vector_source_b(map(lambda x: (-x+1)/2, preamble), True, 1, [])
        self.blocks_unpack_k_bits_bb_0 = blocks.unpack_k_bits_bb(2)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate)
        self.blocks_stream_mux_0_0_0 = blocks.stream_mux(gr.sizeof_char*1, (len(preamble)/8,payload_size))
        self.blocks_skiphead_0 = blocks.skiphead(gr.sizeof_char*1, n*m)
        self.blocks_pack_k_bits_bb_1 = blocks.pack_k_bits_bb(8)
        self.blocks_pack_k_bits_bb_0 = blocks.pack_k_bits_bb(8)
        self.blocks_null_sink_0 = blocks.null_sink(gr.sizeof_gr_complex*1)
        self.blocks_file_source_0 = blocks.file_source(gr.sizeof_char*1, "/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/tx_teste.txt", True)
        self.blocks_file_sink_0 = blocks.file_sink(gr.sizeof_char*1, "/home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/rx_teste.txt", False)
        self.blocks_file_sink_0.set_unbuffered(True)
        self.blocks_delay_0 = blocks.delay(gr.sizeof_char*1, 2342)
        self.blocks_char_to_float_0 = blocks.char_to_float(1, 1)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_stream_mux_0_0_0, 0), (self.digital_constellation_modulator_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0, 0), (self.blocks_stream_mux_0_0_0, 0))
        self.connect((self.blocks_vector_source_x_0_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.digital_constellation_modulator_0, 0), (self.qtgui_time_sink_x_0, 0))
        self.connect((self.blocks_char_to_float_0, 0), (self.qtgui_sink_x_0, 0))
        self.connect((self.digital_correlate_and_sync_cc_0, 1), (self.blocks_null_sink_0, 0))
        self.connect((self.digital_correlate_and_sync_cc_0, 0), (self.digital_pfb_clock_sync_xxx_0, 0))
        self.connect((self.digital_cma_equalizer_cc_0, 0), (self.digital_costas_loop_cc_0, 0))
        self.connect((self.channels_channel_model_0, 0), (self.digital_correlate_and_sync_cc_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.blocks_throttle_0, 0), (self.qtgui_sink_x_1, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.digital_constellation_decoder_cb_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_char_to_float_0, 0))
        self.connect((self.digital_constellation_modulator_0, 0), (self.channels_channel_model_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.digital_cma_equalizer_cc_0, 0))
        self.connect((self.blocks_file_source_0, 0), (self.tcc_sdr_interleaver_bb_2, 0))
        self.connect((self.digital_constellation_decoder_cb_0, 0), (self.digital_diff_decoder_bb_0, 0))
        self.connect((self.digital_diff_decoder_bb_0, 0), (self.blocks_unpack_k_bits_bb_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_pack_k_bits_bb_1, 0))
        self.connect((self.frame_detection_deinterleaver_bb_0, 0), (self.blocks_file_sink_0, 0))
        self.connect((self.tcc_sdr_interleaver_bb_2, 0), (self.blocks_skiphead_0, 0))
        self.connect((self.blocks_skiphead_0, 0), (self.blocks_stream_mux_0_0_0, 1))
        self.connect((self.blocks_pack_k_bits_bb_1, 0), (self.blocks_delay_0, 0))
        self.connect((self.blocks_delay_0, 0), (self.frame_detection_deinterleaver_bb_0, 0))


# QT sink close method reimplementation
    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "mpsk_sim")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_n(self):
        return self.n

    def set_n(self, n):
        self.n = n
        self.set_m(self.n)
        self.set_payload_size(10000*self.n*self.m - len(self.preamble)/8)

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.set_rrc_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_preamble(self):
        return self.preamble

    def set_preamble(self, preamble):
        self.preamble = preamble
        self.set_payload_size(10000*self.n*self.m - len(self.preamble)/8)

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.set_rrc_taps(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_m(self):
        return self.m

    def set_m(self, m):
        self.m = m
        self.set_payload_size(10000*self.n*self.m - len(self.preamble)/8)

    def get_eb(self):
        return self.eb

    def set_eb(self, eb):
        self.eb = eb
        self.set_matched_filter(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1, self.eb, int(11*self.sps*self.nfilts)))

    def get_timing_loop_bw(self):
        return self.timing_loop_bw

    def set_timing_loop_bw(self, timing_loop_bw):
        self.timing_loop_bw = timing_loop_bw
        self._timing_loop_bw_slider.setValue(self.timing_loop_bw)
        self.digital_pfb_clock_sync_xxx_0.set_loop_bandwidth(self.timing_loop_bw)

    def get_time_offset(self):
        return self.time_offset

    def set_time_offset(self, time_offset):
        self.time_offset = time_offset
        self._time_offset_counter.setValue(self.time_offset)
        self._time_offset_slider.setValue(self.time_offset)
        self.channels_channel_model_0.set_timing_offset(self.time_offset)

    def get_taps(self):
        return self.taps

    def set_taps(self, taps):
        self.taps = taps
        self.channels_channel_model_0.set_taps((self.taps))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.qtgui_time_sink_x_0.set_samp_rate(self.samp_rate)
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
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

    def get_phase_bw(self):
        return self.phase_bw

    def set_phase_bw(self, phase_bw):
        self.phase_bw = phase_bw
        self._phase_bw_slider.setValue(self.phase_bw)
        self.digital_costas_loop_cc_0.set_loop_bandwidth(self.phase_bw)

    def get_payload_size(self):
        return self.payload_size

    def set_payload_size(self, payload_size):
        self.payload_size = payload_size

    def get_packed_preamble(self):
        return self.packed_preamble

    def set_packed_preamble(self, packed_preamble):
        self.packed_preamble = packed_preamble

    def get_noise_volt(self):
        return self.noise_volt

    def set_noise_volt(self, noise_volt):
        self.noise_volt = noise_volt
        self._noise_volt_counter.setValue(self.noise_volt)
        self._noise_volt_slider.setValue(self.noise_volt)
        self.channels_channel_model_0.set_noise_voltage(self.noise_volt)

    def get_matched_filter(self):
        return self.matched_filter

    def set_matched_filter(self, matched_filter):
        self.matched_filter = matched_filter

    def get_freq_offset(self):
        return self.freq_offset

    def set_freq_offset(self, freq_offset):
        self.freq_offset = freq_offset
        self._freq_offset_counter.setValue(self.freq_offset)
        self._freq_offset_slider.setValue(self.freq_offset)
        self.channels_channel_model_0.set_frequency_offset(self.freq_offset)

    def get_excess_bw(self):
        return self.excess_bw

    def set_excess_bw(self, excess_bw):
        self.excess_bw = excess_bw

    def get_eq_gain(self):
        return self.eq_gain

    def set_eq_gain(self, eq_gain):
        self.eq_gain = eq_gain
        self._eq_gain_slider.setValue(self.eq_gain)
        self.digital_cma_equalizer_cc_0.set_gain(self.eq_gain)

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
    tb = mpsk_sim()
    tb.start()
    tb.show()
    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()
    tb = None #to clean up Qt widgets

