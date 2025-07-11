set(CTEST_PROJECT_NAME "CMakeTutorial") # 项目名称（与CDash一致）
set(CTEST_NIGHTLY_START_TIME "00:00:00 EST") # 定时测试开始时间

set(CTEST_DROP_METHOD "http") # 提交协议
set(CTEST_DROP_SITE "my.cdash.org") # CDash 服务器地址
set(CTEST_DROP_LOCATION "/submit.php?project=CMakeTutorial") # 提交路径
set(CTEST_DROP_SITE_CDASH TRUE)
