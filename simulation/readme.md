# TESTBENCH

The data WIDTH is choosen as 8 and fifo-DEPTH is choosen as 16.A sequntial data(1,2...32) is generated and given to the wdata port. And rstn_n is used to reset the read&write pointer and asserting the empty flag.The read and write clock are created and can be changed to a different value as well.

# OUTPUTS

![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/6ae8da79-b1c4-48fc-a7bb-f3889fbb73ce)


You can notice a three cycle delay in de-asserting the empty flag which is due to the fact that the change in write-pointer value will reflect only after three cycles in the read-clock domain.


![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/f2bf0ff1-ee6d-41da-bae5-44ec7a53105b)



And all the values sent by the write clock domain is received and synchronized with the read clock.
