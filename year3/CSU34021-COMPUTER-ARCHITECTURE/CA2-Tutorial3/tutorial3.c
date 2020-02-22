#include <stdio.h>
#include <time.h>
/*
   This piece of code uses clock_gettime(CLOCK_PROCESS_CPUTIME_ID) to retrieve the amount of time the cpu spends on this process.
    
    The advantage of this is that this function's high precision is up to 1E-9s(1ns).Another is, most OSes support multithread and multi cores nowadays, it means that mutiple processes can run simultaneously.Thus,this cpu is not designated to fullfill the need of the ackermann function.The ackermann may start running,then suddenly halt and wait for other processes finish running.However,the clock is still ticking and this amount of time should not be accounted for ackermann's execution time.
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID) is not subject to this problem.Based on this,i use it to measure the time ackermann taken to run.


   The drawback of clock_gettime function is that it is provied by the linux kernel ,thus this code doesnt work in Windows.
   This code is not portable.
   
*/
int count;
int overflow;
int underflow;
int WUSED;
//int CWP;
//int SWP;
int NWINDOWS;
int ackermann(int, int);
int main(void)
{
    count = 0;
    overflow = 0;
    underflow = 0;
    WUSED = 0;
    //CWP = 0;
    //SWP = 0;
    NWINDOWS = 16;
    struct timespec start;
    struct timespec end;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    printf("The result of ackermann(3, 6) is %d\n", ackermann(3, 6));
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end);
    double start_ms = start.tv_sec * 1000 + start.tv_nsec / 1000000;
    double end_ms = end.tv_sec * 1000 + end.tv_nsec / 1000000;
    //seconds to milliseconds + nano seconds to milliseconds
    printf("and the number of procedure calls, is %d\n", count);
    printf("The number of overflow is %d\n", overflow);
    printf("The number of underflow is %d\n", underflow);
    //printf("The value of CWP after execution is %d\n", CWP);
    //printf("The value of SWP after execution is %d\n", SWP);
    printf("The execution time is  %.4lf ms\n", end_ms - start_ms);
    return 0;
}

int ackermann(int x, int y)
{
    printf("Ackermann( %d , %d)\n", x, y);
    count++;
    if (x == 0)
    {
        if (WUSED == 2)
        {
            //SWP--;
            underflow++;
            //WUSED++;
        }
        else
        {
            WUSED--;
        }
        //CWP--;
        return y + 1;
    }
    else if (y == 0)
    {
        if (WUSED == NWINDOWS)
        {
            overflow++;
            //WUSED--;
            //SWP++;
        }
        else
        {
            WUSED++;
        }
        //CWP++;
        return ackermann(x - 1, 1);
    }
    else
    {
        if (WUSED == NWINDOWS)
        {
            overflow++;
            //WUSED--;
            //SWP++;
        }
        else
        {
            WUSED++;
        }
        //CWP++;
        return ackermann(x - 1, ackermann(x, y - 1));
    }
}
