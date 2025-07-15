# Debug & Release
- CMAKE_DEBUG_POSTFIX: Debug 版本下的可执行文件后缀,全局生效
- set_target_properties(Tutorial PROPERTIES DEBUG_POSTFIX "_debug"), 配置Debug 版本下生成Tutorial 可执行文件的后缀为 _debug
- cmake -DCMAKE_BUILD_TYPE=Debug/Release .. : 使用  Debug/Release 版本构建目标

~~~cmake
set(CMAKE_DEBUG_POSTFIX d)

add_library(tutorial_compiler_flags INTERFACE)

add_executable(Tutorial tutorial.cxx)
set_target_properties(Tutorial PROPERTIES DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})

target_link_libraries(Tutorial PUBLIC MathFunctions)
~~~

# 同时安装 Debug 和 Release 版本

- set(CPACK_INSTALL_CMAKE_PROJECTS
    "构建目录;项目名称;安装组件;安装前缀")

in MultiCPackConfig.cmake:
~~~cmake 
include("release/CPackConfig.cmake")

set(CPACK_INSTALL_CMAKE_PROJECTS
    "debug;Tutorial;ALL;/"
    "release;Tutorial;ALL;/"
    )
~~~
- cpack --config MultiCPackConfig.cmake 进行 build
