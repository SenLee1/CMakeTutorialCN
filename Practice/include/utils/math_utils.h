#ifndef MATH_UTILS_H
#define MATH_UTILS_H

// 跨平台导出宏
#if defined(_WIN32)
    #ifdef MATH_UTILS_EXPORT
        #define MATH_API __declspec(dllexport)
    #else
        #define MATH_API __declspec(dllimport)
    #endif
#else
    #ifdef MATH_UTILS_EXPORT
        #define MATH_API __attribute__((visibility("default")))
    #else
        #define MATH_API
    #endif
#endif

MATH_API int add(int a, int b);
MATH_API int multiply(int a, int b);

#endif // MATH_UTILS_H
