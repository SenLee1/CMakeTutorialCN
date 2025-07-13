include("release/CPackConfig.cmake")

set(CPACK_INSTALL_CMAKE_PROJECTS
    "debug;Tutorial;ALL;/"   # 安装debug目录下所有文件
    "release;Tutorial;ALL;/" # 安装release目录下所有文件
    )
