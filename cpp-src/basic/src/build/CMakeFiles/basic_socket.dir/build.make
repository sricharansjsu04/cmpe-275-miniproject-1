# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.28.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.28.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build

# Include any dependencies generated for this target.
include CMakeFiles/basic_socket.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/basic_socket.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/basic_socket.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/basic_socket.dir/flags.make

CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o: CMakeFiles/basic_socket.dir/flags.make
CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o: /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/payload/basicbuilder.cpp
CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o: CMakeFiles/basic_socket.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o -MF CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o.d -o CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o -c /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/payload/basicbuilder.cpp

CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/payload/basicbuilder.cpp > CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.i

CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/payload/basicbuilder.cpp -o CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.s

CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o: CMakeFiles/basic_socket.dir/flags.make
CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o: /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/sessionhandler.cpp
CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o: CMakeFiles/basic_socket.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o -MF CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o.d -o CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o -c /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/sessionhandler.cpp

CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/sessionhandler.cpp > CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.i

CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/sessionhandler.cpp -o CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.s

CMakeFiles/basic_socket.dir/socket/client.cpp.o: CMakeFiles/basic_socket.dir/flags.make
CMakeFiles/basic_socket.dir/socket/client.cpp.o: /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/client.cpp
CMakeFiles/basic_socket.dir/socket/client.cpp.o: CMakeFiles/basic_socket.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/basic_socket.dir/socket/client.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/basic_socket.dir/socket/client.cpp.o -MF CMakeFiles/basic_socket.dir/socket/client.cpp.o.d -o CMakeFiles/basic_socket.dir/socket/client.cpp.o -c /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/client.cpp

CMakeFiles/basic_socket.dir/socket/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/basic_socket.dir/socket/client.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/client.cpp > CMakeFiles/basic_socket.dir/socket/client.cpp.i

CMakeFiles/basic_socket.dir/socket/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/basic_socket.dir/socket/client.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/client.cpp -o CMakeFiles/basic_socket.dir/socket/client.cpp.s

CMakeFiles/basic_socket.dir/socket/server.cpp.o: CMakeFiles/basic_socket.dir/flags.make
CMakeFiles/basic_socket.dir/socket/server.cpp.o: /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/server.cpp
CMakeFiles/basic_socket.dir/socket/server.cpp.o: CMakeFiles/basic_socket.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/basic_socket.dir/socket/server.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/basic_socket.dir/socket/server.cpp.o -MF CMakeFiles/basic_socket.dir/socket/server.cpp.o.d -o CMakeFiles/basic_socket.dir/socket/server.cpp.o -c /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/server.cpp

CMakeFiles/basic_socket.dir/socket/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/basic_socket.dir/socket/server.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/server.cpp > CMakeFiles/basic_socket.dir/socket/server.cpp.i

CMakeFiles/basic_socket.dir/socket/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/basic_socket.dir/socket/server.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/socket/server.cpp -o CMakeFiles/basic_socket.dir/socket/server.cpp.s

# Object files for target basic_socket
basic_socket_OBJECTS = \
"CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o" \
"CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o" \
"CMakeFiles/basic_socket.dir/socket/client.cpp.o" \
"CMakeFiles/basic_socket.dir/socket/server.cpp.o"

# External object files for target basic_socket
basic_socket_EXTERNAL_OBJECTS =

libbasic_socket.a: CMakeFiles/basic_socket.dir/payload/basicbuilder.cpp.o
libbasic_socket.a: CMakeFiles/basic_socket.dir/socket/sessionhandler.cpp.o
libbasic_socket.a: CMakeFiles/basic_socket.dir/socket/client.cpp.o
libbasic_socket.a: CMakeFiles/basic_socket.dir/socket/server.cpp.o
libbasic_socket.a: CMakeFiles/basic_socket.dir/build.make
libbasic_socket.a: CMakeFiles/basic_socket.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libbasic_socket.a"
	$(CMAKE_COMMAND) -P CMakeFiles/basic_socket.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/basic_socket.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/basic_socket.dir/build: libbasic_socket.a
.PHONY : CMakeFiles/basic_socket.dir/build

CMakeFiles/basic_socket.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/basic_socket.dir/cmake_clean.cmake
.PHONY : CMakeFiles/basic_socket.dir/clean

CMakeFiles/basic_socket.dir/depend:
	cd /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build /Users/charan/Desktop/SJSU/275/socket-3code/cpp-src/basic/src/build/CMakeFiles/basic_socket.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/basic_socket.dir/depend

