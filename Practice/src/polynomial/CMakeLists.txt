# 创建多项式库
add_library(polynomial STATIC
    polynomial.cpp
)

# 设置包含路径
target_include_directories(polynomial
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/../../../include/
)

# 设置编译特性
target_compile_features(polynomial PUBLIC cxx_std_17)

