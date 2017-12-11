---
title: 'EVSim: a charging station test adapter'
author: Mathias Dalheimer, [evse@gonium.net](mailto:evse@gonium.net?subject=EVSim question)
tags: [EVSE, Wallbox, charging station, electric car]
keywords: [EVSE, charging station, electric mobility, electric car,
	wall plug, Type 2 socket, adaptor]

---


# What is this about?

A charging station for electric cars is just a glorified three-phase
socket. You need to simulate a car for the charging station to switch power on. You can achieve this by using the adaptor presented here. With it you can

* build a charging station tester in order to evaluate and certify
charging stations,
* build a charging station to mobile home adaptor or
* connect a legacy electric car to modern charging stations.

Of course you can also run a waffle iron:

<iframe width="640" height="360" src="https://www.youtube.com/embed/pUEp3uWAWqY?rel=0" frameborder="0" allowfullscreen></iframe>

Bevor eine Ladesäule den Ladestrom freischaltet, wird zunächst eine
einfache Kommunikation mit dem Elektroauto aufgebaut. Dabei wird z.B.
geprüft, ob wirklich ein Elektroauto angeschlossen ist. Außerdem
wird dem Elektroauto auch der maximal verfügbare Ladestrom von der
Ladesäule mitgeteilt. 

![](img/fahrzeugsimulator2.jpg)

Der Simulator setzt das Ladeprotokoll nach DIN EN 61851-1:2012 bzw.
J1772 um. Die passende Platine kann für eigene Experimente gekauft werden,
siehe [Bezugsquelle](#bezugsquelle).  Die Platine entstand, weil ich
eine Softwareschnittstelle zu einer Wallbox entwickeln wollte. Da der
Ladevorgang das mindestens das Durchlaufen der Zustände A-C vorsieht hab
ich einen kleinen Simulator gebraucht, der auf dem Schreibtisch liegen
kann und ein Auto simuliert. Mit diesem Simulator kann man alle
Ladezustände eines Elektroautos simulieren und die Reaktion der Wallbox
prüfen. Über Schalter lassen sich verschiedene Zustände einstellen sowie
Fehler wie eine defekte Diode und einen Kurzschluss zwischen CP und PE
simulieren. Ebenso kann man einen Ladevorgang simulieren und dann die
notwenigen Sicherheitsprüfungen an der Wallbox durchführen.



