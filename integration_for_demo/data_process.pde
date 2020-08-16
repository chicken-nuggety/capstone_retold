class data_process{
  ArrayList<PImage> bodyTrackList;
  float max_topdist, max_btmdist;
  int check, ytop, ybtm, xtop, num, skip, time;
  int[] depth;
  float [] pos_X_Y = new float[2];
  FloatList topdist_list = new FloatList();
  FloatList btmdist_list = new FloatList();
  IntList ytop_list = new IntList();
  IntList ybtm_list = new IntList();
  IntList xtop_list = new IntList();
  StringDict d = new StringDict();
  boolean stage1, stage2;
  float bod_angle = 0;
  float hori_angle = 0;  
  float vert_angle = 0;
  float ob_h = 0;
  float hori_d = 0;
  
  data_process(int num_of_users, ArrayList<PImage> temp_bodytracklist, int[] rawdepthdata, int temp_time){
    max_topdist = 0;
    max_btmdist = 0;
    check = 10;
    ytop = 0;
    ybtm = 0;
    xtop = 0;
    bodyTrackList = temp_bodytracklist;
    num = num_of_users;
    depth = rawdepthdata;
    skip = 3;
    time = temp_time;
    stage1 = true;
    stage2 = false;
  }
  
  void measure(){
    test.display();
    for(int i = 0; i < bodyTrackList.size(); i++){
      PImage bodyTrackImg = (PImage)bodyTrackList.get(i);
      int countert = 0;
      int counterb = 0;
      int countert2 = 0;
      int counterb2 = 0;
      boolean top_check = false;
      boolean btm_check = false;
      for (int y= 0; y < bodyTrackImg.height; y+=skip) {
        for (int x = 0; x < bodyTrackImg.width; x+=skip) {
          int index =  x + y *bodyTrackImg.width;
          float b = brightness(bodyTrackImg.pixels[index]);
          
          if (b > 10 & top_check == false) {
            countert += 1;
            if (countert >= check){
              float topdist = average_dist(index,depth,check);
              
              topdist_list.append(topdist);
              ytop_list.append(y);
              xtop_list.append(x);
              countert2 += 1;
              if (countert2 >= check){
                top_check = true;
              }
            }
            //fill(255);
            //rect(bodyTrackImg.width*(i+1) + x, bodyTrackImg.height + y, 80, skip);
          } 
          else {
            //fill(0);
            //rect(bodyTrackImg.width*(i+1) + x,bodyTrackImg.height + y,skip,skip);
          }
        }
      }
      
      for (int y= bodyTrackImg.height-1; y > 0; y-=skip) {
        for (int x = 0; x < bodyTrackImg.width; x+=skip) {
          int index =  x + y *bodyTrackImg.width;
          float b = brightness(bodyTrackImg.pixels[index]);
          if (b > 10 & btm_check == false) {
            counterb += 1;
            
            if (counterb >= check){
              float btmdist = average_dist(index,depth,check);
              btmdist_list.append(btmdist);
              ybtm_list.append(y);
              counterb2 += 1;
              
              if (counterb2 >= check){
                  btm_check = true;
              }
            }
            //fill(255);
            //rect(bodyTrackImg.width*(i+1) + x,bodyTrackImg.height + y,40,skip);
          }
        }
      }
    try{
      ytop = ytop_list.min();
      ybtm = ybtm_list.max();
      xtop = xtop_list.max();
      max_topdist = topdist_list.max();
      max_btmdist = btmdist_list.max();
    } catch (RuntimeException ex){
      ;
    }
//    bod_angle = angle_finder(ytop,ybtm);
//    hori_angle = angle_finder(int(256),xtop );  
//    vert_angle = angle_finder(ytop, int(212));
//;
//    ob_h = obj_height(max_topdist,max_btmdist,bod_angle);
//    hori_d = abs_hori_dist(max_topdist, 0, vert_angle);
//    arrayCopy(abs_pos(obj_pos_corner(hori_d, hori_angle,radians(90)),1),pos_X_Y);
    
    if ( time % 0.5 == 0){
      bod_angle = angle_finder(ytop,ybtm);
      hori_angle = angle_finder(int(256),xtop );  
      vert_angle = angle_finder(ytop, int(212));
      ob_h = obj_height(max_topdist,max_btmdist,bod_angle);
      hori_d = abs_hori_dist(max_topdist, 0, vert_angle);
      
    }
    arrayCopy(abs_pos(obj_pos_corner(hori_d, hori_angle,radians(90)),1),pos_X_Y);
    int wide_screen_x = wide_screen_x_pos(pos_X_Y);

    d.set("Person "+ str(i+1), " object height = " + ob_h + " , X = " + round(pos_X_Y[0]) + ", Y = " + round(pos_X_Y[1]) + " , widescreen_pos = " + wide_screen_x);
    //println(d);
    fill(120);
    
    //ellipse(600 + pos_X_Y[0]/10,0 + pos_X_Y[1]/10,50,50);
    if (num >= 1) {
      topdist_list.clear();
      btmdist_list.clear();
      ytop_list.clear();
      ybtm_list.clear();
      xtop_list.clear();
      
      //circle.display((wide_screen_x-230)*8,height/2);
      //circle.radiate();
      if (num == 1){
        test.track((wide_screen_x-230)*8);
      } else{
        circle.display((wide_screen_x-230)*8,height/2);
        circle.radiate();
      }
      
      //if (time % 5 == 0 & stage1 == true & stage2 == true){
      //  stage1 = false;
      //  stage2 = true;
      //} else if (time % 5 == 0 & stage1 == false & stage2 == true){
      //  stage1 = true;
      //  stage2 = false;
      //}
      
      //if (stage1 == true){
      //  test.track((wide_screen_x-230)*8);
      //}
      //if (stage2 == true){
      //  circle.display((wide_screen_x-230)*8,height/2);
      //  circle.radiate();
      //}
    }
    
    }
    
  }
  
  void display(){
    for(int i = 0; i < bodyTrackList.size(); i++){
      PImage bodyTrackImg = (PImage)bodyTrackList.get(i);
      image(bodyTrackImg, 512 + 512*i,0);
    }
  }
}
