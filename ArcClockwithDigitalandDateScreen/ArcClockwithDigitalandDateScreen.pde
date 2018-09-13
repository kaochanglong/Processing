//Arc Clock with Digital and Date Screen Designed by Chang-Long Kao
//Processing 3.3.7(Java mode)

//constants
float tau = TWO_PI; // define tau as TWO_PI 
float rdc = 200; //radius for clock with defined circle
float rcc = 180; //radius for circle indicator
float rhr = 130; //radius for hours
float rms = 145; //radius for minutes
float rss = 160; //radius for seconds
float rnoon = 65; // radius for noonand midnight;
float rm0 = 72; //radius for 0 minute
float rstr =50; //radius for arc String
float sp = 20; //text line space

//date variables for digital clock
float Y = year();
float M = month();
float D = day();

//time variables 
//animation by using hour(), minute(), second()
float hr = hour();
float ms = minute();
float ss = second();

//String for arc text and weekday 
String str = "* All Rights Reserved & Designed by Chang-Long Kao";
String [] weekday = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; 

//setup size, loop and align of text
void setup()
{
size(250,250);
smooth();
textAlign(CENTER,CENTER);
loop();
}
//End of void setup()

//start draw()
void draw()
{
//background with black color  
background(0);

//translate (0, 0) to center(width/2,height/2) for all elements 
 translate(width/2,height/2);  
  
//Digital 24-hour clock with date
// hour() or hr ( minute() or ms) is ok or clock animation   
// second() is better for animation   
textSize(12);
fill(115,155,255); 
text(nf(Y)+"/"+nf(M)+"/"+nf(D),0,-sp);
fill(115,155,255);
text(nf(hour()) + ":" + nf(minute()) + ":" + nf(second()), 0,+sp);  
  
//calculate weekday with Zeller's congruence
//String [] weekday = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; 
//weekday start with Sunday for modulus 0
float y1 = round(Y / 100);
float y2 = round(Y / 10);
float wd = abs((y2 + round(y2/4) + round(y1/4) - 2*y1+ round(26*(M + 1)/10) + D - 1) % 7);
fill(115,255,115);  
text(weekday[int(wd)], 0, 0);  
  
//rotate -90 degree for for all elements in Arc clock
//start with 12 clock
rotate(-tau/4);

//nofill for all elements in Arc clock
noFill();

//defined surface of clpck with defined circle (using rdc)
strokeWeight(4);
stroke(245, 215, 25);  
ellipse(0, 0, rdc, rdc);   

//color indicator for Arc clock
//different stroke of clock cicle
//Gold (noon), Green (18:00 - 6:00), Yellow(6:00-12:00) and Rosy Brown Light(12:00 - 18:00 Green)
   if(hr % 12 == 0){stroke(245, 215, 20);}
   if(((hr > 0) && ( hr <= 6)) || ((hr >= 18) && ( hr < 24))){stroke(0, 255,0);}
   if((hr > 12) && ( hr < 18)){stroke(230, 202, 252);}
   if((hr > 6) && ( hr < 12)){stroke(255, 255, 0);}
   strokeWeight(6);
   ellipse(0,0, rcc, rcc);

//24-hour Arc clock
//Arck clock: hour  
//point for noon and arcs for others
   if((hr == 12) ||(hr == 0) ){
      for(float i = 1.0; i <360; i+=30){
      float x = rnoon * cos(radians(i));
      float y = rnoon * sin(radians(i));
      stroke(210, 210, 215);
      strokeWeight(5);
      point(x, y);
      //ellipse(x, y, 5, 5);
      }
      }
    else
      {
      float h = map(hr%12, 0, 12, 0, tau);
      stroke(255, 0, 0);
      strokeWeight(4);
      arc(0, 0, rhr, rhr, 0, h);
      }
  
//Arc clock: minute
//point for 0, 12 and arcs for others  
   if(ms==0){ 
     for(float i = 1.0; i <360; i+=360){
      float x = rm0 * cos(radians(i));
      float y = rm0 * sin(radians(i));
      stroke(255, 11, 110);
      strokeWeight(6);
      point(x, y);
      }
      }
    else
      {
      float m = map(minute(), 0, 60, 0, tau);
      stroke(0, 0, 255);
      strokeWeight(4);  
      arc(0, 0, rms, rms, 0, m);
      }
          
//Arc clock: second   
   stroke(0, 255, 0);
   strokeWeight(4);
   float s = map(second(), 0, 60, 0, tau);
   arc(0, 0, rss, rss, 0, s);  

//Arc text  
//rotate the angle angle which position to start arc text
   rotate(tau/4);
   noFill();

//constant for arc text
   float lengtharcstr = 0; // initial arc length for text
   float rstr = 50; // radius for arc text

//varibles for arc text
//anglearctext is arc text is textWidth of String / rstr (just like the definitio of arc length ~ theta )  
   float anglearctext = textWidth(str)/rstr;

//charAt(i) gets position i in the String str
//char Char for each i in the String str
//textwidth(tw) for width of Char
//define angle you want to rotate
//increasing lengtharctext every half of textwidth(tw)
//You can try the way you want to translate and rotate by changing:
//(1) the last part of angle formula (lengtharcstr / rstr is like the definition of arc length ~ theta)
//(2) rotate different angle
//(3) different size text and rstr  
   for (int i =0; i < str.length(); i++)
   {
     char Char = str.charAt(i); 
     float tw = textWidth(Char);
     lengtharcstr += tw/2;
     float angle = lengtharcstr / rstr - anglearctext / 2 ; 
     pushMatrix();
     rotate(angle); 
     translate(0, -rstr); 
     fill(245, 215, 20);
     textSize(12);
     text(Char, 0 ,0);
     popMatrix();
     lengtharcstr += tw/2;
   } 

}//End of void draw() 
//EOF
