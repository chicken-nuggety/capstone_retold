class circle_gen{
  int x, y;
  float r;
  color colour;

  circle_gen(int tempX, int tempY, float tempR1, color tempCol ){
    x = tempX;
    y = tempY;
    r = tempR1/2;
    colour = tempCol;
  }

  
  void create(float d1,float d2) {
    fill(colour);
    float r2 = max(0,r-d2);
    float r1 = min(d1,r);
    ring(r1,r2);
    
  }
  
  void ring(float r1, float r2)
  {
    beginShape();
     buildCircle(x,y,r1,true);
     buildCircle(x,y,r2,false);
    endShape();
  }
  
  // Creates a circle using spline curves. Can be drawn either clockwise
  // which creates a solid circle, or anticlockwise that creates a hole.
  void buildCircle(float cx, float cy, float r, boolean isClockwise)
  {
    int numSteps = 10;
    float inc = TWO_PI/numSteps;
       
    if (isClockwise)
    {
      // First control point should be penultimate point on circle.
      curveVertex(cx+r*cos(-inc),cy+r*sin(-inc));
      
      for (float theta=0; theta<TWO_PI-0.01; theta+=inc)
      {
        curveVertex(cx+r*cos(theta),cy+r*sin(theta));
      }
      curveVertex(cx+r,cy);
      
      // Last control point should be second point on circle.
      curveVertex(cx+r*cos(inc),cy+r*sin(inc));
      
      // Move to start position to keep curves in circle.
      vertex(cx+r,cy);
    }
    else
    {
      // Move to start position to keep curves in circle.
      vertex(cx+r,cy);
      
      // First control point should be penultimate point on circle.
      curveVertex(cx+r*cos(inc),cy+r*sin(inc));
          
      for (float theta=TWO_PI; theta>0.01; theta-=inc)
      {
        curveVertex(cx+r*cos(theta),cy+r*sin(theta));
      }
      curveVertex(cx+r,cy);
       
      // Last control point should be second point on circle.
      curveVertex(cx+r*cos(TWO_PI-inc),cy+r*sin(TWO_PI -inc));
    }  
  }
}
