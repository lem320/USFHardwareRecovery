#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "address_map_arm.h"

#include <arpa/inet.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#include "timercpp.h"
#define PORT 8080

#include <chrono>
#include <vector>
#include <thread>

// NB: ALL OF THESE 3 FUNCTIONS BELOW USE SIGNED VALUES INTERNALLY AND WILL
// EVENTUALLY OVERFLOW (AFTER 200+ YEARS OR SO), AFTER WHICH POINT THEY WILL
// HAVE *SIGNED OVERFLOW*, WHICH IS UNDEFINED BEHAVIOR (IE: A BUG) FOR C/C++.
// But...that's ok...this "bug" is designed into the C++11 specification, so
// whatever. Your machine won't run for 200 years anyway...

// Get time stamp in milliseconds.
uint64_t millis()
{
    uint64_t ms = std::chrono::duration_cast<std::chrono::milliseconds>(
                      std::chrono::high_resolution_clock::now().time_since_epoch())
                      .count();
    return ms;
}

// Get time stamp in microseconds.
uint64_t micros()
{
    uint64_t us = std::chrono::duration_cast<std::chrono::microseconds>(
                      std::chrono::high_resolution_clock::now().time_since_epoch())
                      .count();
    return us;
}

// Get time stamp in nanoseconds.
uint64_t nanos()
{
    uint64_t ns = std::chrono::duration_cast<std::chrono::nanoseconds>(
                      std::chrono::high_resolution_clock::now().time_since_epoch())
                      .count();
    return ns;
}

/* Prototypes for functions used to access physical memory addresses */
int open_physical(int);
void *map_physical(int, unsigned int, unsigned int);
void close_physical(int);
int unmap_physical(void *, unsigned int);

/* This program increments the contents of the red LED parallel port */
int main(void)
{
printf("-4\n");

    volatile int *fifo_out; // virtual address pointer to red LEDs
    volatile uint32_t *fifo_out_csr;
	volatile int *key0;

    int fd = -1;      // used to open /dev/mem for access to physical addresses
    void *LW_virtual; // used to map physical addresses for the light-weight bridge

    // Create virtual memory access to the FPGA light-weight bridge

    if ((fd = open_physical(fd)) == -1)
        return (-1);

    if ((LW_virtual = map_physical(fd, LW_BRIDGE_BASE, LW_BRIDGE_SPAN)) == NULL)
        return (-1);

    // Set virtual address pointer to I/O port
    fifo_out = (int *)(LW_virtual + 48);
	fifo_out_csr = (uint32_t *)(LW_virtual);
    key0 = (int *)(LW_virtual + 32);

    int status, valread, client_fd;
    struct sockaddr_in serv_addr;
    char *hello = "Hello from client";
    char buffer[1024] = {0};
    

	while (true) {

		if ((*key0 & 1) == 0) {
			if ((client_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
				printf("\n Socket creation error \n");
				return -1;
			}

			serv_addr.sin_family = AF_INET;
			serv_addr.sin_port = htons(PORT);

			// Convert IPv4 and IPv6 addresses from text to binary form
			if (inet_pton(AF_INET, "169.254.20.28", &serv_addr.sin_addr) <= 0) {
				printf("\nInvalid address/ Address not supported \n");
				return -1;
			}

			if ((status = connect(client_fd, (struct sockaddr *)&serv_addr, sizeof(serv_addr))) < 0) {
				printf("\nConnection Failed \n");
				return -1;
			}
		} else {
			close(client_fd);
		}

		while ((*key0 & 1) == 0) {


				//uint64_t start = nanos();
				uint32_t num = *fifo_out_csr;

				char buff[num*4];

				for (int i = 0; i < num*4; i+=4) {
				    uint32_t x = *fifo_out;

				    buff[i] = (char)(x & 0xFF);
				    buff[i+1] = (char)(x >> 8 & 0xFF);
				    buff[i+2] = (char)(x >> 16 & 0xFF);
				    buff[i+3] = (char)(x >> 24 & 0xFF);

				}

				send(client_fd, buff, num*4, 0);

		}
		std::this_thread::sleep_for(std::chrono::milliseconds(20));
	}
    unmap_physical(LW_virtual, LW_BRIDGE_SPAN); // release the physical-memory mapping
    close_physical(fd);                         // close /dev/mem
    return 0;
}

// Open /dev/mem, if not already done, to give access to physical addresses
int open_physical(int fd)
{
    if (fd == -1)
        if ((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1)
        {
            printf("ERROR: could not open \"/dev/mem\"...\n");
            return (-1);
        }
    return fd;
}

// Close /dev/mem to give access to physical addresses
void close_physical(int fd)
{
    close(fd);
}

/*
 * Establish a virtual address mapping for the physical addresses starting at base, and
 * extending by span bytes.
 */
void *map_physical(int fd, unsigned int base, unsigned int span)
{
    void *virtual_base;

    // Get a mapping from physical addresses to virtual addresses
    virtual_base = mmap(NULL, span, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, base);
    if (virtual_base == MAP_FAILED)
    {
        printf("ERROR: mmap() failed...\n");
        close(fd);
        return (NULL);
    }
    return virtual_base;
}

/*
 * Close the previously-opened virtual address mapping
 */
int unmap_physical(void *virtual_base, unsigned int span)
{
    if (munmap(virtual_base, span) != 0)
    {
        printf("ERROR: munmap() failed...\n");
        return (-1);
    }
    return 0;
}