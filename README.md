# HEX-to-7-Segment-Decoder
## Overview
This project implements a HEX-to-7-segment decoder on the Nexys4 FPGA board using VHDL and the Vivado Design Suite. The system converts a 4-bit binary input (0–15) into its corresponding hexadecimal digit and displays it on a 7-segment display.

## Features
- 4-bit binary input (0000–1111) using onboard slide switches  
- Decoding of binary input to hexadecimal display (0–F)  
- Time-multiplexed display across two 7-segment units  
- Alternating activation of displays for continuous visual output  

## Technologies Used
- VHDL  
- Vivado Design Suite  
- Nexys4 FPGA Board  

## Functionality
The system reads a 4-bit binary input from the FPGA switches and decodes it into the corresponding 7-segment pattern. The output is displayed using two 7-segment displays in an alternating (time-multiplexed) manner. Each display is activated in sequence with a short delay, creating the illusion of a steady output to the human eye.

## Key Concepts
- Digital logic design  
- Finite State Machines (FSM)  
- Time-multiplexing  
- FPGA implementation and testing  

## Applications
- Digital display systems  
- Embedded hardware interfaces  
- FPGA-based control systems  

## Learning Outcomes
- Practical experience with FPGA programming using VHDL  
- Understanding of combinational logic and display decoding  
- Implementation of time-multiplexed display systems  
- Hardware-level debugging and simulation using Vivado  
