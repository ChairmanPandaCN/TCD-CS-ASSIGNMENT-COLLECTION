#include <stdio.h>
#include <time.h>
int count;
int overflow;
int underflow;
int WUSED;
int CWP;
int SWP;
int NWINDOWS;
int ackermann(int, int);
int main(void)
{
    count = 0;
    overflow = 0;
    underflow = 0;
    WUSED = 0;
    CWP = 0;
    SWP = 0;
    NWINDOWS = 16;
    //`struct timespec start;
    //clock_gettime(clock_process_cputime_id, &start);
    //struct timespec end;
    printf("The result of ackermann(3, 6) is %d\n", ackermann(3, 6));
    printf("and the number of procedure calls, is %d\n", count);
    printf("The number of overflow is %d\n", overflow);
    printf("The number of underflow is %d\n", underflow);
    printf("The value of CWP after execution is %d\n", CWP);
    printf("The value of SWP after execution is %d\n", SWP);
    getchar();
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
            SWP--;
            underflow++;
            //WUSED++;
        }
        else
        {
            WUSED--;
        }
        CWP--;
        return y + 1;
    }
    else if (y == 0)
    {
        if (WUSED == NWINDOWS)
        {
            overflow++;
            //WUSED--;
            SWP++;
        }
        else
        {
            WUSED++;
        }
        CWP++;
        return ackermann(x - 1, 1);
    }
    else
    {
        if (WUSED == NWINDOWS)
        {
            overflow++;
            //WUSED--;
            SWP++;
        }
        else
        {
            WUSED++;
        }
        CWP++;
        return ackermann(x - 1, ackermann(x, y - 1));
    }
}
