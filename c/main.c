#include <stdio.h>
#include <unistd.h>



#include "stdio.h"
#include "unistd.h"
#include "inttypes.h"

uintptr_t vtop(uintptr_t vaddr) {
    FILE *pagemap;
    intptr_t paddr = 0;
    uint64_t offset = (vaddr / sysconf(_SC_PAGESIZE)) * sizeof(uint64_t);
    uint64_t e;

    // https://www.kernel.org/doc/Documentation/vm/pagemap.txt
    if ((pagemap = fopen("/proc/self/pagemap", "r"))) {
        if (lseek(fileno(pagemap), offset, SEEK_SET) == offset) {
            if (fread(&e, sizeof(uint64_t), 1, pagemap)) {
                if (e & (1ULL << 63)) { // page present ?
                    paddr = e & ((1ULL << 54) - 1); // pfn mask
                    paddr = paddr * sysconf(_SC_PAGESIZE);
                    // add offset within page
                    paddr = paddr | (vaddr & (sysconf(_SC_PAGESIZE) - 1));
                }   
            }   
        }   
        fclose(pagemap);
    }   

    return paddr;
}   

int b; 
int main()
{
	int a = 0x10;
	b = 9;
	uintptr_t pa = (uint64_t)&a;
	uintptr_t pb = (uint64_t)&b;
	printf("%p:  %16.16lx\n", &a, vtop(pa));
	printf("%p:  %16.16lx\n", &b, vtop(pb));
}

