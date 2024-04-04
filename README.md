# Push_swap

## Introduction

This repository contains the implementation of the Push_swap project, which is part of the curriculum at [Your School/Institution]. Push_swap is a sorting algorithm project that aims to sort a stack of integers using a limited set of operations.


## Main Operations

The main operations used in this implementation are:

    sa: Swap the first two elements at the top of stack A.
    sb: Swap the first two elements at the top of stack B.
    ss: Equivalent to performing both sa and sb simultaneously.
    pa: Push the top element of stack B to stack A.
    pb: Push the top element of stack A to stack B.
    ra: Rotate stack A upwards, i.e., shift all elements up by one. The first element becomes the last.
    rb: Rotate stack B upwards, i.e., shift all elements up by one. The first element becomes the last.
    rr: Equivalent to performing both ra and rb simultaneously.
    rra: Rotate stack A downwards, i.e., shift all elements down by one. The last element becomes the first.
    rrb: Rotate stack B downwards, i.e., shift all elements down by one. The last element becomes the first.
    rrr: Equivalent to performing both rra and rrb simultaneously.

## Chunk Sort Algorithm

The algorithm used for sorting involves chunk sort, which breaks down the sorting process into smaller chunks. Each chunk is sorted separately, and then the sorted chunks are merged to achieve the final sorted order. Arrays are used as the primary data structure for implementing the chunk sort algorithm.


## Post-Optimization

Following the initial sorting using the chunk sort algorithm, a post-optimization step is performed using linked lists. This step aims to optimize the sequence of operations to minimize the total number of operations required to sort the stack.
Performance

For the Push_swap project, achieving maximum efficiency is crucial. The project requirements specify that for sorting 500 numbers, the maximum allowable number of operations is 5500 for full score. This implementation has been optimized to achieve around 3700 operations for sorting 500 numbers.
Custom Checker

In addition to the checker programs provided by the school (checker_linux and checker_mac), a custom checker program has been implemented. This custom checker program is used to validate the sorting operations performed by the Push_swap algorithm.


## How to Run

### Cloning the Repository

To clone the Push_swap repository along with its submodules, follow these steps:

1. Open a terminal window.

2. Navigate to the directory where you want to clone the repository.

3. Run the following command:

    bash

    git clone --recursive <repository_url>

4. Replace <repository_url> with the URL of your Push_swap repository.
This command clones the Push_swap repository along with its submodules.

### Building and Running

Once you have cloned the repository, follow these steps to build and run the Push_swap program:

1. Navigate to the Push_swap directory:

    cd Push_swap

2. Build the Push_swap program by running the make command:

    make

This command compiles the Push_swap program and its dependencies.

4. Once the compilation is complete, you can run the Push_swap program by executing the following command:

    ./push_swap <list_of_numbers>

Replace <list_of_numbers> with the list of integers you want to sort. For example:

    ./push_swap 4 67 2 8 12

This command will display the sequence of operations required to sort the provided list of numbers.

5. Additionally, you can use the custom checker program to validate the sorting operations performed by Push_swap:

    ARG="<list_of_numbers>"; ./push_swap $ARG | ./checker $ARG

Replace <list_of_numbers> with the same list of integers used in step 3. This command will display "OK" if the sorting is successful, or "KO" if there is any discrepancy.

6. Also to count the number of the operations you can type this in terminal 

    ARG="<list_of_numbers>"; ./push_swap $ARG | wc -l