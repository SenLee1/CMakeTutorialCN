# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build

# Include any dependencies generated for this target.
include src/pow/CMakeFiles/pow.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/pow/CMakeFiles/pow.dir/compiler_depend.make

# Include the progress variables for this target.
include src/pow/CMakeFiles/pow.dir/progress.make

# Include the compile flags for this target's objects.
include src/pow/CMakeFiles/pow.dir/flags.make

src/pow/CMakeFiles/pow.dir/pow.cpp.o: src/pow/CMakeFiles/pow.dir/flags.make
src/pow/CMakeFiles/pow.dir/pow.cpp.o: ../src/pow/pow.cpp
src/pow/CMakeFiles/pow.dir/pow.cpp.o: src/pow/CMakeFiles/pow.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/pow/CMakeFiles/pow.dir/pow.cpp.o"
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/pow/CMakeFiles/pow.dir/pow.cpp.o -MF CMakeFiles/pow.dir/pow.cpp.o.d -o CMakeFiles/pow.dir/pow.cpp.o -c /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/src/pow/pow.cpp

src/pow/CMakeFiles/pow.dir/pow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pow.dir/pow.cpp.i"
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/src/pow/pow.cpp > CMakeFiles/pow.dir/pow.cpp.i

src/pow/CMakeFiles/pow.dir/pow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pow.dir/pow.cpp.s"
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/src/pow/pow.cpp -o CMakeFiles/pow.dir/pow.cpp.s

# Object files for target pow
pow_OBJECTS = \
"CMakeFiles/pow.dir/pow.cpp.o"

# External object files for target pow
pow_EXTERNAL_OBJECTS =

src/pow/libpow.a: src/pow/CMakeFiles/pow.dir/pow.cpp.o
src/pow/libpow.a: src/pow/CMakeFiles/pow.dir/build.make
src/pow/libpow.a: src/pow/CMakeFiles/pow.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libpow.a"
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && $(CMAKE_COMMAND) -P CMakeFiles/pow.dir/cmake_clean_target.cmake
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pow.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/pow/CMakeFiles/pow.dir/build: src/pow/libpow.a
.PHONY : src/pow/CMakeFiles/pow.dir/build

src/pow/CMakeFiles/pow.dir/clean:
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow && $(CMAKE_COMMAND) -P CMakeFiles/pow.dir/cmake_clean.cmake
.PHONY : src/pow/CMakeFiles/pow.dir/clean

src/pow/CMakeFiles/pow.dir/depend:
	cd /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/src/pow /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow /media/senlee/Data/Courses/CMake/CMakeTutorialCN/Practice/build/src/pow/CMakeFiles/pow.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/pow/CMakeFiles/pow.dir/depend

