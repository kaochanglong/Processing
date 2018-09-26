//Point Clock with 24-hour Digital Clock Designed by Chang-Long Kao
//Processing 3.4 (Java mode)

//constant
float tau = TWO_PI;
float rc = 230; //clock circle
float rco = 200;//clock circle
float rci = 160;//clock circle

float rs = 70; //radius for second
float rm = 55; //radius for minute
float rh = 40; //radius for hour

//start with void setup()
void setup()
{
  size(300,300);
  noFill();
  background(0, 0, 0, 200);
}//End of void setup()

//start with void draw()
void draw()
{
  //translate to the center
  // rotate -tau/4 to start at 12
  
  background(26);
  translate(width/2, height/2);

  
  text(nf(hour()) + ":" + nf(minute()) + ":" + nf(second()), 0,0); 

  rotate(-tau/4);
  
  ////map concept
  //float s = map(second(), 0, 60 , 0 ,tau); 
  //float m = map(minute(), 0, 60 , 0 ,tau); 
  //float h = map(hour()%12, 0, 12 , 0 ,tau);  
  
  //float sx = rs *cos(s);
  //float sy = rs *sin(s);
  //float mx = rm *cos(m);
  //float my = rm *sin(m);
  //float hx = rh *cos(h);
  //float hy = rh *sin(h);
  strokeWeight(2);

  stroke(200,200,200);
  ellipse(0,0,rco,rco); //clock circle
   stroke(180,180,180);
  ellipse(0,0,rci,rci); //clock circle
  stroke(250,250,20);
  ellipse(0,0,rco,rco); //clock circle
  
  //similar map concenpt to draw point
  //points for (second: tau /60, minute: tau/60, hour(12-hour): tau/12)
  //location of point using sin and cos coordination transformation 
  for (int i = 0; i<60; i++) 
  {
    strokeWeight(2);
    if (i == second()) 
    {
      //fill(0);
      stroke(26);
    }
    else 
    {
      //fill(255);
      stroke(20, 255, 20);
    }
  float sx = rs *cos(i*tau/60);
  float sy = rs *sin(i*tau/60);
    point(sx,sy);
  }

    for (int i = 0; i<60; i++) 
  {
    strokeWeight(3);
    if (i == minute()) 
    {
      //fill(0);
      stroke(26);
    }
    else 
    {
      //fill(255);
      stroke(20, 25, 255);
    }
  float mx = rm *cos(i*tau/60);
  float my = rm *sin(i*tau/60);
    point(mx,my);
  }
  
      for (int i = 0; i<12; i++) 
  {
    strokeWeight(7);
    if (i == abs(hour()%12)) 
    {
      //fill(0);
      stroke(26);
    }
    else 
    {
      //fill(255);
      stroke(255, 20, 20);
    }
  float hx = rh *cos(i*tau/12);
  float hy = rh *sin(i*tau/12);
    point(hx,hy);
  }
  
  pushMatrix();
  //set up number
  rotate(tau/4);
  textSize(10);
  textAlign(CENTER);
  stroke(0);
  strokeWeight(4);
  for(int i = 1; i <= 12; i++)
  {
    rotate(PI/6);
    text(i, 0, -85);
    
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
  // strokeWeight(8);
  //for(int i = 10; i <= 60; i=i+10)
  //{
  //  rotate(PI/3);
  //  text(i, 0, -105);
    
  
  // }//End of number
   popMatrix(); //End of number
 
}//End of void draw()
//EOF
