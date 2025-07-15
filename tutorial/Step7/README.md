# Goal 
- 打包生成安装包，以便其他用户可以安装使用

# Grammar 
In top level CMakeLists.txt:
- include(InstallRequiredSystemLibraries)
    - 包含当前平台项目所需要的任何运行时库
~~~cmake 
include(InstallRequiredSystemLibraries)
# 设置安装许可证路径
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
# 设置安装包版本
set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
include(CPack)
~~~

# Building
- from build dir, run : cpack 
- cpack -G ZIP -C Debug
    - -G: 生成方式: ZIP DEB TAR, ...
    - -C: 指定构建配置: Debug, Release, ...
- cpack --config CPackSourceConfig.cmake
    - 创建一个包含项目所有源代码的压缩包
