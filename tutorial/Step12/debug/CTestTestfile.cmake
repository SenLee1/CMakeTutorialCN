# CMake generated Testfile for 
# Source directory: /media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12
# Build directory: /media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Runs "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "25")
set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;62;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Usage "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;65;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp4 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "4")
set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;79;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp9 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "9")
set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;80;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp5 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "5")
set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "5 is 2.236" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;81;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp7 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "7")
set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "7 is 2.645" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;82;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp25 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "25")
set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;83;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp-25 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "-25")
set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is [-nan|nan|0]" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;84;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
add_test(Comp0.0001 "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/debug/Tutoriald" "0.0001")
set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;72;add_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;85;do_test;/media/senlee/Data/Courses/CMake/CMakeTutorialCN/tutorial/Step12/CMakeLists.txt;0;")
subdirs("MathFunctions")
