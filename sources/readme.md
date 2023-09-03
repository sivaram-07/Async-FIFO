# TOP

This module instantiates the other five modules and connect them for correct flow of data.This module is parameterizable so that we can change the WIDTH of data to be stored in the FIFO and DEPTH of FIFO.

# FIFO-MEM

This module contains the fifo-RAM used for writing data from write clock domain and reading data from read clock domain.The RAM has two ports for writing and reading simultaneously.The writing action is synchronized to write clock domain and happen only when the FIFO is not full and write request is made.

# SYNC_W2R and SYNC_R2W

This module contains the two flop synchronizer which is used to synchronize the read and write pointers from one clock domain to another.
SYNC_W2R is for synchronizing write pointer from write clock domain into read clock domain.SYNC_R2W is for synchronizing read pointer from read clock domain into write clock domain.

# WFULL

This module will determine whether the FIFO is full or not by comparing the gray-pointer(which is computed from the binary write address/pointer of the write clock domain) to the synchronized read pointer we get from the SYNC_R2W.

If the graypointer's first two bits and wsync_ptr2 (synchronized read pointer) are different and other bits are same then the FIFO is full.The explaination for doing these is given below.
![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/bed870ba-7ee9-4e3d-9d78-806936501d9f)

Consider the example shown of an 8-deep FIFO. In this example, a 3-bit Gray code pointer is used to
address memory and an extra bit (the MSB of a 4-bit Gray code) is added to test for full and empty conditions. If the
FIFO is allowed to fill the first seven locations (words 0-6) and then if the FIFO is emptied by reading back the
same seven words, both pointers will be equal and will point to address Gray-7 (the FIFO is empty). On the next
write operation, the write pointer will increment the 4-bit Gray code pointer (remember, only the 3 LSBs are being
used to address memory), making the MSBs different on the 4-bit pointers but the rest of the write pointer bits will
match the read pointer bits, so the FIFO full flag would be asserted. This is wrong! Not only is the FIFO not full,
but the 3 LSBs did not change, which means that the addressed memory location will over-write the last FIFO
memory location that was written. This too is wrong!.

# EMPTY

This module will determine whether the FIFO is empty or not by comparing the gray-pointer(which is computed from the binary read address/pointer of the read clock domain) to the synchronized write pointer we get from the SYNC_W2R.
If the gray-pointer value is equal to that of rsync_ptr2 , then the FIFO is empty.

