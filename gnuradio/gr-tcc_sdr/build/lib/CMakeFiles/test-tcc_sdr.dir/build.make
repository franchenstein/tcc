# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/tcc/gnuradio/gr-tcc_sdr

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/test-tcc_sdr.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/test-tcc_sdr.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/test-tcc_sdr.dir/flags.make

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o: lib/CMakeFiles/test-tcc_sdr.dir/flags.make
lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o: ../lib/test_tcc_sdr.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o -c /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/test_tcc_sdr.cc

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.i"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/test_tcc_sdr.cc > CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.i

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.s"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/test_tcc_sdr.cc -o CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.s

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.requires:
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.requires

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.provides: lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-tcc_sdr.dir/build.make lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.provides

lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.provides.build: lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o: lib/CMakeFiles/test-tcc_sdr.dir/flags.make
lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o: ../lib/qa_tcc_sdr.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o -c /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/qa_tcc_sdr.cc

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.i"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/qa_tcc_sdr.cc > CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.i

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.s"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib/qa_tcc_sdr.cc -o CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.s

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.requires:
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.requires

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.provides: lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-tcc_sdr.dir/build.make lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.provides

lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.provides.build: lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o

# Object files for target test-tcc_sdr
test__tcc_sdr_OBJECTS = \
"CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o" \
"CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o"

# External object files for target test-tcc_sdr
test__tcc_sdr_EXTERNAL_OBJECTS =

lib/test-tcc_sdr: lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o
lib/test-tcc_sdr: lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o
lib/test-tcc_sdr: /usr/local/lib/libgnuradio-runtime.so
lib/test-tcc_sdr: /usr/local/lib/libgnuradio-pmt.so
lib/test-tcc_sdr: /usr/lib/libboost_filesystem-mt.so
lib/test-tcc_sdr: /usr/lib/libboost_system-mt.so
lib/test-tcc_sdr: /usr/lib/libcppunit.so
lib/test-tcc_sdr: lib/libgnuradio-tcc_sdr.so
lib/test-tcc_sdr: /usr/local/lib/libgnuradio-runtime.so
lib/test-tcc_sdr: /usr/local/lib/libgnuradio-pmt.so
lib/test-tcc_sdr: /usr/lib/libboost_filesystem-mt.so
lib/test-tcc_sdr: /usr/lib/libboost_system-mt.so
lib/test-tcc_sdr: lib/CMakeFiles/test-tcc_sdr.dir/build.make
lib/test-tcc_sdr: lib/CMakeFiles/test-tcc_sdr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-tcc_sdr"
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-tcc_sdr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/test-tcc_sdr.dir/build: lib/test-tcc_sdr
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/build

lib/CMakeFiles/test-tcc_sdr.dir/requires: lib/CMakeFiles/test-tcc_sdr.dir/test_tcc_sdr.cc.o.requires
lib/CMakeFiles/test-tcc_sdr.dir/requires: lib/CMakeFiles/test-tcc_sdr.dir/qa_tcc_sdr.cc.o.requires
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/requires

lib/CMakeFiles/test-tcc_sdr.dir/clean:
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/test-tcc_sdr.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/clean

lib/CMakeFiles/test-tcc_sdr.dir/depend:
	cd /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/tcc/gnuradio/gr-tcc_sdr /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/lib /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib /home/ubuntu/tcc/gnuradio/gr-tcc_sdr/build/lib/CMakeFiles/test-tcc_sdr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/test-tcc_sdr.dir/depend
