#!/usr/bin/env  /tool/pandora64/hdk-4.8.1/19/bin/python2.7

##
# Linear regression
import numpy as np
# import matplotlib.pyplot as plt



#def Test0():
#    x = np.linspace(-np.pi, np.pi, 10)
#    c = np.cos(x)
#    plt.plot(x, c)
#
#    plt.show()
#
#def TestRand():
#    num = 50
#    x = np.linspace(50, 100, num)
#    y = np.random.normal(1.5, 1, size= num)
#    z = np.random.normal(1.5, 3, size= num)
#
#   # plt.ylim(50, 150)
#   # plt.(x, y + 1.2 * x)
#   # plt.plot(x, y + 1.2 * x, ".")
#   # plt.plot(x, z + 1.2 * x, ".")
#   # plt.show()

def f(x, theta, a):
    assert (len(x) == len(theta))
    return sum(x * theta + a)

def GenSample():
    num = 1000
    x1Start = 50.0
    x1End = 100.0

    x2Start = 0.0
    x2End = 30.0

    theta = [1.25, -0.2]

    x1 = np.random.random(num) * (x1End - x1Start) + x1Start
    x2 = np.random.random(num) * (x2End - x2Start) + x2Start

    x = np.array([x1, x2])

    # y = np.random.normal(0, 1, size= num)  + sum (x * theta )
    y = np.random.normal(0, 3, size= num)  + np.dot(theta, x)
    z = [0 if val > 90.25 else 1 for val in y]

    return x, z


x, y  = GenSample()

##
# It is not easy to take a good alpha, two small,  convergence slow
# too big cannot convergene
alpha = 0.000000000001

#plt.plot(x, y, "*")
#plt.show()

theta = [0.0, 0.0]
for loop in range(0, 1000):
    deltaK = 0.0
    # loop each sample
    hy = 1.0 / (1 + np.exp( np.dot( theta, x) ) )

    theta = theta + alpha * np.sum( x * (y - hy), axis=1)

    cost = 0.5 * (sum(y - hy) ** 2)
    print ("Loop %d; K is [%f, %f];  cost is %f" % (loop, theta[0], theta[1],  cost ))
    https://www.cnblogs.com/muchen/p/6296957.htmlhttps://www.cnblogs.com/muchen/p/6296957.html
