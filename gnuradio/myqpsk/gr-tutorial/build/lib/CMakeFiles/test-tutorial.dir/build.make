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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/test-tutorial.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/test-tutorial.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/test-tutorial.dir/flags.make

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o: lib/CMakeFiles/test-tutorial.dir/flags.make
lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o: ../lib/test_tutorial.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-tutorial.dir/test_tutorial.cc.o -c /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/test_tutorial.cc

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-tutorial.dir/test_tutorial.cc.i"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/test_tutorial.cc > CMakeFiles/test-tutorial.dir/test_tutorial.cc.i

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-tutorial.dir/test_tutorial.cc.s"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/test_tutorial.cc -o CMakeFiles/test-tutorial.dir/test_tutorial.cc.s

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.requires:
.PHONY : lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.requires

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.provides: lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-tutorial.dir/build.make lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.provides

lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.provides.build: lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o: lib/CMakeFiles/test-tutorial.dir/flags.make
lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o: ../lib/qa_tutorial.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o -c /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_tutorial.cc

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-tutorial.dir/qa_tutorial.cc.i"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_tutorial.cc > CMakeFiles/test-tutorial.dir/qa_tutorial.cc.i

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-tutorial.dir/qa_tutorial.cc.s"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_tutorial.cc -o CMakeFiles/test-tutorial.dir/qa_tutorial.cc.s

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.requires:
.PHONY : lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.requires

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.provides: lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-tutorial.dir/build.make lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.provides

lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.provides.build: lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o: lib/CMakeFiles/test-tutorial.dir/flags.make
lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o: ../lib/qa_my_qpsk_demod_cb.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o -c /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_my_qpsk_demod_cb.cc

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.i"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_my_qpsk_demod_cb.cc > CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.i

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.s"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib/qa_my_qpsk_demod_cb.cc -o CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.s

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.requires:
.PHONY : lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.requires

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.provides: lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-tutorial.dir/build.make lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.provides

lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.provides.build: lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o

# Object files for target test-tutorial
test__tutorial_OBJECTS = \
"CMakeFiles/test-tutorial.dir/test_tutorial.cc.o" \
"CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o" \
"CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o"

# External object files for target test-tutorial
test__tutorial_EXTERNAL_OBJECTS =

lib/test-tutorial: lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o
lib/test-tutorial: lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o
lib/test-tutorial: lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o
lib/test-tutorial: lib/CMakeFiles/test-tutorial.dir/build.make
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libgnuradio-runtime.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libcppunit.so
lib/test-tutorial: lib/libgnuradio-tutorial.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libgnuradio-runtime.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-tutorial: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-tutorial: lib/CMakeFiles/test-tutorial.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-tutorial"
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-tutorial.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/test-tutorial.dir/build: lib/test-tutorial
.PHONY : lib/CMakeFiles/test-tutorial.dir/build

lib/CMakeFiles/test-tutorial.dir/requires: lib/CMakeFiles/test-tutorial.dir/test_tutorial.cc.o.requires
lib/CMakeFiles/test-tutorial.dir/requires: lib/CMakeFiles/test-tutorial.dir/qa_tutorial.cc.o.requires
lib/CMakeFiles/test-tutorial.dir/requires: lib/CMakeFiles/test-tutorial.dir/qa_my_qpsk_demod_cb.cc.o.requires
.PHONY : lib/CMakeFiles/test-tutorial.dir/requires

lib/CMakeFiles/test-tutorial.dir/clean:
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/test-tutorial.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/test-tutorial.dir/clean

lib/CMakeFiles/test-tutorial.dir/depend:
	cd /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/lib /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib /home/franchz/tcc/gnuradio/myqpsk/gr-tutorial/build/lib/CMakeFiles/test-tutorial.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/test-tutorial.dir/depend

