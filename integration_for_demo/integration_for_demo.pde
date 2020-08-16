import KinectPV2.*;
KinectPV2 kinect;
Circle circle = new Circle();
data_process data_process;
Scatter test = new Scatter(24,12,2,0,0,400,400,1);


String file_patch = "";



void setup() {   
  size(400, 400);
  kinect = new KinectPV2(this);   
  kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true); 
  kinect.init();

}  

    
void draw() {  
  background(0); 
  noStroke();
  int time = second();
  //PImage img2 = kinect.getBodyTrackImage();
  //image(img2, 0, 0);
  ArrayList<PImage> bodyTrackList = kinect.getBodyTrackUser();
  int num_of_users = kinect.getNumOfUsers();

  int[] depth = kinect.getRawDepthData();
  
  data_process = new data_process(num_of_users, bodyTrackList, depth, time);
  data_process.measure();
  //data_process.display();
  save(file_patch + "animation.png");
  }
