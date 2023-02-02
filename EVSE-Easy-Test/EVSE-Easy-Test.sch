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
P 3150 5200
F 0 "D1" H 3150 5465 50  0000 C CNN
F 1 "1N4007" H 3150 5374 50  0000 C CNN
F 2 "local:D_DO-41_SOD81_P7.62mm_Horizontal" H 3150 5200 50  0001 C CNN
F 3 "~" H 3150 5200 50  0001 C CNN
	1    3150 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C013C45
P 3650 5200
F 0 "R6" V 3443 5200 50  0000 C CNN
F 1 "2k7" V 3534 5200 50  0000 C CNN
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3580 5200 50  0001 C CNN
F 3 "~" H 3650 5200 50  0001 C CNN
	1    3650 5200
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5C014853
P 7900 5150
F 0 "J2" H 7820 4825 50  0000 C CNN
F 1 "CP diag" H 7820 4916 50  0000 C CNN
F 2 "local:Pin_Header_Straight_1x02_Pitch2.54mm" H 7900 5150 50  0001 C CNN
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
F 2 "local:RIACon175_3poles_AKL175-03" H 7750 2100 50  0001 C CNN
F 3 "https://cdn-reichelt.de/documents/datenblatt/D700/AKL_175-03.PDF" H 7750 2100 50  0001 C CNN
F 4 "AKL 175-03" H 7750 2100 50  0001 C CNN "Reichelt Artikelnummer"
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
P 1850 5500
F 0 "SW2" H 1900 6278 50  0000 C CNN
F 1 "CP state coding" H 1900 6187 50  0000 C CNN
F 2 "local:LorlinCK-1060" H 1750 6100 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/C200/DS-Serie%23LOR.pdf" H 1750 6100 50  0001 C CNN
	1    1850 5500
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
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 2450 50  0001 C CNN
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
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3130 2450 50  0001 C CNN
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
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3430 2450 50  0001 C CNN
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
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 2450 50  0001 C CNN
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
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2530 2450 50  0001 C CNN
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
Text GLabel 1150 5200 0    50   Input ~ 0
CP
Wire Wire Line
	1100 5200 1450 5200
NoConn ~ 2350 5000
Wire Wire Line
	2350 5100 2700 5100
Wire Wire Line
	2700 5100 2700 5200
Wire Wire Line
	2700 5200 2950 5200
Wire Wire Line
	2350 5200 2700 5200
Connection ~ 2700 5200
Wire Wire Line
	2350 5300 2700 5300
Wire Wire Line
	2700 5300 2700 5200
Wire Wire Line
	3800 5200 4000 5200
Text Notes 2950 6950 0    50   ~ 0
Control Pilot states:\n1: Diode fault (in state C)\n2: A - vehicle disconnected\n3: B - vehicle ready\n4: C - vehicle requested charging\n5: D - vehicle requested vented charging\n6: E - CP-PE short, cable or vehicle failure\n
NoConn ~ 2350 5700
Text GLabel 4300 6200 2    50   Input ~ 0
PE
$Comp
L Device:R R7
U 1 1 5C01E965
P 3650 5900
F 0 "R7" V 3600 6100 50  0000 C CNN
F 1 "1k2" V 3700 6100 50  0000 C CNN
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3580 5900 50  0001 C CNN
F 3 "~" H 3650 5900 50  0001 C CNN
	1    3650 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5900 4000 5900
Connection ~ 4000 5900
$Comp
L Device:R R3
U 1 1 5C0200DE
P 3150 6000
F 0 "R3" V 3100 6200 50  0000 C CNN
F 1 "270" V 3200 6200 50  0000 C CNN
F 2 "local:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 6000 50  0001 C CNN
F 3 "~" H 3150 6000 50  0001 C CNN
	1    3150 6000
	0    1    1    0   
$EndComp
NoConn ~ 2350 6100
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
Wire Wire Line
	4000 5200 4000 5400
NoConn ~ 2350 5800
Wire Wire Line
	4000 5900 4000 6000
Wire Wire Line
	2350 6000 3000 6000
Wire Wire Line
	3300 6000 4000 6000
Connection ~ 4000 6000
Wire Wire Line
	4000 6000 4000 6200
Wire Wire Line
	1450 5900 1450 5500
Wire Wire Line
	4000 6200 4300 6200
Wire Wire Line
	2350 5400 4000 5400
Connection ~ 4000 5400
Wire Wire Line
	4000 5400 4000 5900
Wire Wire Line
	2350 5900 3450 5900
Wire Wire Line
	3450 5600 3450 5900
Wire Wire Line
	2350 5600 3450 5600
Connection ~ 3450 5900
Wire Wire Line
	3450 5900 3500 5900
Wire Wire Line
	3350 5200 3450 5200
Wire Wire Line
	3450 5200 3450 5500
Wire Wire Line
	1450 5500 3450 5500
Connection ~ 3450 5200
Wire Wire Line
	3450 5200 3500 5200
Wire Wire Line
	3450 5200 3450 4900
Wire Wire Line
	2350 4900 3450 4900
$EndSCHEMATC
