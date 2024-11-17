#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 10

// Define the struct for the storage
typedef struct {
    int *data;
    int start;
    int end;
    long sum;
} ThreadData;

/* Thread function to compute the sum of a portion of the array*/
void 
