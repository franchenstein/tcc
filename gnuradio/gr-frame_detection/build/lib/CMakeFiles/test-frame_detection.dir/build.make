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
CMAKE_SOURCE_DIR = /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/test-frame_detection.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/test-frame_detection.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/test-frame_detection.dir/flags.make

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o: lib/CMakeFiles/test-frame_detection.dir/flags.make
lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o: ../lib/test_frame_detection.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o -c /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/test_frame_detection.cc

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.i"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/test_frame_detection.cc > CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.i

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.s"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/test_frame_detection.cc -o CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.s

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.requires:
.PHONY : lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.requires

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.provides: lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-frame_detection.dir/build.make lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.provides

lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.provides.build: lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o: lib/CMakeFiles/test-frame_detection.dir/flags.make
lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o: ../lib/qa_frame_detection.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o -c /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/qa_frame_detection.cc

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.i"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/qa_frame_detection.cc > CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.i

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.s"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib/qa_frame_detection.cc -o CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.s

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.requires:
.PHONY : lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.requires

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.provides: lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-frame_detection.dir/build.make lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.provides

lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.provides.build: lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o

# Object files for target test-frame_detection
test__frame_detection_OBJECTS = \
"CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o" \
"CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o"

# External object files for target test-frame_detection
test__frame_detection_EXTERNAL_OBJECTS =

lib/test-frame_detection: lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o
lib/test-frame_detection: lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o
lib/test-frame_detection: lib/CMakeFiles/test-frame_detection.dir/build.make
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libgnuradio-runtime.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libcppunit.so
lib/test-frame_detection: lib/libgnuradio-frame_detection.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libgnuradio-runtime.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-frame_detection: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-frame_detection: lib/CMakeFiles/test-frame_detection.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-frame_detection"
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-frame_detection.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/test-frame_detection.dir/build: lib/test-frame_detection
.PHONY : lib/CMakeFiles/test-frame_detection.dir/build

lib/CMakeFiles/test-frame_detection.dir/requires: lib/CMakeFiles/test-frame_detection.dir/test_frame_detection.cc.o.requires
lib/CMakeFiles/test-frame_detection.dir/requires: lib/CMakeFiles/test-frame_detection.dir/qa_frame_detection.cc.o.requires
.PHONY : lib/CMakeFiles/test-frame_detection.dir/requires

lib/CMakeFiles/test-frame_detection.dir/clean:
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/test-frame_detection.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/test-frame_detection.dir/clean

lib/CMakeFiles/test-frame_detection.dir/depend:
	cd /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/lib /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib /home/franchz/Documents/UTFPR/10o_periodo/TCC2/projeto/tcc/gnuradio/gr-frame_detection/build/lib/CMakeFiles/test-frame_detection.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/test-frame_detection.dir/depend

