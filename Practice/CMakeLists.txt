cmake_minimum_required(VERSION 3.10)
project(MultiDirExample)

# 设置C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 添加子目录 - 工具库
add_subdirectory(utils)

# 添加子目录 - 主程序
add_subdirectory(src)
