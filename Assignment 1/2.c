#include<stdio.h>
int main(){
    int arr[10] = {1, 2, 3, 3, 3, 4, 5, 6, 6, 9};
    int mean = 0;
    for (int i = 0; i < 10;i++){
        mean += arr[i];
    }
    mean = mean / 10;
    printf("Mean is: %d\n", mean);
    int median;
    median = arr[(10+1)/2-1];
    printf("Median is: %d\n", median);
    int mode;
    mode = (3 * median) - (2 * mean);
    printf("Mode is: %d\n", mode);
}
