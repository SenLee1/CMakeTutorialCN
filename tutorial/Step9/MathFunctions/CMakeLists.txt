add_library(MathFunctions MathFunctions.cxx)

#=============================================================
# INTERFACE : 外部链接MathFunctions的时候可以从${CMAKE_CURRENT_SOURCE_DIR}, 内部链接则不需要该路径
# 获得头文件目录,进而直接#include "MathFunctions.h"不需要目录.
# MathFunctions 自身不需要，因为MathFunctions.cpp在include .h的时候已经确定.h的位置
target_include_directories(MathFunctions
                        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
                            )
#=============================================================

option(USE_MYMATH "Use tutorial provided math implementation" ON)

if(USE_MYMATH)

    target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

    # first we add the executable that generates the table
    add_executable(MakeTable MakeTable.cxx)

    # add the command to generate the source code
    add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
    COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
    DEPENDS MakeTable
    )
    # ==================================
    # These two lines are in mysqrt.cxx:
    #include "MathFunctions.h"
    #include "Table.h"
    # ==================================

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

    target_link_libraries(MathFunctions PRIVATE SqrtLibrary)
endif()

# define the symbol stating we are using the declspec(dllexport) when
# building on windows
target_compile_definitions(MathFunctions PRIVATE "EXPORTING_MYMATH")

# install rules
set(installable_libs MathFunctions)
if(TARGET SqrtLibrary)
    list(APPEND installable_libs SqrtLibrary)
endif()
install(TARGETS ${installable_libs} DESTINATION lib)
install(FILES MathFunctions.h DESTINATION include)
