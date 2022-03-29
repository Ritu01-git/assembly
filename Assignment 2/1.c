

#include<stdio.h>
int main(){

    int n;
    scanf("%d",&n);
    int i = 1, ans = 0;
    for (i = 1; i <= n;i++){
        ans += i * i;
    }
    printf("The ans is %d", ans);
}