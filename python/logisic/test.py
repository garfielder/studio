##!/usr/bin/env  /tool/pandora64/hdk-4.8.1/19/bin/python2.7

##
# Linear regression
import numpy as np
import matplotlib.pyplot as plt


def fun(x):
        y = 1.0 / (1 + np.exp(2.3*x[0] - 1.5*x[1]))



x0 = np.ones((1, 3))
x1 = np.zeros((2, 3))
print (np.append(x0, x1, axis=0))


# https://www.cnblogs.com/sumai/p/5221067.html
