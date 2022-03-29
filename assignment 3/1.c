#include<stdio.h>
int res(int a){
    int ans = 0;
    ans = (7 * a * a) - (3 * a) + 2;
    return ans;
}
int main(){
    int a = 5;
    int ans = res(a);
    printf("Result is:%d", ans);
}