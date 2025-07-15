
# generator expression

# common usage

- conditionally add compiler flags
replace 
~~~cmake 
add_library(tutorial_compiler_flags INTERFACE)
target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_11)
~~~
with 
~~~cmake
add_library(tutorial_compiler_flags INTERFACE)
target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_11)
~~~

# COMPILE_LANG_AND_ID(LANG,ID1,ID2,..)
- LANG: 语言(C, CXX) 
- ID1:编译器
# target_compile_options(TARGET INTERFACE/PRIVATE/PUBLIC OPTIONS)
- TARGET: add_library 添加的目标
- PRIVATE: 只影响TARGET, 不影响链接它的可执行文件
- OPTIONS: 编译选项(-Wall, ...)
- target_compile_options(my_compile_flags PRIVATE -Wall -Wextra -Werror)


~~~cmake
set(gcc_like_cxx "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU>")
set(msvc_cxx "$<COMPILE_LANG_AND_ID:CXX,MSVC>")
target_compile_options(tutorial_compiler_flags INTERFACE
  "$<${gcc_like_cxx}:$<BUILD_INTERFACE:-Wall;-Wextra;-Wshadow;-Wformat=2;-Wunused>>"
  "$<${msvc_cxx}:$<BUILD_INTERFACE:-W3>>"
)
~~~
- BUILD_INTERFACE: 只有构建本项目使用这些编译选项，其他项目通过find_package()使用库时选项不会被继承
