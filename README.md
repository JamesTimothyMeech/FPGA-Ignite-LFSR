# FPGA-Ignite-LFSR

The choice of feedback taps at flip flop 31, 6, 5, and 1 is based on this paper: https://www.ijera.com/papers/Vol4_issue6/Version%206/P0460699102.pdf

The theory which describes where the feedback taps should be to maximize the period of the linear feedback shift register is here: https://sus.ziti.uni-heidelberg.de/Lehre/WS1819_DST/LFSR.pdf

To test the design in simulation run the bash script: 
```
./simulate.sh
```
You might have to make the script executable on your machine for this to work!

Dependencies:
```
iverilog
vvp
gtkwave
```

