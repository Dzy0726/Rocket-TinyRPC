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

src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o: ../src/RocketRpcProvider.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RocketRpcProvider.cc

src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RocketRpcProvider.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RocketRpcProvider.cc > CMakeFiles/Rocket.dir/RocketRpcProvider.cc.i

src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RocketRpcProvider.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RocketRpcProvider.cc -o CMakeFiles/Rocket.dir/RocketRpcProvider.cc.s

src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.o: ../src/rpcheader.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/rpcheader.pb.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/rpcheader.pb.cc

src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/rpcheader.pb.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/rpcheader.pb.cc > CMakeFiles/Rocket.dir/rpcheader.pb.cc.i

src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/rpcheader.pb.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/rpcheader.pb.cc -o CMakeFiles/Rocket.dir/rpcheader.pb.cc.s

src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o: ../src/RocketRpcChannel.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RocketRpcChannel.cc

src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RocketRpcChannel.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RocketRpcChannel.cc > CMakeFiles/Rocket.dir/RocketRpcChannel.cc.i

src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RocketRpcChannel.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RocketRpcChannel.cc -o CMakeFiles/Rocket.dir/RocketRpcChannel.cc.s

src/CMakeFiles/Rocket.dir/RocketRpcController.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/RocketRpcController.cc.o: ../src/RocketRpcController.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/Rocket.dir/RocketRpcController.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/RocketRpcController.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/RocketRpcController.cc

src/CMakeFiles/Rocket.dir/RocketRpcController.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/RocketRpcController.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/RocketRpcController.cc > CMakeFiles/Rocket.dir/RocketRpcController.cc.i

src/CMakeFiles/Rocket.dir/RocketRpcController.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/RocketRpcController.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/RocketRpcController.cc -o CMakeFiles/Rocket.dir/RocketRpcController.cc.s

src/CMakeFiles/Rocket.dir/Logger.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/Logger.cc.o: ../src/Logger.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/Rocket.dir/Logger.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/Logger.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/Logger.cc

src/CMakeFiles/Rocket.dir/Logger.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/Logger.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/Logger.cc > CMakeFiles/Rocket.dir/Logger.cc.i

src/CMakeFiles/Rocket.dir/Logger.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/Logger.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/Logger.cc -o CMakeFiles/Rocket.dir/Logger.cc.s

src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o: src/CMakeFiles/Rocket.dir/flags.make
src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o: ../src/ZookeeperUtil.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o -c /home/ubuntu/Rocket-TinyRPC/src/ZookeeperUtil.cc

src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Rocket.dir/ZookeeperUtil.cc.i"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Rocket-TinyRPC/src/ZookeeperUtil.cc > CMakeFiles/Rocket.dir/ZookeeperUtil.cc.i

src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Rocket.dir/ZookeeperUtil.cc.s"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Rocket-TinyRPC/src/ZookeeperUtil.cc -o CMakeFiles/Rocket.dir/ZookeeperUtil.cc.s

# Object files for target Rocket
Rocket_OBJECTS = \
"CMakeFiles/Rocket.dir/RocketApplication.cc.o" \
"CMakeFiles/Rocket.dir/RocketConfig.cc.o" \
"CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o" \
"CMakeFiles/Rocket.dir/rpcheader.pb.cc.o" \
"CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o" \
"CMakeFiles/Rocket.dir/RocketRpcController.cc.o" \
"CMakeFiles/Rocket.dir/Logger.cc.o" \
"CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o"

# External object files for target Rocket
Rocket_EXTERNAL_OBJECTS =

../lib/libRocket.a: src/CMakeFiles/Rocket.dir/RocketApplication.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/RocketConfig.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/RocketRpcProvider.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/rpcheader.pb.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/RocketRpcChannel.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/RocketRpcController.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/Logger.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/ZookeeperUtil.cc.o
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/build.make
../lib/libRocket.a: src/CMakeFiles/Rocket.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Rocket-TinyRPC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library ../../lib/libRocket.a"
	cd /home/ubuntu/Rocket-TinyRPC/build/src && $(CMAKE_COMMAND) -P CMakeFiles/Rocket.dir/cmake_clean_target.cmake
	cd /home/ubuntu/Rocket-TinyRPC/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Rocket.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/Rocket.dir/build: ../lib/libRocket.a

.PHONY : src/CMakeFiles/Rocket.dir/build

src/CMakeFiles/Rocket.dir/clean:
	cd /home/ubuntu/Rocket-TinyRPC/build/src && $(CMAKE_COMMAND) -P CMakeFiles/Rocket.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/Rocket.dir/clean

src/CMakeFiles/Rocket.dir/depend:
	cd /home/ubuntu/Rocket-TinyRPC/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Rocket-TinyRPC /home/ubuntu/Rocket-TinyRPC/src /home/ubuntu/Rocket-TinyRPC/build /home/ubuntu/Rocket-TinyRPC/build/src /home/ubuntu/Rocket-TinyRPC/build/src/CMakeFiles/Rocket.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/Rocket.dir/depend

