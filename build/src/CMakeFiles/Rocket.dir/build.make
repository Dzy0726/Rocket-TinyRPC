# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/ubuntu/Rocket-TinyRPC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Rocket-TinyRPC/build

# Include any dependencies generated for this target.
include src/CMakeFiles/Rocket.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/Rocket.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/Rocket.dir/flags.make

src/CMakeFiles/Rocket.dir/RocketApplication.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RocketApplication.cc.o: ../src/RocketApplication.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/Rocket.dir/RocketApplication.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RocketApplication.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RocketApplication.cc

src/CMakeFiles/Rocket.dir/RocketApplication.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RocketApplication.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RocketApplication.cc > CMakeFiles/Rocket.dir/RocketApplication.cc.i

src/CMakeFiles/Rocket.dir/RocketApplication.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RocketApplication.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RocketApplication.cc -o CMakeFiles/Rocket.dir/RocketApplication.cc.s

src/CMakeFiles/Rocket.dir/RocketConfig.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RocketConfig.cc.o: ../src/RocketConfig.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/Rocket.dir/RocketConfig.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RocketConfig.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RocketConfig.cc

src/CMakeFiles/Rocket.dir/RocketConfig.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RocketConfig.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RocketConfig.cc > CMakeFiles/Rocket.dir/RocketConfig.cc.i

src/CMakeFiles/Rocket.dir/RocketConfig.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RocketConfig.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RocketConfig.cc -o CMakeFiles/Rocket.dir/RocketConfig.cc.s

src/CMakeFiles/Rocket.dir/RpcProvider.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RpcProvider.cc.o: ../src/RpcProvider.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/Rocket.dir/RpcProvider.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RpcProvider.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RpcProvider.cc

src/CMakeFiles/Rocket.dir/RpcProvider.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RpcProvider.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RpcProvider.cc > CMakeFiles/Rocket.dir/RpcProvider.cc.i

src/CMakeFiles/Rocket.dir/RpcProvider.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RpcProvider.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RpcProvider.cc -o CMakeFiles/Rocket.dir/RpcProvider.cc.s

# Object files for target Rocket
Rocket_OBJECTS = \
"CMakeFiles/Rocket.dir/RocketApplication.cc.o" \
"CMakeFiles/Rocket.dir/RocketConfig.cc.o" \
"CMakeFiles/Rocket.dir/RpcProvider.cc.o"

# External object files for target Rocket
Rocket_EXTERNAL_OBJECTS =

../lib/libRocket.so: src/CMakeFiles/Rocket.dir/RocketApplication.cc.o
../lib/libRocket.so: src/CMakeFiles/Rocket.dir/RocketConfig.cc.o
../lib/libRocket.so: src/CMakeFiles/Rocket.dir/RpcProvider.cc.o
../lib/libRocket.so: src/CMakeFiles/Rocket.dir/build.make
../lib/libRocket.so: src/CMakeFiles/Rocket.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library ../../lib/libRocket.so"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Rocket.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/Rocket.dir/build: ../lib/libRocket.so

.PHONY : src/CMakeFiles/Rocket.dir/build

src/CMakeFiles/Rocket.dir/clean:
	cd /home/ubuntu/Rocket-TinyRPC/build/src && $(CMAKE_COMMAND) -P CMakeFiles/Rocket.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/Rocket.dir/clean

src/CMakeFiles/Rocket.dir/depend:
	cd /home/ubuntu/Rocket-TinyRPC/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Rocket-TinyRPC /home/ubuntu/Rocket-TinyRPC/src /home/ubuntu/Rocket-TinyRPC/build /home/ubuntu/Rocket-TinyRPC/build/src /home/ubuntu/Rocket-TinyRPC/build/src/CMakeFiles/Rocket.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/Rocket.dir/depend

