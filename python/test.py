#!/usr/bin/env  /tool/pandora64/hdk-4.8.1/19/bin/python2.7

##
# Linear regression
import numpy as np
import matplotlib.pyplot as plt



a = np.array(range(10), float).reshape(2, 5)

b = np.array([3, 2])

print a

c = np.dot(b, a)

print c

a = np.array([[1, 2, 3], [4, 5, 6]])
print a * np.array([2, 2, 3])
print "last"
print np.sum(a, axis= 1 )


x  =  np.linspace(-15.0, 15.0, 200)
y = 1.0 / (1 + np.exp(-x))

plt.plot(x, y)

plt.show()
