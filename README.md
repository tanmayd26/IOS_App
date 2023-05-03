Hello!
Let me take you through my experience during this Independent Study.

# Initial:
* In my independent study I worked with Shivendra Agarwal who's research focuses on assistive technology. He is working on
smart cane which uses T265+D455 camera setup for creating a vision for blind people.
* I helped him create different ios apps which will help him make a complete application for use.
* This was my first experience with ios development which was good and kind of challenging for me.

# Literature:
* APIs:
    * https://developer.apple.com/documentation/metal/
    * https://developer.apple.com/documentation/scenekit/
    * https://developer.apple.com/documentation/coremotion/
    * https://developer.apple.com/documentation/arkit/
* Papers: 
    * https://arxiv.org/pdf/2212.04745.pdf: This is a survey paper for SLAM.
    * https://doi.org/10.1016/j.ifacol.2021.10.472 "Mobile robot localization and navigation using LIDAR and indoor GPS"
    This paper talks about using LiDAR to scan environment and create a local map for robot. Indoor GPS helps for motion planning. 
    * https://doi.org/10.1109/2.30720 "Using occupancy grids for mobile robot perception and navigation"
    This paper presents efficient path planning using the occupancy grid using sensors like LiDAR, camera and A* a motion planning algorithm.



# Work and Experience:
* I started with learning about LiDAR as it was my first time working so extensively with it. I read papers which talked about 
how LiDARs work. 
* Next I started working on the LiDARs in iPhones. This part was challenging as I had to start from the basics of ios development.
* I had to work from creating a storyboard which is an UI for ios app. Next I worked over smaller part of my IS, which was getting 
6D pose of the iphone.
* This requires accessing accelerometer and gyroscope data of iphone. The data that we get is raw data which needs to be processed.
If you look into Acceleration folder which is an app for getting 6D pose.
* I used the APIs like Metal, ARKit, Scenekit, and CoreMotion.
* In accelerometer app I used simple math for getting distance travelled by device from accelerometer.
* The main challenge was creating an app which will be using LiDAR and generating point clouds.
* These are some important files in the Point Cloud App:
    * Maincontroller: This file creates the User Interface and calls a session which creates ARSession from the scene.
    * Renderer: Renderer file as it's name suggests creates a AR world (Point Cloud) with populated points. In this file you can
    control the number of points that you want in your AR world. There is a limit for doing so which is **15,000,000** (I have set it to highest).
* Let's talk about the APIs:
    * Metal is an alternative for OpenGL. This is specifically designed for Apple hardware so that all the computational power is used.
    * ARKit is a framework which enables creation of Augmented Reality.
    * SceneKit is a 3D graphics framework developed by Apple for creating and manipulating 3D content in real-time.
    * Core Motion is a framework developed by Apple for iOS devices that allows access to the motion sensors on the device, including the accelerometer, gyroscope, and magnetometer. 
* Important Concepts for Accelerometer App:
    * CoreMotion is pretty straight forward API.
    * Always make sure that you start the updates for the sensor that you are using. 
    * The user distance travelled is not a direct output of the sensor. For getting the distance we have to process the data.
* SLAM (Simultaneous Localization and Mapping):
    * SLAM is used to create a map of an unknown environment and keep track of a robot's location within that environment at the same time.
    * It is a complex task that involves combining data from various sensors such as cameras, LIDAR, and GPS.
    * The process of SLAM typically involves several steps, including feature extraction, data association, state estimation, and map update
    * Feature extraction involves identifying and tracking features in the environment, such as edges and corners.
    * Data association involves matching the features observed in the current frame to those in the previous frames.
    * State estimation involves using the data from sensors to estimate the robot's current position and orientation.
    * Map update involves incorporating new observations into the existing map to improve its accuracy.
    * There are two main types of SLAM: EKF-SLAM (Extended Kalman Filter SLAM) and Graph-Based SLAM.
    * EKF-SLAM is a recursive algorithm that estimates the robot's position and orientation while building a map of the environment
    * Graph-Based SLAM uses a graph to represent the environment and the robot's movements, and estimates the robot's trajectory and the locations of landmarks simultaneously.

* Simple PC and 6D Pose:
    * As in accelerometer app we are using data from the sensors like accelerometer, gyroscope to get 6D pose.
    * This app uses ARKit which gives 6D pose of the iPhone.
    * Also this app gives points in point cloud using mesh classification which is an shape estimation of surrounding by swift.

# Blockers:
* I faced lot of blockers during this Independent Study.
* First being new to ios development, finding reliable documentation and understanding APIs was challenging.
* This was my first time working with SLAM, but fortunately I had Shivendra who helped me to understand it in simple way.
* The changing platform of xcode: There were lot of mismatches between the version of IDE and coding language which happened when Apple used to introduce newer versions. This took weeks in straight to get resolved.

# Tips for future students:
* I would recommend students to join CAIRO as the lab culture is very welcoming and Dr. Hayes is very helpful.
* Just be ready to explore and learn different things.
* If you face challenges commuincate those to your supervisor.



