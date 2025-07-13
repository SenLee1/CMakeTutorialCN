# add_library(MathFunctions mysqrt.cxx)

- 构建一个(名为 MathFunctions 的)库，库的实现依赖于 mysqrt.cxx

~~~cmake
add_library(MathFunctions mysqrt.cxx)

# 如果有多个文件实现该库的功能：
add_library(MathFunctions STATIC mysqrt.cpp mylog.cpp myexp.cpp)
add_library(MathFunctions SHARED mysqrt.cpp mylog.cpp myexp.cpp)

# 使用变量组织文件结构
set(MATH_SOURCES
    src/math/sqrt.cpp
    src/math/log.cpp
    src/math/exp.cpp
)
set(MATH_HEADERS
    include/math/math_functions.h
)
add_library(MathFunctions ${MATH_SOURCES} ${MATH_HEADERS})
~~~

# add_subdirectory(MathFunctions)
- 使用自己构建的库 MathFunctions

# target_link_libraries(Turtorial PUBLIC MathFunctions)
- 在 Turtorial 中链接库 "MathFunctions" (在 Turtorial 所需要的cxx文件中被include)
- 链接的 MathFunctions 的路径需要提供
~~~cmake
# add the MathFunctions library
add_subdirectory(MathFunctions)

# add the executable
add_executable(Tutorial tutorial.cxx)

target_link_libraries(Tutorial PUBLIC MathFunctions)

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
target_include_directories(Tutorial PUBLIC
                          "${PROJECT_BINARY_DIR}"
                          "${PROJECT_SOURCE_DIR}/MathFunctions"
                          )
~~~

# option(USE_MYMATH "Use tutorial provided math implementation" ON)
- 定义一个用户可配置选项，用户可在运行时通过 "-DUSE_MYMATH=ON/OFF" 选择是否启用该选项 
- cmak -D<OPTION_NAME>=<VALUE> ..
- list(APPEND LIST_NAME VARIABLE_NAME) : 向LIST_NAME 中添加 VARIABLE_NAME

~~~cmake 
if(USE_MYMATH)
  add_subdirectory(MathFunctions)
  list(APPEND EXTRA_LIBS MathFunctions)
  list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/MathFunctions")
endif()

# add the executable
add_executable(Tutorial tutorial.cxx)

target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
target_include_directories(Tutorial PUBLIC
                           "${PROJECT_BINARY_DIR}"
                           ${EXTRA_INCLUDES}
                           )
~~~

# configure_file option 
configure_file 要在option之后,否则option 设置的 ON 无效
