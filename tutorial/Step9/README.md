# BUILD_SHARED_LIBS （CMake 内置变量）
- ON: 默认 add_library() 会构建 Shared lib; 
- OFF: 默认add_library() 会构建 Static lib;

# CMAKE_XX_OUTPUT_DIRECTORY
- ARCHIVE: 静态库(.a, .lib)
- LIBRARY: Shared library(.so, .dll)
- RUNTIME: 可执行文件 (.exe, 无扩展（linux）)

同一生成库的目录：
~~~cmake
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
~~~

# 源代码(user)判断是否使用 mysqrt -> MathFunctions 库判断
- user 直接调用 MathFunctions::sqrt, 行为由 MathFunctions 的 CMakeLists.txt 判断
~~~c 
#include "MathFunctions.h"

#include <cmath>

#ifdef USE_MYMATH
#  include "mysqrt.h"
#endif

namespace mathfunctions {
double sqrt(double x)
{
#ifdef USE_MYMATH
  return detail::mysqrt(x);
#else
  return std::sqrt(x);
#endif
}
}
~~~
