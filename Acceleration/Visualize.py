# import numpy as np
# from mpl_toolkits.mplot3d import Axes3D
# import matplotlib.pyplot as plt

# # load the xyz file
# points = np.loadtxt('point_cloud.xyz', skiprows=1)

# # separate x, y, and z values
# x = points[:, 0]
# y = points[:, 1]
# z = points[:, 2]

# # create a 3D plot
# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')
# ax.scatter(x, y, z)

# # set axis labels and title
# ax.set_xlabel('X')
# ax.set_ylabel('Y')
# ax.set_zlabel('Z')
# ax.set_title('Point Cloud Visualization')

# # show the plot
# plt.show()

import numpy as np

pc_txt = np.loadtxt('Values.txt', delimiter=',')

print('Shape of the point cloud:', pc_txt.shape)
points = pc_txt[:,:3]
colors = pc_txt[:,3:]
vis = pptk.viewer(points, colors) # Start the interactive visualization