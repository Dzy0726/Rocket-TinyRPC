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
include example/callee/CMakeFiles/provider.dir/depend.make

# Include the progress variables for this target.
include example/callee/CMakeFiles/provider.dir/progress.make

# Include the compile flags for this target's objects.
include example/callee/CMakeFiles/provider.dir/flags.make

example/callee/CMakeFiles/provider.dir/UserService.cc.o: example/callee/CMakeFiles/provider.dir/flags.make
example/callee/CMakeFiles/provider.dir/UserService.cc.o: ../example/callee/UserService.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/callee/CMakeFiles/provider.dir/UserService.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/provider.dir/UserService.cc.o -c /home/ubuntu/Rocket-TinyRPC/example/callee/UserService.cc

example/callee/CMakeFiles/provider.dir/UserService.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/provider.dir/UserService.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/example/callee/UserService.cc > CMakeFiles/provider.dir/UserService.cc.i

example/callee/CMakeFiles/provider.dir/UserService.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/provider.dir/UserService.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/example/callee/UserService.cc -o CMakeFiles/provider.dir/UserService.cc.s

example/callee/CMakeFiles/provider.dir/__/user.pb.cc.o: example/callee/CMakeFiles/provider.dir/flags.make
example/callee/CMakeFiles/provider.dir/__/user.pb.cc.o: ../example/user.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object example/callee/CMakeFiles/provider.dir/__/user.pb.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/provider.dir/__/user.pb.cc.o -c /home/ubuntu/Rocket-TinyRPC/example/user.pb.cc

example/callee/CMakeFiles/provider.dir/__/user.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/provider.dir/__/user.pb.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/example/user.pb.cc > CMakeFiles/provider.dir/__/user.pb.cc.i

example/callee/CMakeFiles/provider.dir/__/user.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/provider.dir/__/user.pb.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/example/user.pb.cc -o CMakeFiles/provider.dir/__/user.pb.cc.s

# Object files for target provider
provider_OBJECTS = \
"CMakeFiles/provider.dir/UserService.cc.o" \
"CMakeFiles/provider.dir/__/user.pb.cc.o"

# External object files for target provider
provider_EXTERNAL_OBJECTS =

../bin/provider: example/callee/CMakeFiles/provider.dir/UserService.cc.o
../bin/provider: example/callee/CMakeFiles/provider.dir/__/user.pb.cc.o
../bin/provider: example/callee/CMakeFiles/provider.dir/build.make
../bin/provider: ../lib/libRocket.so
../bin/provider: example/callee/CMakeFiles/provider.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../bin/provider"
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/provider.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/callee/CMakeFiles/provider.dir/build: ../bin/provider

.PHONY : example/callee/CMakeFiles/provider.dir/build

example/callee/CMakeFiles/provider.dir/clean:
	cd /home/ubuntu/Rocket-TinyRPC/build/example/callee && $(CMAKE_COMMAND) -P CMakeFiles/provider.dir/cmake_clean.cmake
.PHONY : example/callee/CMakeFiles/provider.dir/clean

example/callee/CMakeFiles/provider.dir/depend:
	cd /home/ubuntu/Rocket-TinyRPC/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Rocket-TinyRPC /home/ubuntu/Rocket-TinyRPC/example/callee /home/ubuntu/Rocket-TinyRPC/build /home/ubuntu/Rocket-TinyRPC/build/example/callee /home/ubuntu/Rocket-TinyRPC/build/example/callee/CMakeFiles/provider.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/callee/CMakeFiles/provider.dir/depend

