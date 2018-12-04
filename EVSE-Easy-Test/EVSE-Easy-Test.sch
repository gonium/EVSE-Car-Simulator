EESchema Schematic File Version 4
LIBS:EVSE-Easy-Test-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "EVSE Easy Test"
Date "2018-11-30"
Rev "0.1"
Comp "Mathias Dalheimer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pspice:DIODE D1
U 1 1 5C013AD5
P 3150 5150
F 0 "D1" H 3150 5415 50  0000 C CNN
F 1 "1N4007" H 3150 5324 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 3150 5150 50  0001 C CNN
F 3 "~" H 3150 5150 50  0001 C CNN
	1    3150 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C013C45
P 3650 5150
F 0 "R6" V 3443 5150 50  0000 C CNN
F 1 "2k7" V 3534 5150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3580 5150 50  0001 C CNN
F 3 "~" H 3650 5150 50  0001 C CNN
	1    3650 5150
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5C014853
P 7900 5150
F 0 "J2" H 7820 4825 50  0000 C CNN
F 1 "CP diag" H 7820 4916 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 7900 5150 50  0001 C CNN
F 3 "~" H 7900 5150 50  0001 C CNN
	1    7900 5150
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5C014991
P 7750 2100
F 0 "J1" H 7670 1775 50  0000 C CNN
F 1 "Type 2" H 7670 1866 50  0000 C CNN
F 2 "local:Type2-Solderpads" H 7750 2100 50  0001 C CNN
F 3 "~" H 7750 2100 50  0001 C CNN
	1    7750 2100
	-1   0    0    1   
$EndComp
Text GLabel 8050 2200 2    50   Input ~ 0
PE
Text GLabel 8050 2100 2    50   Input ~ 0
CP
Text GLabel 8050 2000 2    50   Input ~ 0
PP
Wire Wire Line
	7950 2000 8050 2000
Wire Wire Line
	7950 2100 8050 2100
Wire Wire Line
	7950 2200 8050 2200
Text GLabel 8250 5150 2    50   Input ~ 0
PE
Text GLabel 8250 5050 2    50   Input ~ 0
CP
$Comp
L Switch:SW_Rotary2x6 SW2
U 1 1 5C014C66
P 1850 5550
F 0 "SW2" H 1900 6328 50  0000 C CNN
F 1 "CP state coding" H 1900 6237 50  0000 C CNN
F 2 "local:LorlinCK-1060" H 1750 6150 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 1750 6150 50  0001 C CNN
	1    1850 5550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Rotary2x6 SW1
U 1 1 5C014D70
P 1800 2350
F 0 "SW1" H 1850 3128 50  0000 C CNN
F 1 "PP current coding" H 1850 3037 50  0000 C CNN
F 2 "local:LorlinCK-1060" H 1700 2950 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 1700 2950 50  0001 C CNN
	1    1800 2350
	1    0    0    -1  
$EndComp
Text GLabel 1150 2050 0    50   Input ~ 0
PP
Wire Wire Line
	1150 2050 1400 2050
$Comp
L Device:R R2
U 1 1 5C014F4C
P 2900 2450
F 0 "R2" H 2830 2404 50  0000 R CNN
F 1 "100" H 2830 2495 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 2450 50  0001 C CNN
F 3 "~" H 2900 2450 50  0001 C CNN
	1    2900 2450
	-1   0    0    1   
$EndComp
NoConn ~ 1400 2750
NoConn ~ 2300 2450
NoConn ~ 2300 2550
NoConn ~ 2300 2650
NoConn ~ 2300 2750
NoConn ~ 2300 2850
NoConn ~ 2300 2950
$Comp
L Device:R R4
U 1 1 5C015394
P 3200 2450
F 0 "R4" H 3130 2404 50  0000 R CNN
F 1 "220" H 3130 2495 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3130 2450 50  0001 C CNN
F 3 "~" H 3200 2450 50  0001 C CNN
	1    3200 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 5C0153D2
P 3500 2450
F 0 "R5" H 3430 2404 50  0000 R CNN
F 1 "680" H 3430 2495 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3430 2450 50  0001 C CNN
F 3 "~" H 3500 2450 50  0001 C CNN
	1    3500 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 5C01547C
P 3800 2450
F 0 "R8" H 3730 2404 50  0000 R CNN
F 1 "1k5" H 3730 2495 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 2450 50  0001 C CNN
F 3 "~" H 3800 2450 50  0001 C CNN
	1    3800 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 2150 2900 2300
Wire Wire Line
	3200 2050 3200 2300
Wire Wire Line
	3500 1950 3500 2300
Wire Wire Line
	3800 1850 3800 2300
Wire Wire Line
	2900 2600 2900 2750
Wire Wire Line
	2900 2750 3200 2750
Wire Wire Line
	3800 2750 3800 2600
Wire Wire Line
	3500 2600 3500 2750
Connection ~ 3500 2750
Wire Wire Line
	3500 2750 3800 2750
Wire Wire Line
	3200 2600 3200 2750
Connection ~ 3200 2750
Wire Wire Line
	3200 2750 3500 2750
Text GLabel 4050 2750 2    50   Input ~ 0
PE
Wire Wire Line
	3800 2750 4050 2750
Connection ~ 3800 2750
NoConn ~ 2300 1750
$Comp
L Device:R R1
U 1 1 5C0168FE
P 2600 2450
F 0 "R1" H 2530 2404 50  0000 R CNN
F 1 "3k3" H 2530 2495 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2530 2450 50  0001 C CNN
F 3 "~" H 2600 2450 50  0001 C CNN
	1    2600 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 2250 2600 2250
Wire Wire Line
	2600 2250 2600 2300
Wire Wire Line
	2300 2150 2900 2150
Wire Wire Line
	2300 2050 3200 2050
Wire Wire Line
	2300 1950 3500 1950
Wire Wire Line
	2300 1850 3800 1850
Wire Wire Line
	2600 2600 2600 2750
Wire Wire Line
	2600 2750 2900 2750
Connection ~ 2900 2750
Text Notes 2900 3500 0    50   ~ 0
Current coding:\n1: not connected\n2: 13A\n3: 20A\n4: 32A\n5: 63A\n6: Invalid coding
Text GLabel 1150 5250 0    50   Input ~ 0
CP
Wire Wire Line
	1100 5250 1450 5250
NoConn ~ 2350 4950
Wire Wire Line
	2350 5050 2700 5050
Wire Wire Line
	2700 5050 2700 5150
Wire Wire Line
	2700 5150 2950 5150
Wire Wire Line
	2350 5150 2700 5150
Connection ~ 2700 5150
Wire Wire Line
	2350 5250 2700 5250
Wire Wire Line
	2700 5250 2700 5150
Wire Wire Line
	3350 5150 3400 5150
Wire Wire Line
	3800 5150 4000 5150
Wire Wire Line
	4000 5150 4000 5550
Wire Wire Line
	4000 5550 1350 5550
Wire Wire Line
	1350 5550 1350 5950
Wire Wire Line
	1350 5950 1450 5950
Text Notes 2950 6950 0    50   ~ 0
Control Pilot states:\n1: A - vehicle disconnected\n2: B - vehicle ready\n3: C - vehicle requested charging\n4: D - vehicle requested vented charging\n5: E - CP-PE short, cable or vehicle failure\n6: Diode fault
Wire Wire Line
	2350 5450 3400 5450
Wire Wire Line
	3400 5450 3400 5150
Connection ~ 3400 5150
Wire Wire Line
	3400 5150 3500 5150
NoConn ~ 2350 5650
Text GLabel 4300 6150 2    50   Input ~ 0
PE
Wire Wire Line
	2350 5750 4000 5750
Wire Wire Line
	4000 5750 4000 5850
$Comp
L Device:R R7
U 1 1 5C01E965
P 3650 5850
F 0 "R7" V 3600 6050 50  0000 C CNN
F 1 "1k2" V 3700 6050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3580 5850 50  0001 C CNN
F 3 "~" H 3650 5850 50  0001 C CNN
	1    3650 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 5850 3500 5850
Wire Wire Line
	3800 5850 4000 5850
Connection ~ 4000 5850
$Comp
L Device:R R3
U 1 1 5C0200DE
P 2900 5950
F 0 "R3" V 2850 6150 50  0000 C CNN
F 1 "270" V 2950 6150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 5950 50  0001 C CNN
F 3 "~" H 2900 5950 50  0001 C CNN
	1    2900 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 5350 4150 5350
NoConn ~ 2350 6050
Wire Wire Line
	2350 6150 4000 6150
Wire Wire Line
	4000 6150 4000 5950
Connection ~ 4000 5950
Wire Wire Line
	4000 5850 4000 5950
Wire Wire Line
	4000 6150 4150 6150
Connection ~ 4000 6150
Wire Wire Line
	4150 5350 4150 6150
Connection ~ 4150 6150
Wire Wire Line
	4150 6150 4300 6150
Wire Wire Line
	2350 5950 2750 5950
Wire Wire Line
	3050 5950 4000 5950
Text Notes 7300 1350 0    118  ~ 24
Type 2 plug connector
Text Notes 7400 4450 0    118  ~ 24
CP diagnostics port
Text Notes 1000 1250 0    118  ~ 24
Protection Pilot
Text Notes 1000 4400 0    118  ~ 24
Control Pilot
Wire Wire Line
	8100 5050 8250 5050
Wire Wire Line
	8100 5150 8250 5150
$EndSCHEMATC
