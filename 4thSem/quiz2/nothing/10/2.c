#include<stdio.h>
#include<unistd.h>

int main()
{
    int fd[2];
    pipe(fd);

    if(fork() == 0)
    {
        // child
        dup2(fd[0], 0);
        close(fd[1]);

        execlp("wc", "wc", "-c", NULL);
    }
    else
    {
        // parent
        dup2(fd[1], 1);
        close(fd[0]);

        execlp("echo", "echo", "Hello", NULL);
    }

    return 0;
}
