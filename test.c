#include <stdio.h>
#include "tom.h"

int main(int argc, char *argv[])
{
    int a = 10, b = -2, c = 100;
    printf("a+b=%d\n", tom_add(a, b));
    return 0;
}
