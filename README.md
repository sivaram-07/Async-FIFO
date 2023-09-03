# Async-FIFO
In this project,multi bit synchronization between different Clock domains is done using ASynchronous FIFOs.You can find the source and simulation files in their respective directory.

# Clock Domain Crossing
CDC refers to the transfer of data signals from one clock domain to another, where each domain operates on its own clock signal. When data needs to be transferred between these clock domains, it's necessary to ensure that the data is correctly synchronized to the receiving clock domain to avoid data corruption or incorrect processing.
![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/3184bc21-60ee-4328-8599-1dbd492372d4)

# Two Flip-Flop Synchronizers
A synchronizer is a device that samples an asynchronous signal and outputs a version
of the signal that has transitions synchronized to a local or sample clock.The simplest and most common synchronizer used by digital designers is a two-flip-flop
synchronizer

# Passing multiple signals(bits) between clock domains
When passing multiple signals between clock domains, simple synchronizers do not guarantee
safe delivery of the data.The problem is that multiple signals that are synchronized to one clock will experience small
data changing skews that can occasionally be sampled on different rising clock edges in a second
clock domain. Even if we could perfectly control and match the trace lengths of the multiple
signals, differences in rise and fall times as well as process variations across a die could
introduce enough skew to cause sampling failures on otherwise carefully matched trace.Multi-bit CDC strategies must be employed to avoid skewed sampling of the multi-bit value.

# Gray Codes
One of the commonly used strategy is Passing multiple CDC bits using gray codes.. Gray codes only allow one bit to change for each clock
transition, eliminating the problem associated with trying to synchronize multiple changing CDC
bits across a clock domain.Standard gray codes have very nice translation properties to convert gray-to-binary and back
again. Using these conversions, it is simple to design efficient gray code counters.

# Multi-bit CDC signal passing using ASynchronous FIFO
Passing multiple bits, whether data bits or control bits, can be done through an asynchronous
FIFO. An asynchronous FIFO is a shared memory or register buffer where data is inserted from
the write clock domain and data is removed from the read clock domain. Since both sender and
receiver operate within their own respective clock domains, using a dual-port buffer, such as a
FIFO, is a safe way to pass multi-bit values between clock domains.
A standard asynchronous FIFO device allows multiple data or control words to be inserted as
long as the FIFO is not full, and the receiver and then extract multiple data or control words
when convenient as long as the FIFO is not empty.
Most of the hard work in a FIFO design is done through the synchronization of gray code
counters.

![image](https://github.com/sivaram-07/Async-FIFO/assets/114935240/f57769f7-b5e5-4fa3-ac87-d6a630983c70)
