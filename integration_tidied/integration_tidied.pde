import KinectPV2.*;
KinectPV2 kinect;
Circle circle = new Circle();
data_process data_process;
Scatter test = new Scatter(100,20,5,50,0,200,150,18);

void setup() {   
  size(2100, 1200);
  kinect = new KinectPV2(this);   
  kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true); 
  kinect.init();

}  

    
void draw() {  
  background(0); 
  push();
  stroke(255);
  fill(255);
  rect(600,0,700,400);
  pop();

  push();
  noStroke();
  fill(255);
  rect(50,500,1800,200);
  pop();
  noStroke();
  
  PImage img2 = kinect.getBodyTrackImage();
  image(img2, 0, 0);
  ArrayList<PImage> bodyTrackList = kinect.getBodyTrackUser();
  int num_of_users = kinect.getNumOfUsers();

  int[] depth = kinect.getRawDepthData();
  
  
  data_process = new data_process(num_of_users, bodyTrackList, depth);
  data_process.measure();
  //data_process.display();
  }
