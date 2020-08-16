class Circle{
  int x, y;
  float interval, size1, size2, size3, size4, size5, size6, size7,
  thickness, limit_size, counter;
  color col;
  boolean circle1_check,circle2_check,circle3_check, circle4_check, circle5_check,circle6_check, circle7_check,
  switch1, switch2, switch3, switch4, switch5, switch6, switch7;
  
  circle_gen [] test = new circle_gen[7];
  
  Circle(){
    size1 = 1;
    size2 = 1;
    size3 = 1;
    size4 = 1;
    size5 = 1;
    size6 = 1;
    size7 = 1;
    limit_size = 360;
    counter = 0;
    circle1_check = false; 
    circle2_check = false;
    circle3_check = false;
    circle4_check = false; 
    circle5_check = false;
    circle6_check = false;
    circle7_check = false;
    //switch1 = false;
    //switch2 = false;
    //switch3 = true;
    //switch4 = true;
    //switch5 = false;
    //switch6 = true;
    //switch7 = true;
    
    interval = limit_size/6;
  }
  
  
  void display(int x, int y){
    
    if (counter >= 0) {    //circle 1

      col = color(224, 195, 154);

      
      test[0] = new circle_gen(x,y,size1,color(col));
      test[0].create(limit_size/2,limit_size/12);
      //test[0] = new circle_gen(x+300,y,size1,color(col));
      //test[0].create();
      circle1_check = true;
    }
    
    if (counter >= interval) {

      col = color(216, 179, 97);

      test[1] = new circle_gen(x,y,size2,color(col));
      test[1].create(limit_size/2,limit_size/12);
      //test[1] = new circle_gen(x-300,y,size2,color(col));
      //test[1].create();
      circle2_check = true;
      //println("create 2");
    }
    
    if (counter >= 2*interval) {

      col = color(211, 132, 86);

      test[2] = new circle_gen(x,y,size3,color(col));
      test[2].create(limit_size/2,limit_size/12);
      //test[2] = new circle_gen(x,y+300,size3,color(col));
      //test[2].create();
      circle3_check = true;
      //println("create 3");
    }
    
    if (counter >= 3*interval) {

      col = color(218, 112, 88);
      
      test[3] = new circle_gen(x,y,size4,color(col));
      test[3].create(limit_size/2,limit_size/12);
      //test[3] = new circle_gen(x,y-300,size4,color(col));
      //test[3].create();
      circle4_check = true;
      //println("create 4");
    }
    if (counter >= 4*interval) {
      
      col = color(213, 132, 181);

      //test[4] = new circle_gen(x,y,size5,color(col));
      //test[4].create();
      test[4] = new circle_gen(x,y,size5,color(col));
      test[4].create(limit_size/2,limit_size/12);
      circle5_check = true;
      //println("create 5");
    }
    if (counter >= 5*interval) {

      col = color(183, 149, 172);

      //test[5] = new circle_gen(x,y,size6,color(col));
      //test[5].create();
      test[5] = new circle_gen(x,y,size6,color(col));
      test[5].create(limit_size/2,limit_size/12);
      circle6_check = true;
      //println("create 6");
    }    
    
    if (counter >= 6*interval) {

      col = color(169, 181, 208);

      //test[6] = new circle_gen(x,y,size7,color(col));
      //test[6].create();
      test[6] = new circle_gen(x,y,size7,color(col));
      test[6].create(limit_size/2,limit_size/12);
      circle7_check = true;
      //println("create 7");
    }       
          
    counter +=0.5;
    //println(size1);
    //println ("size1 = " + size1 + " , " + "size2 = " + size2 + " , " +"size3 = " + size3 + " , "+ "size4 = " + size4);
  }
      
  
  void radiate(){
    if (size1-limit_size/6 < limit_size & circle1_check == true){
      size1 += 0.5;
      //test[0] = new circle_gen(x-200,y,size1,120);
    } else {
      size1= 0;
      if (switch1 == false){
        switch1 = true;
      } else if(switch1 == true){
        switch1 = false;
      }
    }
    if (size2-limit_size/6 < limit_size & circle2_check == true){
      size2 += 0.5;
    } else {
      size2= 0;
      if (switch2 == false){
        switch2 = true;
      } else if(switch2 == true){
        switch2 = false;
      }
    }
    if (size3-limit_size/6 < limit_size & circle3_check == true){
      size3 += 0.5;
    } else {
      size3= 0;
      if (switch3 == false){
        switch3 = true;
      } else if(switch3 == true){
        switch3 = false;
      }
    }
    
    if (size4-limit_size/6 < limit_size & circle4_check == true){
      size4 += 0.5;
    } else {
      size4= 0;
      if (switch4 == false){
        switch4 = true;
      } else if(switch4 == true){
        switch4 = false;
      }
    }
    
    if (size5-limit_size/6 < limit_size & circle5_check == true){
      size5 += 0.5;
    } else {
      size5= 0;
      if (switch5 == false){
        switch5 = true;
      } else if(switch5 == true){
        switch5 = false;
      }
    }
    
    if (size6-limit_size/6 < limit_size & circle6_check == true){
      size6 += 0.5;
    } else {
      size6= 0;
      if (switch6 == false){
        switch6 = true;
      } else if(switch6 == true){
        switch6 = false;
      }
    }
    
    if (size7-limit_size/6 < limit_size & circle7_check == true){
      size7 += 0.5;
    } else {
      size7= 0;
      if (switch7 == false){
        switch7 = true;
      } else if(switch7 == true){
        switch7 = false;
      }
    }    
    //for (int i =0;i<1;i++){
      
    //  test[i].create();
    //}    
  }

  
  void reset() {
    //size=0;
  }
}
