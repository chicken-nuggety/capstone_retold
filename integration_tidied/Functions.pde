float average_dist(int index, int[] map, int check) {   //  This function averages the measured
  float d = 0;                                          //  distance from the chosen set of pixels
  for (int i = 0; i <check ; i++){
    d += map[index-i];
  }
  float avg_d = d/check;
  return avg_d;
}

float angle_finder(int param1, int param2) {                //  This functions finds the angle of view
  int diff = param1-param2;                                //  from 2 separate pixel positions from the image
  float angle = radians(ceil(diff/7));
  return angle;
}

float obj_height(float topd, float btmd, float angle){  //  This function returns the estimated height 
 float obj_height = sqrt(sq(topd) + sq(btmd) - (2*topd*btmd*cos(angle))); //  of the object
 return obj_height;
}

float [] obj_pos_corner(float hori_dist, float angle, float preset_ang_R) {
  float abs_x = 0;
  float abs_y = 0;
  float [] array = new float [2];  
  println(angle);// negative: left, positive: right from kinect perspective
  if (angle >= 0 ) { // right
  abs_x = hori_dist * sin(preset_ang_R - angle);
  abs_y = hori_dist * cos(preset_ang_R - angle);

  } else if(angle < 0){ // left
    abs_x = hori_dist * sin(preset_ang_R - angle);  //  in radians
    abs_y = hori_dist * cos(preset_ang_R - angle);    
  }
  array[0] = abs_x;
  array[1] = abs_y;
  return array;
}

float [] abs_pos(float [] array, int cam_pos) {
  float [] new_array = new float [2];
  if (cam_pos == 1) {                         //  top left
    new_array[0] = array[0];
    new_array[1] = array[1];
    
  } else if ( cam_pos == 2){                  //  top right
    new_array[1] = array[0];
    new_array[0] =7000- array[1];

  } else if ( cam_pos == 3 ) {                //  bottom left
    new_array[0] = array[1];
    new_array[1] = 4000-array[0];
    
  } else if (cam_pos == 4) {                  //  bottom right
    new_array[0] = 7000 - array[0];
    new_array[1] = 4000 - array[1];    
  }
  return new_array;
}


float abs_hori_dist(float dist, float preset_ang_V, float angle) { // Angle must be positive below relative horitzontal
  float hori_dist = dist * cos(radians(preset_ang_V) + angle);
  return hori_dist;
}


int wide_screen_x_pos(float [] array){
  int pixel_x_pos = 0;
  float x = 7000 - array[0];
  float y_top = array[1];
  float y_btm = 4000 - array[1];
  if (x < y_top & x < y_btm){
    pixel_x_pos = 700 + round(y_top/10);
    //println("screen 2 = "+ pixel_x_pos);
  } else if (y_top < x & y_top < y_btm) {
    pixel_x_pos = round(array[0]/10);
    if (pixel_x_pos>= 1800){
      pixel_x_pos =1800;
    } else if (pixel_x_pos<= 0){
      pixel_x_pos =0;
    }
    //println("screen 1 = " + pixel_x_pos);
  } else if (y_btm < x & y_btm < y_top) {
    pixel_x_pos = 700 + 400 + round(x/10);
    if (pixel_x_pos>= 1800){
      pixel_x_pos =1800;
    } else if (pixel_x_pos<= 0){
      pixel_x_pos =0;
    }
    //println("screen 3 = " + pixel_x_pos);
  }
  return pixel_x_pos;
}
