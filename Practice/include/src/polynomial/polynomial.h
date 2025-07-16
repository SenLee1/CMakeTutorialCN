#ifndef POLYNOMIAL_H
#define POLYNOMIAL_H
#include <vector>

class Polynomial {
  public:
    Polynomial(std::size_t n) { coefficients.resize(n + 1); }
    Polynomial() : coefficients(1) { coefficients[0] = 0; };
    Polynomial(std::initializer_list<double> coeffs) : coefficients(coeffs) {}
    template <typename... Args>
    Polynomial(Args &&...args) : coefficients{std::forward<Args>(args)...} {};

    Polynomial(Polynomial &&) = default;
    Polynomial(const Polynomial &) = default;
    Polynomial &operator=(Polynomial &&) = default;
    Polynomial &operator=(const Polynomial &) = default;
    ~Polynomial() = default;

    Polynomial operator+(const Polynomial &rhs) const;
    Polynomial operator[](std::size_t i) const { return coefficients.at(i); };

    void printPolynomial();
    double assginValue(double x);
    std::size_t degree() const {
        return coefficients.empty() ? 0 : coefficients.size() - 1;
    }

    Polynomial derivative() const;

  private:
    std::vector<double> coefficients;
};

#endif
