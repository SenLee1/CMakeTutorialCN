# INTERFACE 
- consumer(链接库) 需要包含，producer(库) 不需要包含
~~~cmake 
# 在 MathFunctions/CMakeLists.txt 中：
target_include_directories(MathFunctions
          INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
          )
~~~
这样，在顶层 CMakeLists.txt 中不需要 target_include_directories MathFunctions 所在的目录

## 这里和 PUBLIC, PRIVATE 的区别
- PUBLIC 会增加不必要的编译(MathFunctions时的)搜索路径, 用 INTERFACE 可维护性更强.
- PRIVATE 会导致顶层项目 tutorial.cxx 找不到 "MathFunctions.h"

## 必须用 PUBLIC 不能用 INTERFACE 的情况
- 该层项目 #include "LibName/Header.h"，且 LibName 和本层 CMakeLists.txt 不在同一目录

# DIR
- ${CMAKE_CURRENT_SOURCE_DIR} : 当前 CMakeLists.txt 所在目录
- ${PROJECT_SOURCE_DIR} : 最近定义过 project(${PROJECT_NAME}) 的 CMakeLists.txt 所在目录


