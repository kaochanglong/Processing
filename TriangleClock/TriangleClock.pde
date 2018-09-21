//Triangle Clock Designed by Chang-Long Kao
//Processing 3.4 (Javamode)

//constant
float t =TWO_PI;
int rc =110; //radius for inner clock circle
int rco = 140; //radius for outer clock circle
int rn = 130; //radius for number circle
int r = 50; //radius for second minute and hour


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
  
  //Triangle with location of second, minute and hour
  //Lines with location of second, minute and hour also work 
  // stroke(215, 15, 10);
  // line(hx,hy,mx, my);
  // stroke(15, 255, 10);
  // line(hx,hy,sx, sy);
  // stroke(15, 15, 255);
  // line(mx,my,sx,sy);
  popMatrix();
  stroke(255,255,255);
  strokeWeight(2);
  triangle(hx,hy,mx, my,sx,sy);
  
  //mark second with point or ellipse
  stroke(0,255,0);
  strokeWeight(4);
  point(sx,sy);
  // ellipse(sx,sy, 5, 5);
  
  //mark minute with point or ellipse
  stroke(0,0,255);
  strokeWeight(5);
  point(mx,my);
  //ellipse(mx,my, 5, 5);
  
  //mark hour with point or ellipse
  stroke(255,0,0);
  strokeWeight(5);
  point(hx,hy);
  //ellipse(hx,hy, 5, 5);
 
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

}//End of void draw()
