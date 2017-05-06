#include <stdio.h>
#include <string.h> // for puts

#include <fcntl.h> // O_RDONLY
#include <sys/stat.h>
#include <sys/types.h>

#include <unistd.h> // For read

#define MAX_BUF_SIZE  1000

int main()
{
    int fd; 

    const char* fname = "/dev/scull0";
    fd = open(fname, O_RDWR);

    if (-1 == fd)
    {
        printf("failed to open %s\n", fname);
    }
    else
    {
        printf("OK to open %s\n", fname);
    }
            close(fd);
    fd = open(fname, O_RDONLY);

    if (-1 == fd)
    {
        printf("failed to open %s\n", fname);
        return -1;
    }
    else
    {
        printf("OK to open %s\n", fname);
    }
                    close(fd);


 //   fd = open(fname, O_WRONLY);
    fd = open(fname, O_RDONLY);
//    
    if (-1 == fd)
    {
        printf("failed to open %s\n", fname);
        return -1;
    }

    printf(" Open %s successfully\n", fname);

    char buf[MAX_BUF_SIZE];
    char length;

    if (-1 != (length = read(fd, buf, MAX_BUF_SIZE)) )
    {
        printf("file size %d bytes\n", length); 
        buf[length] = '\0';
        puts(buf);
    };
    close(fd);

    return 0;
}
