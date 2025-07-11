add_subdirectory(pow)
add_subdirectory(polynomial)
list (APPEND LIB pow)
list (APPEND LIB polynomial)

# 创建可执行文件
add_executable(main_program
    main.cpp
)


# 链接工具库
target_link_libraries(main_program
    PRIVATE
        math_utils
        ${LIB}
)

# 设置可执行文件输出目录(可选)
set_target_properties(main_program
    PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)
