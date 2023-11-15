# ECE393FinalProject
Code from here:
https://github.com/lirui-shanghaitech/CNN-Accelerator-VLSI 


To-RUN CODE:
1. source /vol/ece303/genus_tutorial/cadence.env
2. xrun -64bit -gui -access r -timescale 1ns/10ps tb_conv.v CONV_ACC.v PE_FSM.v PE.v WGT_BUF.v PSUM_BUFF.v SYNCH_FIFO.v 
  -More than one way to run this command to start the simulation but this worked for me.
