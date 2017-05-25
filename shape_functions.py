import numpy as np
import matplotlib.pyplot as plt

# circle
f = open('circle.txt', 'w')

step_size = 0.02
radius = 1.0
time = 0
z_const = 0.0
x_coor = []
y_coor = []
# draw each quarter
# first
for x in np.arange(start=0.0, stop=radius+step_size, step=step_size):
    y = np.sqrt((radius**2)-(x**2))
    f.write(str(time) + ' ' + str(x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(x)
    y_coor.append(y)
    time += 1
# second
for x in np.arange(start=radius-step_size, stop=0.0, step=-step_size):
    y = np.sqrt((radius**2)-(x**2))
    f.write(str(time) + ' ' + str(x) + ' ' + str(-y) + ' ' + str(z_const) + '\n')
    x_coor.append(x)
    y_coor.append(-y)
    time += 1
# third
for x in np.arange(start=0.0, stop=radius+step_size, step=step_size):
    y = np.sqrt((radius**2)-(x**2))
    f.write(str(time) + ' ' + str(-x) + ' ' + str(-y) + ' ' + str(z_const) + '\n')
    x_coor.append(-x)
    y_coor.append(-y)
    time += 1
# fourth
for x in np.arange(start=radius-step_size, stop=0.0, step=-step_size):
    y = np.sqrt((radius**2)-(x**2))
    f.write(str(time) + ' ' + str(-x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(-x)
    y_coor.append(y)
    time += 1
f.write(str(time) + ' ' + str(0.0) + ' ' + str(radius) + ' ' + str(z_const))
x_coor.append(0.0)
y_coor.append(radius)
f.close()

plt.plot(x_coor, y_coor)
plt.axis([-2,2,-2,2])
plt.show()


# heart shape
f = open('heart.txt', 'w')

x_coor = []
y_coor = []
time = 0
# compute each quarter
# first
for x in np.arange(start=0.0, stop=1.0+step_size, step=step_size):
    y = np.abs(x)+np.sqrt(1 - (x**2))
    f.write(str(time) + ' ' + str(x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(x)
    y_coor.append(y)
    time += 1
# second
for x in np.arange(start=1.0, stop=0.0, step=-step_size):
    y = np.abs(x)-np.sqrt(1 - (x**2))
    f.write(str(time) + ' ' + str(x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(x)
    y_coor.append(y)
    time += 1
# third
for x in np.arange(start=0.0, stop=1.0+step_size, step=step_size):
    y = np.abs(x)-np.sqrt(1 - (x**2))
    f.write(str(time) + ' ' + str(-x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(-x)
    y_coor.append(y)
    time += 1
# fourth
for x in np.arange(start=1.0, stop=0.0, step=-step_size):
    y = np.abs(x)+np.sqrt(1 - (x**2))
    f.write(str(time) + ' ' + str(-x) + ' ' + str(y) + ' ' + str(z_const) + '\n')
    x_coor.append(-x)
    y_coor.append(y)
    time += 1
f.write(str(time) + ' ' + str(0.0) + ' ' + str(1.0) + ' ' + str(z_const))
x_coor.append(0.0)
y_coor.append(1.0)
f.close()


plt.plot(x_coor, y_coor)
plt.axis([-2,2,-2,2])
plt.show()
