import csv
import numpy as np
import matplotlib.pyplot as plt


def double_coords(coords):
    coords_new = []
    for x, y, z in coords:
        coords_new.append((x, y, z))
        coords_new.append((x, y, z))
    return coords_new


def make_circle(double_points = True, draw=True, step_size = 0.02, radius = 1.0, z_const = 0.0):
    # circle
    f = open('../docs/circle.txt', 'w')
    mw = csv.writer(f, delimiter=" ")

    # first quarter
    coords1 = []
    for x in np.arange(start=0.0, stop=radius+step_size, step=step_size):
        y = np.sqrt((radius**2)-(x**2))
        coords1.append((x,y,z_const))
    # other quarters
    coords2 = list(reversed([(x,-y,z) for (x,y,z) in coords1]))
    coords3 = [(-x,-y,z) for (x,y,z) in coords1]
    coords4 = list(reversed([(-x,y,z) for (x,y,z) in coords1]))
    coords = coords1 + coords2 + coords3 + coords4

    # double points
    if double_points:
        coords = double_coords(coords)

    # write file
    for i in range(len(coords)):
        mw.writerow([i, coords[i][0], coords[i][1], coords[i][2]])
    f.close()

    # draw?
    if draw:
        plt.plot([x for (x,y,z) in coords], [y for (x,y,z) in coords])
        plt.axis([-2,2,-2,2])
        plt.show()


def make_heart(double_points = True, draw=True, step_size = 0.02, z_const = 0.0):
    # heart shape
    f = open('../docs/heart.txt', 'w')
    mw = csv.writer(f, delimiter=" ")

    # compute each quarter
    # first
    coords1 = []
    for x in np.arange(start=0.0, stop=1.0+step_size, step=step_size):
        y = np.abs(x)+np.sqrt(1 - (x**2))
        coords1.append((x,y,z_const))
    coords4 = list(reversed([(-x,y,z) for (x,y,z) in coords1])) # fourth
    # third
    coords3 = []
    for x in np.arange(start=0.0, stop=1.0 + step_size, step=step_size):
        y = np.abs(x) - np.sqrt(1 - (x ** 2))
        coords3.append((-x,y,z_const))
    coords2 = list(reversed([(-x,y,z) for (x,y,z) in coords3]))
    coords = coords1 + coords2 + coords3 + coords4

    # double points
    if double_points:
        coords = double_coords(coords)

    # write file
    for i in range(len(coords)):
        mw.writerow([i, coords[i][0], coords[i][1], coords[i][2]])
    f.close()

    # draw?
    if draw:
        plt.plot([x for (x,y,z) in coords], [y for (x,y,z) in coords])
        plt.axis([-2,2,-2,2])
        plt.show()


def make_quare(double_points = True, draw=True, step_size = 0.1, z_const = 0.0):
    # square shape
    f = open('../docs/heart.txt', 'w')
    mw = csv.writer(f, delimiter=" ")

    coords1 = [(x, 1.0, z_const) for x in np.arange(start=0.0, stop=1.0, step=step_size)]
    coords2 = [(1.0, y, z_const) for y in np.arange(start=1.0, stop=-1.0 - step_size, step=-step_size)]
    coords3 = list(reversed([(x,-y,z) for (x,y,z) in coords1]))
    coords4 = list(reversed([(-x,-y,z) for (x,y,z) in coords1]))
    coords5 = list(reversed([(-x,y,z) for (x,y,z) in coords2]))
    coords6 = list(reversed([(-x,y,z) for (x,y,z) in coords1]))
    coords = coords1 + coords2 + coords3 + coords4 + coords5 + coords6

    # double points
    if double_points:
        coords = double_coords(coords)

    # write file
    for i in range(len(coords)):
        mw.writerow([i, coords[i][0], coords[i][1], coords[i][2]])
    f.close()

    # draw?
    if draw:
        plt.plot([x for (x, y, z) in coords], [y for (x, y, z) in coords])
        plt.axis([-2, 2, -2, 2])
        plt.show()


if __name__ == "__main__":
    #make_circle()
    #make_heart()
    make_quare()