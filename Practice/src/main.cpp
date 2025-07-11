#include "src/polynomial/polynomial.h"
#include "src/pow/pow.h"
#include "utils/math_utils.h"
#include <iostream>

int main() {
    std::cout << "5^2 = " << mypow(5, 2) << std::endl;
    std::cout << "5 + 3 = " << add(5, 3) << std::endl;
    std::cout << "5 * 3 = " << multiply(5, 3) << std::endl;

    Polynomial p1{1, 2, 3};  // 3x^2 + 2x + 1
    Polynomial p2{0, 1, -1}; // -x^2 + x

    std::cout << "p1: ";
    p1.printPolynomial();
    std::cout << std::endl;

    std::cout << "p2: ";
    p2.printPolynomial();
    std::cout << std::endl;

    Polynomial derivative = p1.derivative();
    std::cout << "p1 derivative: ";
    derivative.printPolynomial();
    std::cout << std::endl;

    Polynomial sum = p1 + p2;
    std::cout << "Sum: ";
    sum.printPolynomial();
    std::cout << std::endl;

    return 0;
}
