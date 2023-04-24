Hello!
Let me take you through my experience during this Independent Study.

# Initial:
* In my independent study I worked with Shivendra Agarwal who's research focuses on assistive technology. He is working on
smart cane which uses T265+D455 camera setup for creating a vision for blind people.
* I helped him create different ios apps which will help him make a complete application for use.
* This was my first experience with ios development which was good and kind of challenging for me.

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
    * Renderer: Renderer file as it's name suggests creates a AR world (Point Cloud) with populated point 