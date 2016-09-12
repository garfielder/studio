#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#include "stdio.h"
#include "unistd.h"
#include "inttypes.h"


int main()
{
    /*
     * O_RDWR :  readable and writeable
     * O_SYNC: For write,block write. Returning to calling process
     *           means the data specified in the write reqeust is successfully
     *         For read, block read. data impage is successfully transferre
     *         into call process
     *         Along with all file attributes.
     * http://pubs.opengroup.org/onlinepubs/7908799/xbd/glossary.html
     */
    int mem_dev = open("/dev/mem", O_RDWR | O_SYNC);

    if (mem_dev == -1){
        fprintf(stderr, "cannot open mem device\n");
    }
    else{
       /*
        * uint32_t : portable integer type introduced in C99 and defined in
        * stdint.h or inttypes.h
        */
       const uint32_t mem_address = 0x0002306a33c;    
       const uint32_t mem_size = 0x100;
       
       uint32_t alloc_mem_size, page_mask, page_size;
       void* mem_pointer, *virt_addr;

        /*
         * Get system configuration 
        */
        page_size = sysconf(_SC_PAGESIZE);
        alloc_mem_size = (mem_size/page_size + 1) * page_size; // page allign
        page_mask = (page_size - 1);

        /*
         *  Memory protection typeL PROT_READ, RPOT_WRITE
         *  flag = MAP_SHARED: determines whether update the mapping are
         *  visiable to other processes mamping the same region
         */

        printf("lyqdbg> %x\n", (mem_address & ~page_mask));
        
        uint32_t  offset = 0x20000;
        mem_pointer = mmap( NULL,
                 0xff,
                 PROT_READ | PROT_WRITE, 
                 MAP_SHARED,
                 mem_dev,
                 offset
                 );
        if (mem_pointer == MAP_FAILED){
            fprintf(stderr, "failed in mmap\n");
            exit(0);
        }


        printf("page size %d\n", page_size);
        

        close(mem_dev);
    }

}


