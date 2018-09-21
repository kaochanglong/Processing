//Simple Arc and Basic Clock Designed by Chang-Long Kao
//Processing 3.4 (Java mode)

//constant
float tau = TWO_PI;
int rc = 110; //clock face
int rs = 100; //radius of Arc(second)
int rm = 90; //radius of Arc(minute)
int rh = 80; //radius of Arc(hour)
int ls = 30; //line of second 
int lm = 25; //line of minute
int lh = 20; // line of hour


void setup()
{
 size(200,200);
 smooth();
 noFill();
 strokeWeight(4);
}

void draw()
{
  background(26);
  //Set the clock at the center and start with 12 clock
  translate(width/2, height/2);
  rotate(-tau/4);
  
  //Clock circle 
  stroke(255, 255, 10);
  ellipse(0,0,rc,rc);
   
  ////clock dot if you want
  //for(float i = 0; i <360; i+= 45)
  //{
  //  float x = 33 * cos(radians(i));
  //  float y = 33 * sin(radians(i));
  //  stroke( 20, 255, 50);
  //  strokeWeight(2); 
  //  point(x,y);
  //}
  
  //Arc clock
  //second map with arc
  stroke(105, 255, 10);
  float s = map(second(), 0, 60 ,0, tau);
  arc (0,0,rs,rs,0,s);

  //minute map with arc
  stroke(10, 100, 255);
  float m = map(minute(), 0, 60 ,0, tau);
  arc (0,0,rm,rm,0,m);

 //hour map with arc
  stroke(250, 10, 10);
  float h = map(hour()%12, 0, 12 ,0, tau);
  arc (0,0,rh,rh,0,h); 

  //Basic clock
   
  //second line
  pushMatrix();
  rotate(s);
  stroke(105, 255, 10);
  line(0, 0, ls, 0);
  popMatrix();
  
  //minute line
  pushMatrix();
  rotate(m);
  stroke(10, 100, 255);
  line(0, 0, lm, 0);
  popMatrix();
  
  //hour line
  pushMatrix();
  rotate(h);
  stroke(250, 10, 10);
  line(0, 0, lh, 0);
  popMatrix();
  
  //center point
  stroke(255,255,255,200);
  point(0, 0);

}
