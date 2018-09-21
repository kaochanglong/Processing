//Basic Clock Designed by Chang-Long Kao
//Processing 3.4 (Javamode)

//constant
float t =TWO_PI;
int rc =110; //radius for inner clock circle
int rco = 140; //radius for outer clock circle
int rn = 130; //radius for number circle
int r = 50; 
//radius and line for second minute and hour
int rs = 100;
int ls = 40;
int rm = 90;
int lm = 30;
int rh = 10;
int lh = 20;

void setup()
{
 size(200, 200);
 smooth();
 //strokeWeight(2);
 noFill();
}

void draw()
{
  //move colock face and elements to the center with tanslation and start at 12 with rotation
  background(26);
  translate(width/2,height/2);
  rotate(-t/4);
  pushMatrix();
  stroke(255, 255, 10);
  strokeWeight(4);
  ellipse(0,0,rc,rc); //inner clock circle
  ellipse(0,0,rco,rco); //outer clock circle
  
  stroke(0,0,0,50);
  strokeWeight(10);
  ellipse(0,0,rn,rn); ////balck circle for numers
  
  popMatrix();

  //location of second 
  float s = map(second(), 0 ,60, 0, t); 
  float sx =r *cos(s);
  float sy =r *sin(s);
  
  //location of second 
  float m = map(minute(), 0, 60, 0, t);
  float mx =r *cos(m);
  float my =r *sin(m);
  
   //location of second 
  float h = map(hour()%12, 0, 12 ,0, t);
  float hx =r *cos(h);
  float hy =r *sin(h);
  
  //line for second
  pushMatrix();
  rotate(s);
  stroke(105, 255, 10);
  strokeWeight(1);
  line(0, 0, ls, 0);
  popMatrix();
  
  //line for minute
  pushMatrix();
  rotate(m);
  stroke(10, 100, 255);
  strokeWeight(2);
  line(0, 0, lm, 0);
  popMatrix();
  
  //line for hour
  pushMatrix();
  rotate(h);
  stroke(250, 10, 10);
  strokeWeight(4);
  line(0, 0, lh, 0);
  popMatrix();
  
 
  pushMatrix();
  //set up number
  rotate(t/4);
  textSize(8);
  textAlign(CENTER);
  stroke(0);
  strokeWeight(4);
  for(int i = 1; i <= 12; i++)
  {
    rotate(PI/6);
    text(i, 0, -60);
    
  //set up incator bar if you want  
  //pushMatrix();
  //stroke(0,255,0);
  //strokeWeight(0.2);
  //for(int j = 0; j < 5; j++)
  //{   
  // if(j == 0)
  // {
  //  line(0, 60, 0, 65);
  // }
  // else
  // {
  //  line(0, 60, 0, 65);
  // }
  //  rotate(PI/30);
  // } 
  // popMatrix();  
  
   }//End of number
   popMatrix(); //End of number
   
   //center point
   stroke(255);
   point(0,0);
}//End of void draw()
