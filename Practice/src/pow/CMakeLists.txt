# 创建pow库
add_library(pow STATIC
    pow.cpp
)

# 设置包含路径
target_include_directories(pow
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/../../include
)

# 设置导出宏（如果需要动态库）
if(BUILD_SHARED_LIBS)
    target_compile_definitions(pow
        PRIVATE
            POW_EXPORT
    )
endif()
