add_library(math_utils STATIC 
    src/math_utils.cpp
)

# 设置公共头文件目录
target_include_directories(math_utils
    PUBLIC 
        ${CMAKE_CURRENT_SOURCE_DIR}/../include
)

# 仅当构建共享库时才定义导出宏
if(BUILD_SHARED_LIBS)
    target_compile_definitions(math_utils 
        PRIVATE 
            MATH_UTILS_EXPORT
    )
endif()
