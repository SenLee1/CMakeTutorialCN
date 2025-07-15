## Problem 
- 项目使用了一些基于平台A的特性，但平台B不支持这些特性

## Solution
- 检测平台是否支持该特性，如果支持则使用该特性，如果不支持则使用自己的实现

# CheckSymbolExists module
- check_symbol_exists(FUN_NAME "header_name" VAR_NAME)
    - FUN_NAME: 要使用的特性（函数）
    - header_name: 实现函数的库
    - VAR_NAME: 判断 FUN_NAME 是否存在于 "header_name" 的 bool 变量

顶层CMakeLists:
~~~cmake
include(CheckSymbolExists)
check_symbol_exists(log "math.h" HAVE_LOG)
check_symbol_exists(exp "math.h" HAVE_EXP)
if(NOT (HAVE_LOG AND HAVE_EXP))
  unset(HAVE_LOG CACHE)
  unset(HAVE_EXP CACHE)
  set(CMAKE_REQUIRED_LIBRARIES "m")
  check_symbol_exists(log "math.h" HAVE_LOG)
  check_symbol_exists(exp "math.h" HAVE_EXP)
  if(HAVE_LOG AND HAVE_EXP)
    target_link_libraries(MathFunctions PRIVATE m)
  endif()
endif()
~~~

# Usage of VAR_NAME
- in .h.in file. define by #cmakedefine VAR_NAME

~~~c
#cmakedefine HAVE_LOG
#cmakedefine HAVE_EXP
~~~
- use the VAR_NAME in the code using #if  defined(VAR_NAME)

~~~c 
#if defined(HAVE_LOG) && defined(HAVE_EXP)
   // 使用self-implementd function
  double result = exp(log(x) * 0.5);
  std::cout << "Computing sqrt of " << x << " to be " << result
            << " using log and exp" << std::endl;
#else
  double result = x;
~~~
# Caution

my_sqrt.cxx 用了 TutorialConfig.h 定义的 HAVE_LOG 和 HAVE_EXP, 所以 TutorialConfig.h 的路径(CMAKE_BINARY_DIR)需要告诉 my_sqrt.cxx (MathFunctions 库)

## better definition of VAR_NAME

~~~cmake 
if(HAVE_LOG AND HAVE_EXP)
  target_compile_definitions(MathFunctions
                             PRIVATE "HAVE_LOG" "HAVE_EXP")
endif()
~~~
- if 成立，则会执行 target_compile_definitions()
- 相当于 #define HAVE_LOG 和 #define HAVE_EXP
