#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

int main()
{
    int pid = fork();

    if(pid == 0)
    {
        printf("Child\n");
    }
    else
    {
        wait(NULL);
        printf("Parent after child\n");
    }

    return 0;
}
