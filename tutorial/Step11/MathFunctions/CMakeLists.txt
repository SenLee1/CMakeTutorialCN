# add the library that runs
add_library(MathFunctions MathFunctions.cxx)

# state that anybody linking to us needs to include the current source dir
# to find MathFunctions.h, while we don't.

# ===============↓↓↓↓↓↓↓====================
target_include_directories(MathFunctions
                           INTERFACE
                            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
                            $<INSTALL_INTERFACE:include>
                           )
# ===============↑↑↑↑↑↑↑====================

# should we use our own math functions
option(USE_MYMATH "Use tutorial provided math implementation" ON)
if(USE_MYMATH)

    target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

    # first we add the executable that generates the table
    add_executable(MakeTable MakeTable.cxx)
    target_link_libraries(MakeTable PRIVATE tutorial_compiler_flags)

    # add the command to generate the source code
    add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
    COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
    DEPENDS MakeTable
    )

    # library that just does sqrt
    add_library(SqrtLibrary STATIC
              mysqrt.cxx
              ${CMAKE_CURRENT_BINARY_DIR}/Table.h
              )

    # state that we depend on our binary dir to find Table.h
    target_include_directories(SqrtLibrary PRIVATE
                             ${CMAKE_CURRENT_BINARY_DIR}
                             )

    # state that SqrtLibrary need PIC when the default is shared libraries
    set_target_properties(SqrtLibrary PROPERTIES
                        POSITION_INDEPENDENT_CODE ${BUILD_SHARED_LIBS}
                        )

    target_link_libraries(SqrtLibrary PUBLIC tutorial_compiler_flags)
    target_link_libraries(MathFunctions PRIVATE SqrtLibrary)
endif()

target_link_libraries(MathFunctions PUBLIC tutorial_compiler_flags)

# define the symbol stating we are using the declspec(dllexport) when
#building on windows
target_compile_definitions(MathFunctions PRIVATE "EXPORTING_MYMATH")

# install rules
set(installable_libs MathFunctions tutorial_compiler_flags)
if(TARGET SqrtLibrary)
    list(APPEND installable_libs SqrtLibrary)
endif()

# ===============↓↓↓↓↓↓↓====================
install(TARGETS ${installable_libs}
        DESTINATION lib
        # EXPORT 关键字,生成MathFunctionsTargets.cmake文件，记录所有库的导出信息
        EXPORT MathFunctionsTargets
)
# ===============↑↑↑↑↑↑↑====================

install(FILES MathFunctions.h DESTINATION include)

