cmake_minimum_required(VERSION 3.10)

# project name, with version number 1.0
project(Mytutorial VERSION 1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 把TutorialConfig.h.in 生成为 TutorialConfig.h
configure_file(TutorialConfig.h.in TutorialConfig.h)

# add executable
add_executable(Mytutorial tutorial.cxx)

target_include_directories(Mytutorial PUBLIC
                           "${PROJECT_BINARY_DIR}"
                           )
