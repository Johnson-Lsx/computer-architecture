#include <stdio.h>
#include <stdlib.h>
#include <time.h>
//#define CLOCKS_PER_SEC ((clock_t)1000)
#define LENGTH 32768

int main()
{
 int i=0,sum=0;
 int data[LENGTH];

 clock_t start, finish;
 double  duration;   /* 测量一个事件持续的时间*/

 srand(time(NULL));

 for (i = 0; i < LENGTH; i++)
    data[i]= ( rand()%256 );  /*随机生成数组元素*/

 start = clock();

 for (i = 0; i < 100000; ++i)
    {   
        sum = 0;
        // 主要计算部分，选一半元素参与计算
        for (int c = 0; c < LENGTH; ++c)
        {
            int temp = data[c] >= 128 ? data[c] : 0;
            sum += temp; 
        }
    }
    finish = clock();
    duration = (double)(finish - start) / CLOCKS_PER_SEC;
    printf( "%f seconds to complete the calculation \n", duration );
    printf("sum= %d \n", sum);
    system("pause");
}
