#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <unistd.h>
#include <assert.h>

int main()
{
    assert("Please run this program as root " && (0 == getuid() ));
    printf("In consumer\n");
    
    /* size of shared memory object */
    const int SIZE = 4096;
    /* name of shared memory */
    const char* name = "OS";

    /* string written to shared memory */
    const char* message_0 = "hello";
    const char* message_1 = "world";


    /* shared memory file descriptor */
    int shm_fd;
    /* pointer to shared memory */
    void* ptr;

    /* create shared memory object */
    shm_fd = shm_open(name, (O_CREAT | O_RDWR), 0x666);

    /* configure the size of the shared memory object */
    ftruncate(shm_fd, SIZE);

    
    /* Memory map the shared memory object */
    ptr = mmap(0, SIZE, PROT_WRITE, MAP_SHARED, shm_fd, 0);

    /* Write to the shared memory object */
    sprintf(ptr, "%s", message_0);
    ptr += strlen(message_0);
    sprintf(ptr, "%s", message_1);
    ptr += strlen(message_1);
    *(char*)ptr = '\0';
    
    return 0;
}
