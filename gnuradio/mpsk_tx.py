#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: MPSK Transmitter
# Author: Daniel Franch
# Generated: Fri Jan 16 00:30:36 2015
##################################################

from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
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
import sip
import sys
import tcc_sdr
import time

class mpsk_tx(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "MPSK Transmitter")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("MPSK Transmitter")
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

        self.settings = Qt.QSettings("GNU Radio", "mpsk_tx")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.usrp_gain = usrp_gain = 20
        self.sps = sps = 4
        self.samp_rate = samp_rate = 1e6
        self.qpsk = qpsk = digital.constellation_rect(([0.707+0.707j, -0.707+0.707j, -0.707-0.707j, 0.707-0.707j]), ([0, 1, 2, 3]), 4, 2, 2, 1, 1).base()
        self.preamble = preamble = [1,-1,1,-1,1,1,-1,-1,1,1,-1,1,1,1,-1,1,1,-1,1,-1,-1,1,-1,-1,1,1,1,-1,-1,-1,1,-1,1,1,1,1,-1,-1,1,-1,1,-1,-1,-1,1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1]
        self.payload_size = payload_size = 992
        self.n = n = 4
        self.excess_bw = excess_bw = 0.35
        self.arity = arity = 4

        ##################################################
        # Blocks
        ##################################################
        self._usrp_gain_layout = Qt.QVBoxLayout()
        self._usrp_gain_tool_bar = Qt.QToolBar(self)
        self._usrp_gain_layout.addWidget(self._usrp_gain_tool_bar)
        self._usrp_gain_tool_bar.addWidget(Qt.QLabel("USRP Gain"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._usrp_gain_counter = qwt_counter_pyslot()
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
        self.uhd_usrp_sink_0 = uhd.usrp_sink(
        	device_addr="",
        	stream_args=uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_sink_0.set_samp_rate(samp_rate)
        self.uhd_usrp_sink_0.set_center_freq(2.4e9, 0)
        self.uhd_usrp_sink_0.set_gain(usrp_gain, 0)
        self.tcc_sdr_interleaver_bb_0 = tcc_sdr.interleaver_bb(n, n)
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
        self.qtgui_time_sink_x_0.enable_autoscale(False)
        
        labels = ["", "", "", "", "",
                  "", "", "", "", ""]
        widths = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        colors = ["blue", "red", "green", "black", "cyan",
                  "magenta", "yellow", "dark red", "dark green", "blue"]
        styles = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        markers = [-1, -1, -1, -1, -1,
                   -1, -1, -1, -1, -1]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
                  1.0, 1.0, 1.0, 1.0, 1.0]
        
        for i in xrange(2*1):
            if len(labels[i]) == 0:
                if(i % 2 == 0):
                    self.qtgui_time_sink_x_0.set_line_label(i, "Re{{Data {0}}}".format(i/2))
                else:
                    self.qtgui_time_sink_x_0.set_line_label(i, "Im{{Data {0}}}".format(i/2))
            else:
                self.qtgui_time_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_time_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_time_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_time_sink_x_0.set_line_style(i, styles[i])
            self.qtgui_time_sink_x_0.set_line_marker(i, markers[i])
            self.qtgui_time_sink_x_0.set_line_alpha(i, alphas[i])
        
        self._qtgui_time_sink_x_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_time_sink_x_0_win)
        self.digital_constellation_modulator_0 = digital.generic_mod(
          constellation=qpsk,
          differential=True,
          samples_per_symbol=sps,
          pre_diff_code=True,
          excess_bw=excess_bw,
          verbose=False,
          log=False,
          )
        self.blocks_vector_source_x_0_0 = blocks.vector_source_b(map(lambda x: (-x+1)/2, preamble), True, 1, [])
        self.blocks_stream_mux_0_0_0 = blocks.stream_mux(gr.sizeof_char*1, (len(preamble)/8,payload_size))
        self.blocks_pack_k_bits_bb_0 = blocks.pack_k_bits_bb(8)
        self.blocks_file_source_0 = blocks.file_source(gr.sizeof_char*1, "/home/franchz/tcc/gnuradio/tx_teste.txt", True)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.digital_constellation_modulator_0, 0), (self.qtgui_time_sink_x_0, 0))
        self.connect((self.digital_constellation_modulator_0, 0), (self.uhd_usrp_sink_0, 0))
        self.connect((self.blocks_stream_mux_0_0_0, 0), (self.digital_constellation_modulator_0, 0))
        self.connect((self.blocks_pack_k_bits_bb_0, 0), (self.blocks_stream_mux_0_0_0, 0))
        self.connect((self.blocks_vector_source_x_0_0, 0), (self.blocks_pack_k_bits_bb_0, 0))
        self.connect((self.blocks_file_source_0, 0), (self.tcc_sdr_interleaver_bb_0, 0))
        self.connect((self.tcc_sdr_interleaver_bb_0, 0), (self.blocks_stream_mux_0_0_0, 1))


# QT sink close method reimplementation
    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "mpsk_tx")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_usrp_gain(self):
        return self.usrp_gain

    def set_usrp_gain(self, usrp_gain):
        self.usrp_gain = usrp_gain
        self.uhd_usrp_sink_0.set_gain(self.usrp_gain, 0)
        Qt.QMetaObject.invokeMethod(self._usrp_gain_counter, "setValue", Qt.Q_ARG("double", self.usrp_gain))
        Qt.QMetaObject.invokeMethod(self._usrp_gain_slider, "setValue", Qt.Q_ARG("double", self.usrp_gain))

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.uhd_usrp_sink_0.set_samp_rate(self.samp_rate)
        self.qtgui_time_sink_x_0.set_samp_rate(self.samp_rate)

    def get_qpsk(self):
        return self.qpsk

    def set_qpsk(self, qpsk):
        self.qpsk = qpsk

    def get_preamble(self):
        return self.preamble

    def set_preamble(self, preamble):
        self.preamble = preamble

    def get_payload_size(self):
        return self.payload_size

    def set_payload_size(self, payload_size):
        self.payload_size = payload_size

    def get_n(self):
        return self.n

    def set_n(self, n):
        self.n = n

    def get_excess_bw(self):
        return self.excess_bw

    def set_excess_bw(self, excess_bw):
        self.excess_bw = excess_bw

    def get_arity(self):
        return self.arity

    def set_arity(self, arity):
        self.arity = arity

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"
    parser = OptionParser(option_class=eng_option, usage="%prog: [options]")
    (options, args) = parser.parse_args()
    Qt.QApplication.setGraphicsSystem(gr.prefs().get_string('qtgui','style','raster'))
    qapp = Qt.QApplication(sys.argv)
    tb = mpsk_tx()
    tb.start()
    tb.show()
    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()
    tb = None #to clean up Qt widgets

