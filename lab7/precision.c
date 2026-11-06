#include <stdio.h>

int main() {
    short s = 32767;
    double d = 0.12345678901234567890;

    printf("short = %hd\n", s);
    printf("double = %.20f\n", d);

    return 0;
}
