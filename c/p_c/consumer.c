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
    assert("Please run this program as root " && (0 == getuid()) );
   
    printf("In producer\n");
    
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
    shm_fd = shm_open(name, O_RDONLY, 0x666);

    /* Memory map the shared memory object */
    ptr = mmap(0, SIZE, PROT_READ, MAP_SHARED, shm_fd, 0);

    
    /* read from shared memory */
     printf(" %s\n", (char*)ptr);
   
    
    /* Remove shared memory object */

    shm_unlink(name);

    return 0;
}
