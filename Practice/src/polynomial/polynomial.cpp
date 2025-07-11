#include "../../include/src/polynomial/polynomial.h"
#include <cmath>
#include <iostream>
#include <stdexcept>

void Polynomial::printPolynomial() {
    int sign = 0;
    if (coefficients.empty())
        return;
    if (coefficients[0] != 0) {
        std::cout << coefficients[0];
        sign = 1;
    }
    for (int i = 1; i != coefficients.size(); i++) {
        if (coefficients[i] == 0) {
            continue;
        }
        double tem = coefficients[i] > 0 ? coefficients[i] : -coefficients[i];
        if (sign == 1) {
            if (tem == coefficients[i]) {
                std::cout << " + ";
            } else {
                std::cout << " - ";
            }
        }
        if (tem != 1) {
            sign = 1;
            std::cout << tem;
        }
        if (i != 1) {
            sign = 1;
            std::cout << "x^" << i;
        } else {
            sign = 1;
            std::cout << "x";
        }
    }
}

double Polynomial::assginValue(double x) {
    if (coefficients.empty()) {
        return 0;
    }
    double ans = coefficients[0];
    double x_tem = 1;
    for (int i = 1; i < coefficients.size(); i++) {
        x_tem *= x;
        ans += x_tem;
    }
    return ans;
}

Polynomial Polynomial::derivative() const {
    if (coefficients.size() <= 1) {
        return Polynomial{0};
    }

    Polynomial result(degree());

    for (size_t i = 1; i < coefficients.size(); ++i) {
        result.coefficients[i - 1] = coefficients[i] * i;
    }
    return result;
}

Polynomial Polynomial::operator+(const Polynomial &rhs) const {
    std::cout << std::max(degree(), rhs.degree()) << std::endl;
    Polynomial result(std::max(degree(), rhs.degree()));
    for (size_t i = 0; i <= result.degree(); ++i) {
        double lhs_coeff = (i <= degree()) ? coefficients[i] : 0.0;
        double rhs_coeff = (i <= rhs.degree()) ? rhs.coefficients[i] : 0.0;
        result.coefficients[i] = lhs_coeff + rhs_coeff;
    }
    return result;
}
