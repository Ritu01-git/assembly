#include<stdio.h>

int calculateGCD(int a, int b){
    if(a==0){
        return b;
    }
    if(b==0){
        return a;
    }
    while(a!=b){
        if(a<b){
            b = b - a;
        }else{
            a = a - b;
        }
    }
}
int main(){
    int a, b;
    printf("Enter two numbers:");
    scanf("%d %d",&a,&b);
    printf("The GCD is: %d",calculateGCD(a, b));
    return 0;
}