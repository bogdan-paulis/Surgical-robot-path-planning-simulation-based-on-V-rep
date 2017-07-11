import numpy as np
import matplotlib.pyplot as plt

def multiply_points(filename):
    f = open('docs/'+filename, 'r')
    points = f.read().split('\n')
    f.close()
    f = open('docs/'+filename, 'w')
    time = 0
    end = []
    coor = []
    for index in np.arange(1,len(points)):
        begin = np.array(points[index-1].split(' ')[1:]).astype(np.float)
        coor.append(begin)
        end = np.array(points[index].split(' ')[1:]).astype(np.float)
        middle = begin + ((end-begin)/2)
        f.write(str(time) + ' ' + str(begin[0]) + ' ' + str(begin[1]) + ' ' + str(begin[2]) + '\n')
        time += 1
        f.write(str(time) + ' ' + str(middle[0]) + ' ' + str(middle[1]) + ' ' + str(middle[2]) + '\n')
        time +=1
    coor.append(end)
    f.write(str(time) + ' ' + str(end[0]) + ' ' + str(end[1]) + ' ' + str(end[2]))
    f.close()
    coor = np.array(coor)
    plt.plot(coor[:,0], coor[:,1])
    plt.show()


multiply_points('heart.txt')