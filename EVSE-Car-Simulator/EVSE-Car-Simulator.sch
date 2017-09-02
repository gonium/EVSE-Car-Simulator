EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:EVSE-Car-Simulator-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Car simulator"
Date "2017-09-01"
Rev "0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R2
U 1 1 59A9487E
P 4050 5550
F 0 "R2" V 4130 5550 50  0000 C CNN
F 1 "1k2" V 4050 5550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3980 5550 50  0001 C CNN
F 3 "" H 4050 5550 50  0001 C CNN
	1    4050 5550
	0    -1   -1   0   
$EndComp
$Comp
L D D1
U 1 1 59A949FC
P 1800 2150
F 0 "D1" H 1800 2250 50  0000 C CNN
F 1 "1N4007" H 1800 2050 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 1800 2150 50  0001 C CNN
F 3 "" H 1800 2150 50  0001 C CNN
	1    1800 2150
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 J4
U 1 1 59A94BAC
P 3700 5750
F 0 "J4" H 3700 5900 50  0000 C CNN
F 1 "vehicle ready" V 3800 5750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3700 5750 50  0001 C CNN
F 3 "" H 3700 5750 50  0001 C CNN
	1    3700 5750
	0    1    1    0   
$EndComp
Text GLabel 7200 2250 2    60   Input ~ 0
CP
Text GLabel 7200 2350 2    60   Input ~ 0
PE
Wire Wire Line
	7050 2350 7200 2350
Wire Wire Line
	7200 2250 7050 2250
$Comp
L CONN_01X03 J5
U 1 1 59A94ED4
P 6850 2250
F 0 "J5" H 6850 2450 50  0000 C CNN
F 1 "Typ 2 Stecker" V 6950 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6850 2250 50  0001 C CNN
F 3 "" H 6850 2250 50  0001 C CNN
	1    6850 2250
	-1   0    0    1   
$EndComp
Text GLabel 7200 2150 2    60   Input ~ 0
PP
Wire Wire Line
	7200 2150 7050 2150
$Comp
L R R3
U 1 1 59A94F9B
P 8750 2300
F 0 "R3" V 8830 2300 50  0000 C CNN
F 1 "220" V 8750 2300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8680 2300 50  0001 C CNN
F 3 "" H 8750 2300 50  0001 C CNN
	1    8750 2300
	0    -1   -1   0   
$EndComp
Text GLabel 9050 2300 2    60   Input ~ 0
PE
Text GLabel 8450 2300 0    60   Input ~ 0
PP
Wire Wire Line
	8450 2300 8600 2300
Wire Wire Line
	8900 2300 9050 2300
Text GLabel 1550 2150 0    60   Input ~ 0
N1
Text GLabel 2050 2150 2    60   Input ~ 0
PE
Wire Wire Line
	1550 2150 1650 2150
Wire Wire Line
	1950 2150 2050 2150
Text GLabel 3450 5550 0    60   Input ~ 0
CP
Text GLabel 4350 5550 2    60   Input ~ 0
N1
Wire Wire Line
	3450 5550 3650 5550
Wire Wire Line
	3750 5550 3900 5550
Wire Wire Line
	4200 5550 4350 5550
Text GLabel 1550 5500 0    60   Input ~ 0
CP
$Comp
L R R1
U 1 1 59A954A9
P 2150 5500
F 0 "R1" V 2230 5500 50  0000 C CNN
F 1 "2k7" V 2150 5500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2080 5500 50  0001 C CNN
F 3 "" H 2150 5500 50  0001 C CNN
	1    2150 5500
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 J2
U 1 1 59A95505
P 1800 5700
F 0 "J2" H 1800 5850 50  0000 C CNN
F 1 "vehicle detected" V 1900 5700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1800 5700 50  0001 C CNN
F 3 "" H 1800 5700 50  0001 C CNN
	1    1800 5700
	0    1    1    0   
$EndComp
Text GLabel 2450 5500 2    60   Input ~ 0
N1
Wire Wire Line
	1550 5500 1750 5500
Wire Wire Line
	1850 5500 2000 5500
Wire Wire Line
	2300 5500 2450 5500
$Comp
L CONN_01X02 J1
U 1 1 59A95609
P 1800 2550
F 0 "J1" H 1800 2700 50  0000 C CNN
F 1 "diode fault" V 1900 2550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1800 2550 50  0001 C CNN
F 3 "" H 1800 2550 50  0001 C CNN
	1    1800 2550
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 J3
U 1 1 59A956A7
P 3650 2350
F 0 "J3" H 3650 2500 50  0000 C CNN
F 1 "CP short circuit" V 3750 2350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3650 2350 50  0001 C CNN
F 3 "" H 3650 2350 50  0001 C CNN
	1    3650 2350
	0    1    1    0   
$EndComp
Text GLabel 3400 2150 0    60   Input ~ 0
CP
Text GLabel 3900 2150 2    60   Input ~ 0
N1
Wire Wire Line
	3400 2150 3600 2150
Wire Wire Line
	3700 2150 3900 2150
Wire Wire Line
	1850 2350 2000 2350
Wire Wire Line
	1750 2350 1600 2350
Wire Wire Line
	1600 2350 1600 2150
Connection ~ 1600 2150
Wire Wire Line
	2000 2350 2000 2150
Connection ~ 2000 2150
Text Notes 8350 3000 0    60   ~ 0
Current coding:\nmax. 13A: 1k5 Ohm\nmax. 20A: 680 Ohm\nmax. 32A: 220 Ohm\nmax 63A: 100 Ohm
Text Notes 5700 850  0    118  ~ 24
Type 2 connector
Text Notes 750  4400 0    118  ~ 24
Vehicle status
Text Notes 750  900  0    118  ~ 24
Vehicle fault simulation
Wire Notes Line
	5400 650  5400 7700
Wire Notes Line
	5350 4050 600  4050
Text Notes 5800 4400 0    118  ~ 24
CP diagnostics
Wire Notes Line
	5500 4050 11150 4050
Text GLabel 6900 5100 0    60   Input ~ 0
CP
Text GLabel 6900 5650 0    60   Input ~ 0
PE
$Comp
L CONN_01X01 J6
U 1 1 59A9695E
P 7200 5100
F 0 "J6" H 7200 5200 50  0000 C CNN
F 1 "CP diag" V 7300 5100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7200 5100 50  0001 C CNN
F 3 "" H 7200 5100 50  0001 C CNN
	1    7200 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 J7
U 1 1 59A969B7
P 7200 5650
F 0 "J7" H 7200 5750 50  0000 C CNN
F 1 "PE diag" V 7300 5650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7200 5650 50  0001 C CNN
F 3 "" H 7200 5650 50  0001 C CNN
	1    7200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5650 7000 5650
Wire Wire Line
	7000 5100 6900 5100
Text Notes 7000 7050 0    276  Italic 55
EVSE car simulator
$EndSCHEMATC
