simple Microcontroller Peripherals which contains:
##2 8-bit count-up Timers/Counters
###Timer0
* Works on Addresses starts from 0x40
* Load Data & Configuration from Databus
* Select System Internal Clock or External Clock
* Select Synchronized or Asynchronized External Clock
* Select Edge of External Clock
* Interrupt overflow

###Timer1
* Works on Addresses starts from 0x44
* Load Data & Configuration from Databus
* Works on System Internal Clock only
* 8-bit Timer Period
* 4 mode Prescaler (1:2, 1:4, 1:8, 1:16)
* 4-mode Postscaler (1:1, 1:2, 1:4, 1:8)
* Interrupt overflow

##1 PWM modules
* Works on Address starts from 0x48
* Load Data & Configuration from Databus
* Works on System Internal Clock only
* Max Resolution is 8 bits

##1 8-bit Port with Multiplexed GPIO pins
* Works on Address starts from 0x64
* Load Data & Configuration from Databus
* The Port is multiplexed with Timers & PWM

##8-bit Interrupt Enable Register starts from 0x30
##8-bit Data & Control Bus System to communicate the Whole System

####Design is implemented using VHDL .
####Design is simulated using do file.
####Design in synthesized.
####Area, timing, constraint are reported

![Design] (https://github.com/abdallahmagdy1993/Micro-Controller-VLSI/blob/master/Design.PNG)


#Tools
###Platforms: Linux /windows
###Languages: VHDL
###Tools: Modelsim & Synopsis DC
