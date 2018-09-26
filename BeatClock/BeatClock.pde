//Beat 24-hour Clock Designed by Chang-Long Kao
//Processing 3.4 (Java mode)

//constant
float min = 50;
float angle;
float bs = 100;
float bm = 100;
float bh = 100;

//start void setup()
void setup()
{
  size(400,150);
  smooth();
  textAlign(CENTER);
  noFill();
}//End of void setup()


//start void draw()
void draw()
{
  background(255);
    
  //map condition
  float s = map(second(), 0 ,60, 0, bs);
  float m = map(minute(), 0 ,60, 0, bm);
  float h = map(hour(), 0 ,12, 0, bh);
  
  //beat map condition by cos
  float ss = map(cos(angle), -1, 1, 0, 60);
  float ss2 = map(sin(s+angle), -1, 1, 0, 60);
  
  float sm = map(cos(angle), -1, 1, 0, 60);
  float sm2 = map(sin(m+angle), -1, 1, 0, 60);
  
  float sh = map(cos(angle), -1, 1, 0, 12);
  float sh2 = map(sin(h+angle), -1, 1, 0, 12);
  
  
  //set up at the center
  translate(width/2, height/2);
 
  //mark text
  pushMatrix(); 
  textSize(15);
  stroke(250,20,20);
  text("Hour" , -80,-50);
  stroke(20,20,250);
  text("Minute" ,40,-50);
  stroke(20,250,20);
  text("Second" , 160,-50);
  popMatrix();
  
 
 //Beat effect:time text
 //textSize +1 to avoid 0
  pushMatrix();

  stroke(250,0,0,100); 
  strokeWeight(sh2);
  textSize(5*sh2+1);
  text(nf(hour()), -80,15);
  
  stroke(0,250,0,100);
  strokeWeight(sm2);
  textSize(sm2+1);
  text(nf(minute()), 40,15);
    
  strokeWeight(ss2);
  textSize(ss2+1);
  text(nf(second()), 160,15);
  
  angle += 0.0523/2;
  popMatrix();

  //Beat circle condition
  if (ss < min) fill(20);
  strokeWeight(ss2);
  ellipse(-160, 0, ss/2, ss/2);

  if (sm < min) fill(20);
  strokeWeight(sm2);
  ellipse(-160, 0, sm, sm);
  
  if (sh < min) fill(20);
  strokeWeight(sh2);
  ellipse(-160, 0, sh/2, sh/2);
  
}//End of void draw()
//EOF
