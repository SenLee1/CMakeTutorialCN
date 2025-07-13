# configure_file(TutorialConfig.h.in TutorialConfig.h)
- 根据TutorialConfig.h.in 的配置生成TutorialConfig.h
## 为什么不直接写config.h 而是通过config.in.h去生成config.h?
1. 动态配置，无需手动修改代码即可适配不同环境
在config.h.in 定义模版变量：
~~~cpp
// config.h.in
#define VERSION "@PROJECT_VERSION@"
#define INSTALL_PATH "@CMAKE_INSTALL_PREFIX@"
~~~

CMake 会自动替换@...@为实际值,生成config.h

~~~cpp
// build/config.h（生成结果）
#define VERSION "1.0.0"
#define INSTALL_PATH "/usr/local"
~~~
2. 多平台适配
~~~cpp
// config.h.in
#define PROJECT_NAME "@PROJECT_NAME@"
#define PROJECT_VERSION "@PROJECT_VERSION@"

// 平台相关配置
#cmake if(WIN32)
#define PLATFORM_WINDOWS 1
#define PATH_SEPARATOR "\\"
#cmake else()
#define PLATFORM_UNIX 1
#define PATH_SEPARATOR "/"
#cmake endif()

// 可选功能
#cmake if(USE_FEATURE_X)
#define FEATURE_X_ENABLED 1
#cmake endif()
~~~
3. 避免硬编码，提升可维护性
- 直接写config.h：版本升级需要手动修改文件进行维护
- 模板生成：所有可变参数通过CMake管理,只需要修改CMakeLists.txt

4. 模板全平台通用，方便管理

# target_include_directories

target_include_directories(Tutorial PUBLIC "${PROJECT_BINARY_DIR}")

- 为 Tutorial 目标指定搜索(头文件)目录,以此让 Tutorial 能够找到其所 include 的头文件

- PUBLIC: Tutorial 和其他任何链接 Tutorial 的目标的都可以访问 ${PROJECT_BINARY_DIR}; 链接：target_link_libraries(Tutorial PUBLIC MathFunctions)

- ${PROJECT_BINARY_DIR}: 一般为 build (运行cmake ..)目录

# CXX_STANDARD 
- set(CMAKE_CXX_STANDARD 17)
- set(CMAKE_CXX_STANDARD_REQUIRED True) 要求编译器必须支持C++17,否则报错
如果不设置为 True, 默认为False, 会回退到编译器支持的C++版本（如C++14）此时如果项目使用C++17 特性,编译会失败报错； 设置为True Cmake会直接报错，避免后续继续编译失败
