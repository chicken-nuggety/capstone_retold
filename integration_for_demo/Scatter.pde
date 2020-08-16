class Scatter{
  int column, layer, yOffset, xOffset, screen_width, screen_height, num_bs;
  float total_num;
  Books [][][] Books;
  
  Scatter(int temp_total_num, int temp_col, int temp_layers, int temp_xOffset, int temp_yOffset, int temp_screen_width, int temp_screen_height, int temp_num_bs){
    num_bs = temp_num_bs;
    column = temp_col;
    xOffset = temp_xOffset;
    yOffset = temp_yOffset;
    screen_width = temp_screen_width;
    screen_height = temp_screen_height;
    total_num = temp_total_num;
    layer = temp_layers;
    Books = new Books[num_bs][column][layer];
  }
  
  void display() {
    for (int n = 0; n < num_bs; n++){
      for (int i = 0; i<layer; i++){
        for (int j = 0; j < column; j++){
          Books[n][j][i] = new Books(j*(screen_width/column)+(n*screen_width) + xOffset,i*(screen_height/(layer)) + yOffset,screen_width/column,screen_height/(layer));
          Books[n][j][i].create();
        }
      }
    }
  }
  
  void track(int x){
    randomSeed(0);
    for (int n = 0; n < num_bs; n++){
      for (int i = 0; i<layer; i++){
        for (int j = 0; j < column; j++){
          
          float num = random(total_num);
          
          int color_num = int(random(7));
          Books[n][j][i].colour_selection(x, num, total_num, color_num, column);
          Books[n][j][i].create();
          
        }
      }
    }
  }
}
