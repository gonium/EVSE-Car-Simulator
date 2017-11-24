---
title: 'EVSim: Tester für Ladestationen'
author: Mathias Dalheimer, [evse@gonium.net](mailto:evse@gonium.net?subject=EVSim Frage)
tags: [EVSE, Ladesäule, Elektromobilität, Tester, Ladestation]
keywords: [EVSE, Ladesäule, Elektromobilität, Ladesẗation, Tester,
	Schuko, Typ2, Adapter, Ladestationtester]

---


# Worum geht es hier?

Eine Ladestation für Elektroautos ist eine glorifizierte
Drehstromsteckdose. Damit die Ladestation den Strom anschaltet muss man
ihr ein Auto vorgaukeln --- dazu nutzt man einen Autosimulator.
Mit dem hier vorgestellten Simulator kann man z.B.

* Einen [Funktionstester für Wallboxen bauen](#ladestationstester) und
damit [Ladestationen prüfen](#pruefung),
* einen [Ladesäule-nach-Wohnwagen-Adapter bauen](#wohnwagenadapter) oder
* einen eigenen Laderegler an Typ2-Ladesäulen anschließen.

Natürlich kann man aber auch ein Waffeleisen damit betreiben:

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


# Wie kommuniziert das Elektroauto mit der Ladesäule?

Eine Typ 2-Steckdose beinhaltet nicht nur die Stromversorgung, sondern
auch zwei Kommunikationsleitungen. Über diese werden folgende Funktionen
koordiniert (vgl. DIN EN 61851-1:2012):

* Überprüfung, ob das Fahrzeug vorschriftsmäßig angeschlossen ist,
* ständige Überwachung des Schutzleiterdurchgangs,
* Einschalten des Systems,
* Ausschalten des Systems,
* Auswahl des Ladestroms,
* Einstellen des Ladestroms,
* Sperren/Freigeben der Stecker.

Ein Typ2-Stecker benutzt dafür folgenden Leitungen:

* Einem Drehstromanschluss, also die drei Außenleiter L1, L2 und L3,
	einem Neutralleiter N sowie einer Schutzerde PE.
* Einer Signalleitung "Proximity Plug" (PP), über welche
	die Strombelastbarkeit des Kabels erkannt wird.
* Einer Signalleitung "Control Pilot" (CP). Auf dieser Leitung werden
	Sicherheitsprüfungen durchgeführt sowie der maximale Ladestrom dem
	Elektroauto mitgeteilt. Das Elektroauto signalisiert außerdem, ob es
	für eine Ladung bereit ist.

Die Kommunikation ist sehr simpel --- auf der Seite der Ladestation
reichen ein paar analoge Bauteile aus, siehe z.B.
[AnalogEVSE](http://analogevse.xyz). Auf der Seite des Fahrzeugs sind
ebenfalls nur sehr wenige Komponenten erforderlich.

## Der Proximity Plug (PP)

Der maximal zulässige Ladestrom, den das Kabel verkraftet, wird über
einen Widerstand zwischen PP und der Schutzerde PE kodiert. Nach DIN EN
61851-1:2012 sind folgende Widerstände zulässig:

| Widerstand | Maximaler Ladestrom |
|-----------:|--------------------:|
| 100 Ohm    |               63 A  |
| 220 Ohm    |               32 A  |
| 680 Ohm    |               20 A  |
| 1500 Ohm   |               13 A  |

Werte kleiner als 75 Ohm oder größer als 2200 Ohm werden als Fehler
interpretiert. Dieser Widerstand beschreibt den *maximalen* Ladestrom:
Wenn dieser überschritten wird kommt es zu Schäden am Kabel. Der
reale Ladestrom muss also kleiner bleiben. Der Widerstand muss eine
Belastbarkeit von mehr als 0,5 Watt haben.

Üblicherweise wird ein entsprechender Widerstand in den Typ2-Stecker
selbst integriert. Das Gehäuse des Steckers bietet viel Platz für einen
Widerstand --- mit etwas Schrumpfschlauch entsteht so ein robuster und
sicherer Aufbau. Die EVSim-Platine bietet aber ebenso einen Platz für
den Widerstand.

## Der Control Pilot (CP)

Der Control Pilot setzt die restlichen Funktionen um. Dabei
schaltet das Elektroauto zwei verschiedene Widerstände zwischen CP und
PE. Zusätzlich wird eine Diode in CP gesetzt.  Die Wallbox erzeugt ein
Kleinspannungssignal, welches dann durch die Widerstände und die Diode
verändert wird. Dadurch können verschiedene Zustände detektiert und der
momentan verfügbare Ladestrom kommuniziert werden.

![](img/Ladephasen.png)

Die folgenden sechs Zustände sind möglich:

| Zustand| Fzg. angeschlossen | Laden möglich | Spannung CP-PE  | Frequenz |
|:-------|:-------------------|:--------------|----------------:|:---------|
| A      | Nein               | Nein          | 12V             |DC        |
| B      | Ja                 | Nein          | 9V/-12V         |1 kHz     |
| C      | Ja                 | Ja            | 6V/-12V         |1 kHz     |
| D      | Ja                 | Ja            | 3V/-12V         |1 kHz     |
| E      | Ja                 | Nein          | 0V              | -        |
| F      | Ja                 | Nein          | -               | -        |

Im Zustand A ist kein Fahrzeug angeschlossen. Die Wallbox legt eine
Gleichspannung von 12V zwischen CP und PE an. Sobald ein Kabel
eingesteckt wird, wechselt die Wallbox in den Status B: Die
Gleichspannung wird durch ein PWM-Signal mit 1kHz ersetzt, zwischen -12V
und 12V. Die Diode im Fahrzeug bewirkt, das der negative Anteil
verworfen wird. Auf diese Weise kann die Wallbox ein Fahrzeug von einem
zufälligen Kurzschluss (z.B. Kabel liegt im Regen) unterscheiden. Im
Fahrzeug wird außerdem ein Widerstand von 2k7 Ohm zwischen CP und PE
geschaltet. Damit sinkt die positive Spannung auf 9V ab. Das Fahrzeug
ist nun korrekt angeschlossen und der Zustand B erreicht.

Sobald das Fahrzeug zum Laden bereit ist wird ein weiterer Widerstand
(1k2 Ohm) zwischen CP und PE geschaltet. Damit sinkt die CP-PE-Spannung
auf 6V, der Zustand C ist erreicht. Die Wallbox schaltet den Ladestrom
frei, der Ladevorgang beginnt. Für das Laden von Bleibatterien kann eine
Lüftungsanforderung gesendet werden (Zustand D). Damit signalisiert ein
Fahrzeug, das für einen Ladevorgang eine Belüftung notwendig ist --- die
Wallbox kann diese entweder sicherstellen oder den Ladevorgang
abbrechen. *Achtung: Dieser Anwendungsfall ist mittlererweile recht
selten. Daher ist dieser Widerstand auf der Platine nicht vorgesehen.*

Die Zustände E und F sind Fehlerzustände, in denen die Stromversorgung
zum Elektroauto unterbrochen wird. E zeigt einen Kurzschluss zwischen CP
und PE an. Der Zustand F kennzeichnet einen Ausfall der Wallbox, d.h.
zwischen CP und PE besteht keine Verbindung.

Die Ladesäule teilt dem Auto den zur Verfügung stehenden Ladestrom mit.
Dafür wird der Duty Cycle des PWM-Signals angepasst. Dabei gibt es eine
Besonderheit: Die ISO 15118 legt einen Duty Cycle von 5% fest, wenn der
Ladevorgang digital ausgehandelt werden soll (z.B. bei CCS). Es gilt:

| Ladestrom | Duty Cycle (+/- 1%) |
|:----------|:--------------------|
| Digitales Protokoll | 5% |
| 6A - 51A  | $$ dc = \frac{Strom [A]}{0.6} $$ entspricht 10%--85% |
| 51A - 80A  | $$dc = \frac{Strom [A]}{2.5} + 64$$ entspricht 85%--96%|

Ein Duty Cycle kleiner 5% oder größer 96% ist nicht zulässig. Grafisch
sieht das so aus:

![](img/dutycycle.png)

# Funktionsweise der Platine

Der komplette [Schaltplan ist hier (PDF)](img/Schaltplan.pdf). Die
einzelnen Komponenten stelle ich im Folgenden vor. Zunächst einmal
bietet die Platine eine Anschlußmöglichkeit für PP, CP und PE:

![](img/type2-connector.png)

Daran können die entsprechenden Signalleitungen des Ladekabels an die
Platine angeschlossen werden. Diese bietet für CP und PE wiederum einen
separaten Anschluss an:

![](img/cp-diag.png)
![](img/pe-diag.png)

Dort kann man z.B. Messbuchsen verbinden, um den Control Pilot
beobachten zu können. So kann man den Duty Cycle ausrechnen und z.B.
nachprüfen, ob der Ladestrom von der Ladestation korrekt signalisiert
wird. Diese Anschlussmöglichkeit kann aber auch ungenutzt bleiben.

Um den Strom des Ladekabels festzulegen wird ein Widerstand zwischen PP
und PE benötigt. Dieser wird auf der Platine R3 genannt und wird mit 220
Ohm (min. 0,5 Watt, für 32 A Strombelastbarkeit) bzw. einem anderen
Widerstandswert bestückt:

![](img/pp-pe-resistor.png)

Normalerweise wird dieser Widerstand direkt im Typ2-Stecker montiert.
Wer allerdings aus Platzgründen die Platine direkt in den Stecker
einbaut, hat hier die Möglichkeit, den Widerstand zu bestücken.

Damit ein Ladestrom freigegeben wird, muss das Elektroauto zwei weitere
Widerstände in CP einschalten (N1 ist ein internes Netz):

![](img/vehicle-detected.png)
![](img/vehicle-ready.png)

R1 (2k7 Ohm, min. 0,5 Watt) signalisiert der Wallbox, das ein
Elektroauto angeschlossen ist. Der Widerstand R2 (1k2, min. 0,5W)
zeigt die Ladebereitschaft an. Die beiden Widerstände werden über einen
separaten Anschluß (J2 und J4) geschleift, damit man über je einen
Kippschalter die Widerstände in CP einschleifen kann. Zusätzlich haben
die Kippschalter die Funktion, durch Öffnen den Ladevorgang beenden zu
können - erst dann entriegelt eine Ladestation den Stecker, sodass man
ihn abziehen kann.

Abschließend fehlt noch die Diode D1 (1N4007). Diese sorgt dafür, das
der negative Anteil des Pilotsignals weggeschnitten wird. Anhand dieses
Signals erkennt die Wallbox, das tatsächlich ein Elektroauto
angeschlossen ist --- und der Stecker nicht einfach nur im Regen hängt.

![](img/diode-fault.png)

Normalerweise ist J1 geöffnet, d.h. die Wallbox detektiert ein
funktionierendes Elektroauto. Verbindet man einen Kippschalter mit J1,
so kann man einen Diodenfehler simulieren und so die
Sicherheitsabschaltung der Wallbox testen.

Ebenso kann man an J3 einen Kippschalter anschließen. Wird dieser
geschlossen, simuliert man einen Kurzschluss von CP --- auch bei diesem
Fehler muss die Wallbox den Strom abschalten.

![](img/cp-short.png)


# Aufbauanleitung

**ACHTUNG: Netzspannung kann tödlich sein. Der Fahrzeugsimulator darf
nur von Elektrofachkräften aufgebaut werden. Die im nachfolgenden
dargestellten Aufbauvarianten sind nur als Denkanstoß zu verstehen und
dienen nicht als Bauanleitung für betriebsfertige Geräte.  Insbesondere
hafte ich nicht für alle Schäden, die durch den Einsatz dieser Schaltung
entstehen!**

Die Platine kann für unterschiedliche Anwendungszwecke eingesetzt
werden. Ich zeige hier den Aufbau eines Funktionstesters für
Ladestationen, da alle Funktionen der Platine genutzt werden.  Für alle
Aufbauten gilt: Die elektrische Sicherheit ist durch die Verwendung
dieser Platine nicht zwangsläufig sichergestellt. Wer nicht über die
notwendigen elektrotechnischen Kenntnisse verfügt sollte einen
Elektrofachbetrieb konsultieren! Unter anderem die folgenden Aspekte
müssen bedacht werden:

1. Zugentlastung für alle Kabel muss gegeben sein
2. Die Außenleiter, Neutralleiter sowie die Schutzerde werden
	 durchverbunden (z.B. über Wago-Klemmen)
3. Ein korrekt dimmensionierter Leitungsschutzschalter muss verbaut
	 werden.
4. Alle Komponenten müssen isoliert sein.
5. Alle Komponenten müssen richtig dimensioniert sein
	 (Strombelastbarkeit etc.)

Für alle Aufbauten gilt: Die Widerstände und die Diode müssen eingelötet
werden. R1 (2k7 Ohm) und R2 (1k2 Ohm) sind bei jedem Aufbau gleich. Der
Wert für R3 richtet sich nach der Strombelastbarkeit des
Komplettsystems.  Will man z.B. maximal 13A entnehmen, so lötet man
einen 1k5 Ohm Widerstand an die Anschlüsse für R3.  Bei der Diode muss
darauf geachtet werden, das sie richtig herum eingelötet wird --- der
Strich auf dem Diodengehäuse muss in die gleiche Richtung zeigen wie auf
der Platine markiert.

![](img/platine-bestueckt.jpg)

Mit diesem Grundaufbau kann es nun je nach Anwendung weitergehen.

## Aufbau als Ladestationstester {#ladestationstester}

![](img/fahrzeugsimulator.jpg)

Als Gehäuse hat sich das Bopla ET 215 bewährt. Für dieses Gehäuse kann
man [hier auch eine Bohrschablone herunterladen
(PDF)](img/Bopla-ET215-DrillTemplate.pdf). Am Besten mit einem kleinen
Bohrer (3mm) vorbohren und mit einem Stufenbohrer das Loch auf den
passenden Durchmesser bringen:

![](img/gehaeuse-bohren.jpg)

Die Kabelverschraubungen bilden die Zugentlastung für die Kabel. Im
Inneren kann man dann z.B. mit Wagoklemmen die einzelnen Leiter
verbinden:

![](img/gehaeuse-verkabelung.jpg)

An die Anschlüsse CP-D wird eine Messbuchse für CP, an PE-D die Messbuchse
für PE angeschlossen. Vom Ladekabel werden nun PP, CP und PE an die
Platine gelötet. Hierfür muss man gegebenenfalls eine dünnere Litze über
eine Wagoklemme o.ä. mit dem dickerem Schutzleiter verbinden. Die
Glimmlampe installiert man zwischen den Außenleitern und dem
Neutralleiter.

Wenn man eine Drehstrom- oder Schukokupplung installiert kann man
darüber auch einen RCD-Test durchführen und das Drehfeld kontrollieren.
Außerdem kann man natürlich auch ein Gerät an den Simulator anschließen.
Da aus einer Typ2-Steckdose mehr Strom entnommen werden kann, als eine
Schukokupplung maximal zur Verfügung stellen darf, muss in diesem Fall
unbedingt eine Sicherung vorgesehen werden. Dazu eignet sich z.B. ein
Leitungsschutzschalter (10A, A-Charakteristik) oder eine flinke
Schmelzsicherung (10A).

Es fehlen nur noch die Kippschalter --- über diese kann man verschiedene
Fehler und Fahrzeugzustände simulieren. So kann auch ein
kurzgeschlossener CP oder ein Diodenfehler simuliert werden.  Außerdem
zeigt eine oder mehrere Glimmlampe an, ob ein Ladestrom an der
entsprechenden Phase anliegt.  Um die Fehlersuche zu erleichtern kann
man auch Messbuchsen für den Anschluss eines Multimeters oder
Oszilloskops vorsehen.

Für einen sauberen Aufbau empfehle ich die [Kippschalter MS500A (Reichelt-Link)](https://www.reichelt.de/Kippschalter/MS-500A/3/index.html?ACTION=3&GROUPID=7584&ARTICLE=13150&OFFSET=16&) mit [zweipoligen Platinensteckverbindern (Reichelt-Link)](https://www.reichelt.de/Platinen-Steckverbinder/PS-25-2G-WS/3/index.html?ACTION=3&GROUPID=7525&ARTICLE=14825&OFFSET=16&) zu montieren:

![](img/platine-schalter.jpg)

Die Kippschalter werden wie folgt verdrahtet:

| Text     | Anschluss| Funktion Kippschalter      | Ladestrom |
|:---------|:---------|:---------------------------|:----------|
| D-fault  | J1       | Test Diodenfehler          | aus       |
| EV detect| J2       | Fahrzeug angeschlossen (R1)| aus       |
| CP short | J3       | Test CP Kurzschluss        | aus       |
| EV ready | J4       | Fahrzeug ladebereit (R2)   | ein (falls J2 ein) |


## Prüfung einer Ladestation {#pruefung}

Ladestationen sind Bestandteil der Niederspannungsinstallation und müssen
gemäß der VDE 0100-600 geprüft werden. Die Prüfung kann in drei Bereiche
unterteilt werden: Sichtprüfung, Messung und Funktionsprüfung.
Innerhalb einer Ladestation sind auch Sicherheitsfunktionen
umgesetzt: Ein Teil der Messungen kann also nur während eines
Ladevorgangs durchgeführt werden. Daher benötigt man zur Prüfung einen
Fahrzeugsimulator.

Jede Prüfung beginnt mit einer Sichtprüfung: Ist das Gehäuse beschädigt?
Könnte Wasser in die Ladestation gelangt sein? Ist die Isolierung der
Kabel brüchig/beschädigt? Sind andere Gefahren erkennbar? Im Anschluss
kann mit den Messungen begonnen werden:

* Spannung (L-N, L-PE)
* Durchgängigkeit des Schutzleites $R_{lo}$
* Isolationswiderstand $R_{iso}$
* Netzimpedanz $Z_i$
* Schleifenimpendanz $Z_s$
* Erdwiderstand
* Ausschaltzeit des FI $t_a$
* Auslösestromart des FI (Wechsel,- Puls-, Gleichfehlerstrom)
* Auslösestrom des FI (Flankenanstieg)
* Drehfeldprüfung (Richtung des Drehfelds egal)
* Duty Cycle (Tastverhältnis) des Control Pilot

Einige dieser Messungen müssen am Fahrzeugstecker unter Spannung
durchgeführt werden. Indem man den Fahrzeugsimulator in den Zustand C
bringt kann man diese mit dem normalen Installationstester durchführen.
Man misst also während des Funktionstests. Der Funktionstest selbst
beginnt mit dem Simulieren eines normalen Ladeablaufs (vgl. Abschnitt
["Der Control Pilot (CP)"](#der-control-pilot-cp) bezüglich der
			Zustände):

1. Den Tester mit der Ladestation verbinden. Alle Schalter sollten auf
	 der "Aus"-Position sein. Der Zustand A ist erreicht.
2. Den Schalter "EV detect" einschalten. Daraufhin sollte die
	 Ladestation den Stecker verriegeln. Dies entspricht Zustand B.
3. Den Schalter "EV ready" umlegen. Die Ladestation sollte nun den
	 Ladeschütz freigeben und die Glimmlampen sollten einen anliegenden
	 Ladestrom signalisieren --- der Zustand C ist erreicht.
4. Der Ladevorgang kann jederzeit unterbrochen werden, indem man "EV
	 ready" ausschaltet. Durch erneutes Einschalten sollte der Ladestrom
	 wieder angeschaltet werden.
5. Um den Stecker wieder entfernen zu können schaltet man "EV ready" und
	 "EV detect" aus. Der Stecker sollte entriegelt werden.

Dieser grundlegende Ablauf sollte bei jeder Ladestation problemlos
funktionieren. Zusätzlich sollte man die folgenden Messungen
durchführen:

1. Im Zustand C: Der FI wird wie oben dargestellt geprüft.
2. Im Zustand C: Das Drehfeld der Außenleiter ist korrekt, wobei die
	 Drehfeldrichtung keine Rolle spielt.
3. In den Zuständen A, B, C und D: Wenn man "CP short" einschaltet muss die
	 Ladestation einen Fehler anzeigen und in den Zustand E wechseln. Es
	 darf kein Ladestrom anliegen!
4. In den Zuständen A, B, C und D: Sobald "Diode fault" eingeschaltet
	 wird muss die Ladestation einen Fehler anzeigen und in den Zustand E
	 wechseln. Es darf kein Ladestrom anliegen!

Der letzte Test ist umstritten: Die DIN 61851-1:2012 bietet hier einen
gewissen Interpretationsspielraum, ob der Diodenfehler nur zu Beginn des
Ladevorgangs (Zustand A) oder auch in den anderen Zuständen permanent
detektiert werden muss. Die Hager-Ladestationen überwachen permanent.
Die Ladecontroller von Phoenix Contact und die
Keba-Ladestationen führen den Test lediglich im Zustand A, also zu
Beginn des Ladevorgangs, durch. [Im
goingelectric-Forum gibt es dazu mehr
Informationen](https://www.goingelectric.de/forum/ladeequipment/diodentest-machen-wallboxen-das-korrekt-t27212.html).

**Achtung:** Ich habe bereits TÜV-geprüfte Wallboxen eines chinesischen
Herstellers untersucht, die weder auf "CP short" noch "Diode fault"
prüfen. Sobald ein passender Widerstand zwischen CP und PE liegt wird
der Drehstrom angeschaltet. In meinen Augen ist das hochgefährlich. Man
sollte also die korrekte Funktion unbedingt prüfen und sich nicht auf
ein TÜV-Siegel verlassen!

Als letztes muss auch der Dutycycle des Control Pilots überprüft werden,
da dieser den maximalen Ladestrom der Ladesäule dem Auto mitteilt. Hier
sollte man prüfen, ob z.B. ein Ladekabel mit 13A maximaler Belastbarkeit
korrekt von einer mit 20A abgesicherten Ladestation abgelehnt wird.

Mit einem Oszilloskop oder Multimeter zwischen CP und PE misst man dafür
den Duty Cycle und kann diesen dann in den Ladestrom umrechnen. Das
folgende Bild zeigt eine Ladestation von Hager im Zustand C:

![](img/CP-Ladevorgang.png)

Man kann ein Rechtecksignal mit einer Grundfrequenz von 1kHz erkennen.
Das positive Spannungsniveau liegt bei 6V, das negative bei -12V. Der
Duty Cycle liegt bei 16.4%. Es gilt:

$$ Strom [A] = 0.6\cdot dc = 0.6 \cdot 16.4 = 9.83 $$

Das entspricht in etwa der hier eingestellten Ladestrombegrenzung von
10A, d.h. die Ladestation arbeitet korrekt.

### Z.E. Ready

Für Z.E. Ready-Ladestationen gelten zusätzlich noch die Bestimmungen von
Renault. Einerseits muss die Ladestation konstruktiv diese Vorgaben
erfüllen (z.B. DC-Fehlerstromerkennung und die Dimensionierung der
Leitungsschutzschalter), andererseits muss auch die Installation
gewisse Anforderungen erfüllen. Dazu gehören:

1. TT/TN-Netze: Erdungswiderstand kleiner 100 Ohm
2. TT/TN-Netze: Spannung N-PE nicht größer 10V
3. Spannungsdifferenz der Außenleiter gegen Neutralleiter < 10V
4. Oberwellen können den Ladevorgang beenden. Die Netzversorgung muss IEC 61000-2-1, IEC 61000-2-2 sowie EN 50160 erfüllen.

Die Relevanz dieser Kriterien ist allerdings umstritten, siehe [diesen
Thread im
Goingelectric-Forum.](https://www.goingelectric.de/forum/ladeequipment/z-e-ready-was-bedeutet-das-genau-t27327.html).
Im Wiki von Goingelectric werden außerdem [die technischen
Mindestvoraussetzungen](https://www.goingelectric.de/wiki/Renault_ZOE:_Technische_Mindestvoraussetzungen_f%C3%BCr_zuverl%C3%A4ssige_Ladung_Modell_210)
für das Laden einer ZOE 210 diskutiert.

## Aufbau als Wohnwagenadapter {#wohnwagenadapter}

TODO: Bild

Mit diesem Adapter kann man einen Wohnwagen oder Caravan an eine
Ladestation anschließen, um z.B. während einer Reisepause Strom im
Fahrzeug zu haben. Der grundlegende Aufbau entspricht dem
Ladesäulentester oben, wobei auf die Testschalter für den CP-Test (J1 und
J3) verzichtet werden kann. Ebenso kann man auf den Schalter J2 (EV
detect) verzichten: Dieser signalisiert, das ein Fahrzeug an der Ladesäule
angeschlossen ist. Den Schalter ersetzt man durch eine Drahtbrücke,
sodass beim Anstecken des Adapters permanent ein Fahrzeug signalisiert
wird. Keinesfalls darf man allerdings auf den Schalter J4 (EV ready)
verzichten: Ansonsten kann es passieren, das man die Verriegelung des
Steckers nicht wieder lösen und das Kabel nicht aus der Ladesäule
gezogen werden kann.

Da aus einer Typ2-Steckdose mehr Strom entnommen werden
kann, als eine blaue CEE-Steckdose maximal zur Verfügung stellen darf, muss
unbedingt eine Sicherung vorgesehen werden. Dazu eignet sich z.B. ein
Leitungsschutzschalter (10A, A-Charakteristik) oder eine flinke
Schmelzsicherung (10A). Diese muss in die Außenleiter integriert
werden. Ebenso muss man --- entgegen dem Bild oben --- auf die
Wetterbeständigkeit achten. Man sollte also einen IP65-Schalter für J4
und ein entsprechendes Gehäuse mit geeigneten Kabeldurchführungen verwenden.


# EVSim kaufen

Die Designdaten (und diese Anleitung) sind Open Source und unter
[https://github.com/gonium/EVSE-Car-Simulator](https://github.com/gonium/EVSE-Car-Simulator)
verfügbar. Die Schaltung kann man natürlich recht schnell auf einer
Lochrasterplatine aufbauen. Wer lieber einen kleinen Bausatz haben
möchte, kann diesen bei mir bestellen. Der Bausatz enthält:

![](img/platine-leer.jpg)

* Eine Platine (37x18mm) wie oben beschrieben.
* Ein Set Widerstände R1-R3 mit verschiedenen Werten für R3, um
unterschiedliche Strombelastbarkeiten kodieren zu können.
* Die Schutzdiode (1N4007).

Das Ganze kommt --- zusammen mit einer Rechnung --- so bei Euch an:

![](img/bausatz.jpg)

Der Bausatz kostet 6 Euro, der Versand innerhalb Deutschlands bei kleinen Mengen
2 Euro --- bei größeren Mengen entsprechend mehr. Zum Bestellen einfach eine
Mail an [evse@gonium.net](mailto:evse@gonium.net?subject=EVSim Bestellung) 
schreiben. In der Mail bitte die gewünschte Anzahl sowie die
Rechnungsadresse angeben. Ich schicke direkt eine Rechnung mit den
Zahlungsinformationen. Sobald das Geld bei mir eingegangen ist verschicke
ich zeitnah.


# Häufige Fragen (FAQ)

**Ich habe einen Fehler gefunden.**

Für Hinweise auf Fehler etc. bin ich dankbar. Am liebsten sind mir
Fehlerreports [via Github: Hier kann man ein Issue
aufmachen](https://github.com/gonium/EVSE-Car-Simulator/issues). Eine
Mail ist aber auch vollkommen OK.

**Kannst Du mir nicht ein fertiges Gerät verkaufen?**

Momentan gilt: Leider nein, aus Haftungsgründen. Jeder ist für seine
Aufbauten selbst verantwortlich.

**Kannst Du mir nicht Schalter, Buchsen usw. verkaufen?**

Könnte sein, kommt auf meine Lagerbestände an. Einfach fragen! Wenn die
Nachfrage groß genug ist werde ich das permanent anbieten.

**Warum ist der Bausatz so teuer?**

Wenn Du lediglich den Materialwert zugrunde legst kann ich die Frage gut
nachvollziehen. Nimm einfach das passende Zeug aus Deiner Bastelkiste
und bau die Schaltung nach. Andererseits habe ich recht viel Zeit in die
Dokumentation und die Entwicklung einer einfachen, gut lötbaren Platine
gesteckt. Die Platine muss gefertigt werden, die Bauteile müssen
bestellt und zusammen mit der Platine verpackt werden. Auch Rechnung
schreiben und die ganze Verwaltung machen erstaunlich viel Arbeit. 

Mit anderen Worten: Ob es Dir das Geld wert ist musst Du selbst entscheiden!

**Warum nur Vorkasse? Kann ich nicht via Paypal etc. bezahlen?**

Im Moment nehme ich nur Zahlungen via SEPA-Überweisung im Voraus an. Das
hat hauptsächlich den Grund, das so meine Arbeit überschaubar bleibt und
keine Transaktionsgebühren anfallen. Leider musste ich schon meinem Geld
hinterherrennen &mdash; und dazu hab ich schlichtweg keine Lust.


# Versionshistorie

| Wann       | Was                                              |
|:-----------|:-------------------------------------------------|
| 2017.09.09 | V0.2: Bohrungen für CP/PP/PE vergrößert          |
| 2017.09.04 | V0.1: Initiales Layout                           |

