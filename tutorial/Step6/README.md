# Idea 
- 构建预计算表优化性能,在大型项目，计算资源匮乏的情况下节省时间

## add_custom_command

- 首先需要add_executable(MakeTable MakeTable.cxx), 用于生成Table.h
~~~cmake
add_custom_command(
  OUTPUT <output_file>                # 生成的输出文件
  COMMAND <command> [args...]         # 执行的命令
  DEPENDS <dependencies...>           # 依赖的目标或文件
  [WORKING_DIRECTORY <dir>]           # 可选：命令执行的工作目录
  [VERBATIM]                          # 可选：禁止转义参数
)
~~~

~~~cmake 
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  DEPENDS MakeTable
  )
~~~
- Table.h 作为中间生成的文件，需要加在 add_library 中
~~~cmake
add_library(MathFunctions
            mysqrt.cxx
            ${CMAKE_CURRENT_BINARY_DIR}/Table.h
            )
~~~

- 生成的 Table.h 路径需要给 MathFunctions(mysqrt.cxx included Table.h)
~~~cmake
target_include_directories(MathFunctions 
                            INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
                            PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
~~~
