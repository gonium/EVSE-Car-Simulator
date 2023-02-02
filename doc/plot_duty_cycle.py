import matplotlib.pyplot as plt
import numpy as np

lowamps=np.linspace(6, 50.9, 100)
highamps=np.linspace(51, 80, 100)

lowdc = lowamps / 0.6
highdc = highamps / 2.5 + 64

fig= plt.figure(figsize=(8, 4.5))
ax = plt.axes()
ax.plot(lowamps, lowdc, "r-", label="6-51 A")
ax.plot(highamps, highdc, "g-", label="51-80 A")
plt.axhline(5, 0, 1, "b-", label="5% (ISO 15118)")
#plt.title(u"Duty Cycle bei verschiedenen Ladeströmen")
plt.xlabel(u"Ladestrom [A]")
plt.ylabel(u"Duty Cycle [%]")
plt.axis('tight')
plt.legend(loc="upper left")
plt.ylim(0, 100)
plt.savefig("img/dutycycle.png", bbox_inches = 'tight')

