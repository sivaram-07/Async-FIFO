# TESTBENCH

The data WIDTH is choosen as 8 and fifo-DEPTH is choosen as 16.A sequntial data(1,2...32) is generated and given to the wdata port. And rstn_n is used to reset the read&write pointer and asserting the empty flag.The read and write clock are created and can be changed to a different value as well.

# OUTPUTS

![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/d9a8a3a5-be3c-40fb-b891-89761bcce17d)

You can notice a three cycle delay in de-asserting the empty flag which is due to the fact that the change in write-pointer value will reflect only after three cycles in the read-clock domain.


![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/1f0f1912-e913-4981-b906-06b37791d139)


And all the values sent by the write clock domain is received and synchronized with the read clock.
