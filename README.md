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
    * 

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
    control the number of points that you want in your AR world. There is a limit for doing so which is 15,000,000 (I have set it to highest).
* Let's talk about the APIs:
    * Metal is an alternative for OpenGL. This is specifically designed for Apple hardware so that all the computational power is used.
    * ARKit is a framework which enables creation of Augmented Reality.
    * SceneKit is a 3D graphics framework developed by Apple for creating and manipulating 3D content in real-time.
    * Core Motion is a framework developed by Apple for iOS devices that allows access to the motion sensors on the device, including the accelerometer, gyroscope, and magnetometer. 
* Important Concepts for Accelerometer App:
    * CoreMotion is pretty straight forward API.
    * Always make sure that you start the updates for the sensor that you are using. 
    * The user distance travelled is not a direct output of the sensor. For getting the distance we have to process the data.
