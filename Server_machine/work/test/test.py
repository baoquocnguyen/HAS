import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2)
y = np.sin(4 * np.pi * x) * np.exp(-5 * x)

plt.fill(x, y, 'r')
plt.grid(True)
plt.show()
