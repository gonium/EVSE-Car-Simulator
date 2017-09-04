---
title: 'EVSim: Handbuch Elektroauto-Simulator'
author: Mathias Dalheimer, md@gonium.net
tags: [EVSE, Ladesäule, Elektromobilität]
...

---

Bevor eine Ladesäule den Ladestrom freischaltet, wird zunächst eine
einfache Kommunikation mit dem Elektroauto aufgebaut. Dabei wird z.B.
geprüft, ob wirklich ein Elektroauto angeschlossen ist. Andererseits
wird dem Elektroauto auch der maximal verfügbare Ladestrom von der
Ladesäule mitgeteilt.

Der Simulator dient dazu, einer Typ 2-Ladesäule ein Elektroauto
vorzugaukeln.  Mit der hier vorgestellten Platine kann man z.B.

* Einen einfachen Funktionstester für Wallboxen bauen,
* einen Ladesäule-nach-Schuko-Adapter bauen oder
* einen eigenen Laderegler an Typ2-Ladesäulen anschließen.

Der Simulator setzt die  DIN EN 61851 um.

TODO: Hinweise auf Platine


---

# Wie kommuniziert das Elektroauto mit der Ladesäule?

Eine Typ 2-Steckdose beinhaltet nicht nur die Stromversorgung, sondern
auch zwei Kommunikationsleitungen. Über diese werden folgende Funktionen
koordiniert (siehe DIN EN 61851-1):

* Überprüfung, dass das Fahrzeug vorschriftsmäßig angeschlossen ist,
* ständige Überwachung des Schutzleiterdurchgangs,
* Einschalten des Systems,
* Ausschalten des Systems,
* Auswahl des Ladestroms,
* Einstellen des Ladestroms,
* Sperren/Freigeben der Stecker.

Ein Typ2-Stecker besteht aus:

* Einem Drehstromanschluss, also die drei Außenleiter L1, L2 und L3,
	einem Neutralleiter N sowie einer Schutzerde PE.
* Einer Signalleitung "Proximity Plug" (PP), über welche ein eingestecktes
	Kabel sowie dessen Strombelastbarkeit erkannt wird.
* Einer Signalleitung "Control Pilot" (CP). Auf dieser Leitung werden
	Sicherheitsprüfungen durchgeführt sowie der zu verwendende Ladestrom dem
	Elektroauto mitgeteilt. Das Elektroauto signalisiert außerdem, ob es
	für eine Ladung bereit ist.

Die Kommunikation kann mit einfachen analogen Bauteilen ausgewertet
werden, siehe z.B. [AnalogEVSE](http://analogevse.xyz). Auf der Seite
des Fahrzeugs sind nur sehr wenige Komponenten erforderlich.

## Der Proximity Plug (PP)

Der maximal zulässige Ladestrom, den das Kabel verkraftet, wird über
einen Widerstand zwischen PP und der Schutzerde PE kodiert. Nach IEC
61851-1 sind folgende Widerstände zulässig:

| Widerstand | Maximaler Ladestrom |
|-----------:|--------------------:|
| 100 Ohm    |               63 A  |
| 220 Ohm    |               32 A  |
| 680 Ohm    |               20 A  |
| 1500 Ohm   |               13 A  |

Werte kleiner als 75 Ohm oder größer als 2200 Ohm werden als Fehler
interpretiert. Dieser Widerstand beschreibt den *maximalen* Ladestrom:
Würde dieser überschritten, so würde das Kabel beschädigt werden. Der
reale Ladestrom muss also kleiner bleiben. Der Widerstand muss eine
Belastbarkeit von mehr als 0,5 Watt haben.

Üblicherweise wird ein entsprechender Widerstand in den Typ2-Stecker
selbst integriert. Das Gehäuse des Steckers bietet viel Platz für einen
Widerstand --- mit etwas Schrumpfschlauch entsteht so ein robuster und
sicherer Aufbau. Die EVSim-Platine bietet aber ebenso einen Platz für
einen Widerstand. Der Anwendungsfall bestimmt die beste
Umsetzungsvariante.

## Der Control Pilot (CP)

TODO: Bild Widerstände etc.

Der Control Pilot setzt alle o.a. Funktionen um. Dabei schaltet das
Elektroauto zwei verschiedene Widerstände zwischen CP und PE. Zusätzlich
wird eine Diode in CP gesetzt.  Die Wallbox erzeugt ein
Kleinspannungssignal, welches dann durch die Widerstände und die Diode
verändert wird. Dadurch können verschiedene Zustände detektiert und der
momentan verfügbare Ladestrom kommuniziert werden.

Die folgenden sechs Zustände sind möglich:

| Zustand| Fzg. angeschlossen | Laden möglich | V CP-PE  |
|:-------|:-------------------|:--------------|---------:|
| A      | Nein               | Nein          | 12V      |
| B      | Ja                 | Nein          | 9V       |
| C      | Ja                 | Ja            | 6V       |
| D      | Ja                 | Ja            | 3V       |
| E      | Ja                 | Nein          | 0V       |
| F      | Ja                 | Nein          | n/a      |

Im Zustand A ist kein Fahrzeug angeschlossen. Die Wallbox legt eine
Gleichspannung von 12V zwischen CP und PE an. Sobald ein Kabel
eingesteckt wird, wechselt die Wallbox in den Status B. Die
Gleichspannung wird durch ein PWM-Signal mit 1kHz ersetzt, zwischen -12V
und 12V. Die Diode im Fahrzeug bewirkt, das der negative Anteil
verworfen wird. Auf diese Weise kann die Wallbox ein Fahrzeug von einem
zufälligen Kurzschluss (z.B. Kabel liegt im Regen) unterscheiden. Im
Fahrzeug wird außerdem ein Widerstand von TODO zwischen CP und PE
geschaltet. Damit sinkt die positive Spannung auf 9V ab. Das Fahrzeug
ist nun korrekt angeschlossen und der Zustand B erreicht.

Sobald das Fahrzeug zum Laden bereit ist wird ein weiterer Widerstand
(TODO Ohm) zwischen CP und PE geschaltet. Damit sinkt die CP-PE-Spannung
auf 6V, der Zustand C ist erreicht. Die Wallbox schaltet den Ladestrom
frei, der Ladevorgang beginnt. Für das Laden von Bleibatterien kann eine
Lüftungsanforderung gesendet werden (Zustand D). Damit signalisiert ein
Fahrzeug, das für einen Ladevorgang eine Belüftung notwendig ist --- die
Wallbox kann diese entweder sicherstellen oder den Ladevorgang
abbrechen. *Achtung:* Da dieser Anwendungsfall mittlererweile recht
selten ist auf der Platine dieser Widerstand nicht vorgesehen.

Die Zustände E und F sind Fehlerzustände, in denen die Stromversorgung
zum Elektroauto unterbrochen wird. E zeigt einen Kurzschluss zwischen CP
und PE an. Der Zustand F kennzeichnet einen Ausfall der Wallbox, d.h.
zwischen CP und PE besteht keine Verbindung.

# Funktionen des Simulators

Die Simulationsschaltung entstand, weil ich eine Softwareschnittstelle
zu einer Wallbox entwickeln wollte. Da der Ladevorgang das mindestens
das Durchlaufen der Zustände A-C vorsieht hab ich einen kleinen
Simulator gebraucht, der auf dem Schreibtisch liegen kann und ein Auto
simuliert:

TODO: Photo

Mit diesem Simulator kann man (fast) alle Zustände eines Elektroautos
simulieren und die Reaktion der Wallbox messen. Über die Schalter lassen
sich verschiedene Widerstände zwischen CP und PE einstellen sowie Fehler
wie eine defekte Diode und einen Kurzschluss zwischen CP und PE
simulieren.

# Aufbauanleitung

## Aufbau als Fahrzeugsimulator

## Aufbau als Typ2-Schukoadapter


Löten

# Bezugsquelle
