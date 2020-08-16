class Books{
  int x, y, width_b, height_b;
  color col;
  Books(int tempX, int tempY, int temp_W, int temp_H){
    x = tempX;
    y = tempY;
    width_b = temp_W;
    height_b = temp_H;
    col = color(0);
    
  }
  void create(){
    stroke(255);
    fill(col);
    rect(x,y,width_b,height_b);
  }
  
  void colour_selection(int pos_x, float num, float total_num, int color_num, int column){
    if ((pos_x - (x + width_b) <= width_b * round(column/2)) & ((x - pos_x  <= width_b * round(column/2)))) {
      //println(pos_x + " " + pos_y);
      
      if (num/total_num <= 0.4) {
        if (color_num == 1) {
          col = color(224, 195, 154);
        } else if (color_num == 2) {
          col = color(216, 179, 97);
        } else if (color_num == 3) {
          col = color(211, 132, 86);
        } else if (color_num == 4) {
          col = color(218, 112, 88);
        } else if (color_num == 5) {
          col = color(213, 132, 181);
        } else if (color_num == 6) {
          col = color(183, 149, 172);
        } else if (color_num == 7) {
          col = color(169, 181, 208);
        } 
      }
    }
  }
  
}
    
