EESchema Schematic File Version 4
LIBS:EVSE-Car-Simulator-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Car simulator"
Date "2018-11-26"
Rev "0.5"
Comp "Mathias Dalheimer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 7200 2250 2    60   Input ~ 0
CP
Text GLabel 7200 2350 2    60   Input ~ 0
PE
Wire Wire Line
	7050 2350 7200 2350
Wire Wire Line
	7200 2250 7050 2250
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X03 J5
U 1 1 59A94ED4
P 6850 2250
F 0 "J5" H 6850 2450 50  0000 C CNN
F 1 "Type 2" V 6950 2250 50  0000 C CNN
F 2 "lib:Type2-Solderpads" H 6850 2250 50  0001 C CNN
F 3 "" H 6850 2250 50  0001 C CNN
	1    6850 2250
	-1   0    0    1   
$EndComp
Text GLabel 7200 2150 2    60   Input ~ 0
PP
Wire Wire Line
	7200 2150 7050 2150
$Comp
L EVSE-Car-Simulator-rescue:R-RESCUE-EVSE-Car-Simulator R3
U 1 1 59A94F9B
P 8750 2300
F 0 "R3" V 8830 2300 50  0000 C CNN
F 1 "xxx" V 8750 2300 50  0000 C CNN
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
Text Notes 8350 3000 0    60   ~ 0
Current coding:\nmax. 13A: 1k5 Ohm\nmax. 20A: 680 Ohm\nmax. 32A: 220 Ohm\nmax 63A: 100 Ohm
Text Notes 5700 850  0    118  ~ 24
Type 2 connector
Text Notes 650  800  0    118  ~ 24
Vehicle status
Wire Notes Line
	5400 650  5400 7700
Text Notes 5800 4400 0    118  ~ 24
CP diagnostics
Wire Notes Line
	5500 4050 11150 4050
Text GLabel 7800 5400 0    60   Input ~ 0
CP
Text GLabel 8250 5400 2    60   Input ~ 0
PE
Text Notes 7000 7050 0    276  Italic 55
EVSE car simulator
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X02 J6
U 1 1 5A5523CA
P 8050 5700
F 0 "J6" H 8050 5850 50  0000 C CNN
F 1 "CP Diag" V 8150 5700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8050 5700 50  0001 C CNN
F 3 "" H 8050 5700 50  0001 C CNN
	1    8050 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 5400 8000 5400
Wire Wire Line
	8000 5400 8000 5500
Wire Wire Line
	8100 5500 8100 5400
Wire Wire Line
	8100 5400 8250 5400
Text GLabel 1550 2650 0    60   Input ~ 0
CP
$Comp
L EVSE-Car-Simulator-rescue:D D1
U 1 1 5BFBFA68
P 2300 3550
F 0 "D1" H 2300 3650 50  0000 C CNN
F 1 "1N4007" H 2300 3450 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 2300 3550 50  0001 C CNN
F 3 "" H 2300 3550 50  0001 C CNN
	1    2300 3550
	0    -1   -1   0   
$EndComp
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X02 J2
U 1 1 5BFC007A
P 1900 3000
F 0 "J2" H 1900 3150 50  0000 C CNN
F 1 "A/B" V 2000 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1900 3000 50  0001 C CNN
F 3 "" H 1900 3000 50  0001 C CNN
	1    1900 3000
	-1   0    0    1   
$EndComp
$Comp
L EVSE-Car-Simulator-rescue:R-RESCUE-EVSE-Car-Simulator R1
U 1 1 5BFC0152
P 2750 2950
F 0 "R1" V 2830 2950 50  0000 C CNN
F 1 "2k7" V 2750 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2680 2950 50  0001 C CNN
F 3 "" H 2750 2950 50  0001 C CNN
	1    2750 2950
	1    0    0    -1  
$EndComp
Text GLabel 1550 1950 0    60   Input ~ 0
PE
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X02 J4
U 1 1 5BFC026E
P 3050 3300
F 0 "J4" H 3050 3450 50  0000 C CNN
F 1 "C" V 3150 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3050 3300 50  0001 C CNN
F 3 "" H 3050 3300 50  0001 C CNN
	1    3050 3300
	-1   0    0    1   
$EndComp
$Comp
L EVSE-Car-Simulator-rescue:R-RESCUE-EVSE-Car-Simulator R2
U 1 1 5BFC0392
P 3250 2950
F 0 "R2" V 3330 2950 50  0000 C CNN
F 1 "1k2" V 3250 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3180 2950 50  0001 C CNN
F 3 "" H 3250 2950 50  0001 C CNN
	1    3250 2950
	1    0    0    -1  
$EndComp
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X02 J3
U 1 1 5BFC047F
P 1900 3550
F 0 "J3" H 1900 3700 50  0000 C CNN
F 1 "D-fault" V 2000 3550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1900 3550 50  0001 C CNN
F 3 "" H 1900 3550 50  0001 C CNN
	1    1900 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 3500 2100 3300
Wire Wire Line
	2100 3300 2300 3300
Wire Wire Line
	2300 3300 2300 3400
Wire Wire Line
	2300 3700 2300 3800
Wire Wire Line
	3250 3800 3250 3350
Wire Wire Line
	3250 3250 3250 3100
Wire Wire Line
	2100 3600 2100 3800
Wire Wire Line
	2100 3800 2300 3800
Connection ~ 2300 3800
Wire Wire Line
	2750 1950 2750 2800
Wire Wire Line
	3250 1950 3250 2800
Wire Wire Line
	2300 1950 2300 2250
$Comp
L EVSE-Car-Simulator-rescue:CONN_01X02 J1
U 1 1 5BFC0511
P 1900 2300
F 0 "J1" H 1900 2450 50  0000 C CNN
F 1 "E" V 2000 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1900 2300 50  0001 C CNN
F 3 "" H 1900 2300 50  0001 C CNN
	1    1900 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 3300 2300 3050
Wire Wire Line
	2300 3050 2100 3050
Connection ~ 2300 3300
Wire Wire Line
	2100 2950 2300 2950
Wire Wire Line
	2750 3100 2750 3800
Connection ~ 2750 1950
Connection ~ 2750 3800
Wire Wire Line
	2100 2250 2300 2250
Wire Wire Line
	2100 2350 2300 2350
Wire Wire Line
	2300 2350 2300 2650
Wire Wire Line
	1550 2650 2300 2650
Connection ~ 2300 2650
Wire Wire Line
	2300 2650 2300 2950
Wire Wire Line
	1550 1950 2300 1950
Connection ~ 2300 1950
Wire Wire Line
	2750 1950 3250 1950
Wire Wire Line
	2750 3800 3250 3800
Wire Wire Line
	2300 3800 2750 3800
Wire Wire Line
	2300 1950 2750 1950
Text Notes 1400 5250 0    60   ~ 0
Vehicle state:\nA: Vehicle disconnected\nB: Vehicle connected\nC: Vehicle requested charging\nD: Vehicle requested vented charging (not implemented)\nE: CP and PE shorted -- cable or vehicle failure\nF: EVSE failure (not implemented)
$EndSCHEMATC
