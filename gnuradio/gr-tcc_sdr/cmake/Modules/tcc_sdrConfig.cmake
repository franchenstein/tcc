INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_TCC_SDR tcc_sdr)

FIND_PATH(
    TCC_SDR_INCLUDE_DIRS
    NAMES tcc_sdr/api.h
    HINTS $ENV{TCC_SDR_DIR}/include
        ${PC_TCC_SDR_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    TCC_SDR_LIBRARIES
    NAMES gnuradio-tcc_sdr
    HINTS $ENV{TCC_SDR_DIR}/lib
        ${PC_TCC_SDR_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(TCC_SDR DEFAULT_MSG TCC_SDR_LIBRARIES TCC_SDR_INCLUDE_DIRS)
MARK_AS_ADVANCED(TCC_SDR_LIBRARIES TCC_SDR_INCLUDE_DIRS)

