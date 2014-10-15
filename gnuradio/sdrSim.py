#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: SDR Simulation
# Author: Daniel Franch
# Generated: Wed Oct 15 14:21:45 2014
##################################################

execfile("/home/ubuntu/.grc_gnuradio/bitErrorRate.py")
execfile("/home/ubuntu/.grc_gnuradio/sdrRX.py")
execfile("/home/ubuntu/.grc_gnuradio/sdrTX.py")
from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
from gnuradio import blocks
from gnuradio import channels
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import sip
import sys

class sdrSim(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "SDR Simulation")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("SDR Simulation")
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

        self.settings = Qt.QSettings("GNU Radio", "sdrSim")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.time_offset = time_offset = 1
        self.taps = taps = [1.0, 0.25-0.25j, 0.50 + 0.10j, -0.3 + 0.2j]
        self.samp_rate = samp_rate = 32000
        self.noise_volt = noise_volt = 0.0001
        self.freq_offset = freq_offset = 0

        ##################################################
        # Blocks
        ##################################################
        self._time_offset_layout = Qt.QVBoxLayout()
        self._time_offset_tool_bar = Qt.QToolBar(self)
        self._time_offset_layout.addWidget(self._time_offset_tool_bar)
        self._time_offset_tool_bar.addWidget(Qt.QLabel("Channel Timing Offset"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._time_offset_counter = qwt_counter_pyslot()
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
        self.top_layout.addLayout(self._time_offset_layout)
        self._noise_volt_layout = Qt.QVBoxLayout()
        self._noise_volt_tool_bar = Qt.QToolBar(self)
        self._noise_volt_layout.addWidget(self._noise_volt_tool_bar)
        self._noise_volt_tool_bar.addWidget(Qt.QLabel("Channel Noise Voltage"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._noise_volt_counter = qwt_counter_pyslot()
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
        self.top_layout.addLayout(self._noise_volt_layout)
        self._freq_offset_layout = Qt.QVBoxLayout()
        self._freq_offset_tool_bar = Qt.QToolBar(self)
        self._freq_offset_layout.addWidget(self._freq_offset_tool_bar)
        self._freq_offset_tool_bar.addWidget(Qt.QLabel("Channel Frequency Offset"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._freq_offset_counter = qwt_counter_pyslot()
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
        self.top_layout.addLayout(self._freq_offset_layout)
        self.sdrTX_0 = sdrTX()
        self.sdrRX_0 = sdrRX()
        self.channels_channel_model_0 = channels.channel_model(
        	noise_voltage=noise_volt,
        	frequency_offset=freq_offset,
        	epsilon=time_offset,
        	taps=(taps),
        	noise_seed=0,
        	block_tags=False
        )
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_char*1, samp_rate,True)
        self.blocks_multiply_const_vxx_0 = blocks.multiply_const_vff((100, ))
        self.bitErrorRate_0 = bitErrorRate()
        self.ber = qtgui.number_sink(
                gr.sizeof_float,
                0,
                qtgui.NUM_GRAPH_NONE,
        	1
        )
        self.ber.set_update_time(0.10)
        
        labels = ["BER (in %)", "", "", "", "",
                  "", "", "", "", ""]
        colors = [("black", "black"), ("black", "black"), ("black", "black"), ("black", "black"), ("black", "black"),
                  ("black", "black"), ("black", "black"), ("black", "black"), ("black", "black"), ("black", "black")]
        for i in xrange(1):
            self.ber.set_min(i, 0)
            self.ber.set_max(i, 100)
            self.ber.set_color(i, colors[i][0], colors[i][1])
            if len(labels[i]) == 0:
                self.ber.set_label(i, "Data {0}".format(i))
            else:
                self.ber.set_label(i, labels[i])
        
        self.ber.enable_autoscale(False)
        self._ber_win = sip.wrapinstance(self.ber.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._ber_win)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.sdrRX_0, 0), (self.bitErrorRate_0, 1))
        self.connect((self.sdrTX_0, 1), (self.channels_channel_model_0, 0))
        self.connect((self.channels_channel_model_0, 0), (self.sdrRX_0, 0))
        self.connect((self.sdrTX_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.blocks_throttle_0, 0), (self.bitErrorRate_0, 0))
        self.connect((self.blocks_multiply_const_vxx_0, 0), (self.ber, 0))
        self.connect((self.bitErrorRate_0, 0), (self.blocks_multiply_const_vxx_0, 0))


# QT sink close method reimplementation
    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "sdrSim")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_time_offset(self):
        return self.time_offset

    def set_time_offset(self, time_offset):
        self.time_offset = time_offset
        self.channels_channel_model_0.set_timing_offset(self.time_offset)
        Qt.QMetaObject.invokeMethod(self._time_offset_counter, "setValue", Qt.Q_ARG("double", self.time_offset))
        Qt.QMetaObject.invokeMethod(self._time_offset_slider, "setValue", Qt.Q_ARG("double", self.time_offset))

    def get_taps(self):
        return self.taps

    def set_taps(self, taps):
        self.taps = taps
        self.channels_channel_model_0.set_taps((self.taps))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)

    def get_noise_volt(self):
        return self.noise_volt

    def set_noise_volt(self, noise_volt):
        self.noise_volt = noise_volt
        self.channels_channel_model_0.set_noise_voltage(self.noise_volt)
        Qt.QMetaObject.invokeMethod(self._noise_volt_counter, "setValue", Qt.Q_ARG("double", self.noise_volt))
        Qt.QMetaObject.invokeMethod(self._noise_volt_slider, "setValue", Qt.Q_ARG("double", self.noise_volt))

    def get_freq_offset(self):
        return self.freq_offset

    def set_freq_offset(self, freq_offset):
        self.freq_offset = freq_offset
        self.channels_channel_model_0.set_frequency_offset(self.freq_offset)
        Qt.QMetaObject.invokeMethod(self._freq_offset_counter, "setValue", Qt.Q_ARG("double", self.freq_offset))
        Qt.QMetaObject.invokeMethod(self._freq_offset_slider, "setValue", Qt.Q_ARG("double", self.freq_offset))

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
    tb = sdrSim()
    tb.start()
    tb.show()
    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()
    tb = None #to clean up Qt widgets

