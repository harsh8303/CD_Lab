#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
int main(){
int fd1,fd2,n;
char buf[100];
fd1=open("file.txt",O_RDONLY);
fd2=open("destination.txt",O_WRONLY|O_CREAT|O_TRUNC,0644);

while((n=read(fd1,buf,100))>0)
{
write(fd2,buf,n);
}
close(fd1);
close(fd2);
return 0;
}
