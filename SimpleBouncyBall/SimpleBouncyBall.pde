//Simple Bouncy Ball Designed by Chang-Long Kao 
//Prcessing 3.4 (Java mode)

//constant
float x = 0.0; //ball x position
float y = 50.0; //ball y position
float mx = 10.0; //ball x velocity
float my = 10.0; //ball y velocity
float px = 80; //paddle x length
float py = 15; //paddle y length
float ph =360; //paddle height (height - 40)
int score = 0; // start 0 score
int lives = 3; // 3 lives

//start void setup()
void setup()
{
 size(800,400);
 textSize(20);
}//End of void setup()

//start void draw()
void draw()
{
  background(26);
  stroke(200,200,200,200);
  strokeWeight(2);
  noFill();
  ellipse(x, y , 20, 20); //ball
  rect(mouseX, ph, px ,py, 15); //paddle
  x = x + mx; //x position with x velocity effect
  y = y + my; //y position with y velocity effect
 
 //out of width and rebound
  if (x < 0 || x > width)
  {
    mx = - mx;
  }
 
 //out of top  and rebound
   if (y < 0)
  {
    my = - my;
  }

  //out of bottom not gameover  ; restart ball
   if (y > height)
  {
    x = 0;
    y = 10;
    mx = 10;
    my = 10;
    score = 0;
    lives--;
   }
   
   // touch the paddle and rebound   
   if(x >= mouseX-80 && x <= mouseX+80 && y > height - 65 )
   {
     my = -my;
     mx = mx;
     y = height - 60;
     score ++;
   }
   
   //mark the score and lives 
   text("Score : "+ score, 20, 20); 
   text("Lives : "+ lives, 120, 20);
   
   //Game over condition
   if ( lives <= 0) 
   {
     background(0);
     textSize(50);
     text("Game Over", 300, height/2);
   }

}//End of void draw()
//EOF
