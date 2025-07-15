# Install
1. install(TARGET MathFunctions DESTINATION lib)
2. install(FILES MathFunctions.h DESTINATION include)

## install(TARGET/FILES ITEM_NAME DESTINATION ITEM_LOC)

- 使用 TARGET 的情况
    - 安装使用 add_library()、add_executable() 所添加的 CMake 目标
- 使用 FILES 的情况
    - 安装独立文件(.h/.hpp, .md等文档，图片等资源)

## install process
cmake build 之后 build 目录下 cmake --install . --prefix "/home/..."(指定安装目录(***绝对路径***))

# Testing
- enable_testing() : 开启测试功能
- add_test(NAME test_name COMMAND args[0] args[1] ...)
- set_tests_properties(test_name PROPERTIES PASS_REGULAR_EXPRESSION "...")
    - test_name 的运行结果（输出结果）必须满足 "..." 正则表达式

~~~cmake 
enable_testing()

# does the application run
add_test(NAME Runs COMMAND Tutorial 25)

# does the usage message work?
add_test(NAME Usage COMMAND Tutorial)
set_tests_properties(Usage
  PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number"
  )

# define a function to simplify adding tests
function(do_test target arg result)
  add_test(NAME Comp${arg} COMMAND ${target} ${arg})
  set_tests_properties(Comp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction(do_test)

# do a bunch of result based tests
do_test(Tutorial 4 "4 is 2")
do_test(Tutorial 9 "9 is 3")
do_test(Tutorial 5 "5 is 2.236")
do_test(Tutorial 7 "7 is 2.645")
do_test(Tutorial 25 "25 is 5")
do_test(Tutorial -25 "-25 is [-nan|nan|0]")
do_test(Tutorial 0.0001 "0.0001 is 0.01")
~~~

## Test process
- cd build dir then run the following command 
- ctest -N : 输出测试结果
- ctest -VV : 输出 带程序输出 的测试结果
