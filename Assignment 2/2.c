/*Write an assembly language program to find mean of the following distribution:

X: 2 3 4 5 6 7 8 9
F: 5 6 3 6 4 3 7 5

The mean should be computed as
Mean = (X1F1 + X2F2 + ... + X8F8) / (F1 + F2 + ... + F8)*/

#include<stdio.h>

int main(){
    int x = 2;
    int a[8] = {5, 6, 3, 6, 4, 3, 7, 5};
    int i;
    int fx = 0;
    int f = 0;
    int count = 0;
    int ans = 0;
    for (i = 2; i <= 9;i++){
        fx += i*a[count];
        f += a[count];
        count++;
    }
    ans = fx/f;
    printf("Answer is %d", ans);
    
}