#include "../../include/src/pow/pow.h"

double mypow(double num, int n) {

    if (n == 0) {
        return 1;
    }
    int n_abs = n > 0 ? n : -n;

    double ans = num;
    while (--n_abs) {
        ans *= num;
    }
    return ans;
}
