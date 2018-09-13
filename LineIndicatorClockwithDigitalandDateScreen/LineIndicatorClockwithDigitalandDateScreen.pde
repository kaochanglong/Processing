//24-hour Line Indicator Clock with Digital and Date Screen Designed by Chang-Long Kao
//Processing 3.3.7(Java mode)

//constant
float rss =120; //the length of indicator line just like slider bar
float sl = 35; //the space of different lines
float sd = 12; //the between point and line
float sx = 1.5*rss; 
float dx = -100; //displacement of text(date)
float dx1 = -20; //displacement of lines

//date variables for digital clock
float Y = year();
float M = month();
float D = day();

//String
String str = "* All Rights Reserved & Designed by Chang-Long Kao *";
String [] weekday = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; 

//start with void setup()
void setup()
{
size(400, 300);
textSize(12);
textAlign(CENTER);
}
//End of void setup()

//start with void ()
void draw()
{
//black color background
//tranlate (0,0) to (0.4* width, height/10);
background(0);
noFill();
strokeWeight(5);
translate(0.4* width, height/10);

//line year
//map different year line
float hb = map(0, 0, 24, 0, rss); // limit of line
float h = map(hour(), 0 , 24, 0 ,rss); // real time line 
strokeWeight(5);

//limit of line
stroke(255, 255, 255);
line(dx1,0, hb+rss, 0);

//real time line
stroke(250, 20, 0);
line(dx1,0,h,0);

//real time point
point(h, 1.2*sd);

//show hour
textSize(30);
fill(255, 0, 0);
text(nf(hour()),1.5*rss,0.5*sd);
text("Hour",dx,0.8*sd);

//line minute
//map different minute line
float mb = map(0, 0, 60, 0, rss); // limit of line
float m = map(minute(), 0 , 60, 0 ,rss); // real time line
strokeWeight(5);

//limit of line
stroke(255, 255, 255);
line(dx1,sl,mb+rss,sl);

//real time line
stroke(0, 2, 255);
line(dx1,sl,m,sl);

//real time point
point(m, sl+1.2*sd);

//show minute
textSize(30);
fill(0, 0, 255);
text(nf(minute()),1.5*rss,sl+0.5*sd);
text("Minute",dx,sl+0.8*sd);


//line second
//map different second line
float sb = map(0, 0, 60, 0, rss); //limit of line
float s = map(second(), 0 , 60, 0 ,rss); // real time line
strokeWeight(5);

//limit of line
stroke(255, 250, 255);
line(dx1,2*sl,sb+rss,2*sl);

//real time line
stroke(0, 250, 0);
line(dx1,2*sl,s,2*sl);

//real time point
point(s, 2*sl+1.2*sd);

//show second
textSize(30);
fill(0, 255, 0);
text(nf(second()),1.5*rss,2*sl+0.5*sd);
text("Second",dx,2*sl+0.8*sd);

//line year
//map different year line
float yb = map(0, 0 , 10000, 0 ,rss); //limit of line
float y = map(year(), 0 , 10000, 0 ,rss); //real time line
strokeWeight(5);

//limit of line
stroke(255, 250, 255);
line(dx1,3*sl,yb+rss,3*sl);

//real time line
stroke(255, 255, 50);
line(dx1,3*sl,y,3*sl);

//real time point
point(y,3*sl+1.2*sd);

//show year
textSize(30);
fill(255, 255, 50);
text(nf(year()),1.5*rss,3*sl+0.5*sd);
text("Year",dx,3*sl+0.8*sd);


//line month
//map different month line
float Mb = map(0, 0 , 12, 0 ,rss); // limit of line
float Mm = map(month(),1, 12, 0 ,rss); // real time line
strokeWeight(5);

//limit of line
stroke(255, 250, 255);
line(dx1,4*sl,Mb+rss,4*sl);

//real time line
stroke(235, 130, 150);
line(dx1,4*sl,Mm,4*sl);

//real time point
point(Mm,4*sl+1.2*sd);

//show month
textSize(35);
fill(235, 130, 150);
text(nf(month()),1.5*rss,4*sl+0.8*sd);
text("Month",dx,4*sl+0.8*sd);


//line day
//map different day line
float db = map(0, 0 , 31, 0 ,rss); //limit of line
float d = map(day(), 1 , 31, 0 ,rss); //real time line
strokeWeight(5);

//limit of line
stroke(255, 250, 255);
line(dx1,5*sl,db+rss,5*sl);

//real time line
stroke(15, 115, 15);
line(dx1,5*sl,d,5*sl);

//real time point
point(d,5*sl+1.2*sd);

//show day
textSize(38);
fill(15, 115, 15);
text(nf(day()),1.5*rss,5*sl+1*sd);
text("Day",dx,5*sl+1.3*sd);

//line weekday
//calculate weekday with Zeller's congruence
//String [] weekday = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}; 
//weekday start with Sunday for modulus 0
float y1 = round(Y / 100);
float y2 = round(Y / 10);
float wd = abs((y2 + round(y2/4) + round(y1/4) - 2*y1+ round(26*(M + 1)/10) + D - 1) % 7);

//map different weekday line
float wdb = map(0, 0 , 7, 0 ,rss); //limit of line
float wdd = map(wd, 0 , 6, 0 ,rss); //real time
strokeWeight(5);

//limit of line
stroke(255, 250, 255);
line(dx1,6*sl,wdb+rss,6*sl);

//real time line
stroke(240, 130, 50);
line(dx1,6*sl,wdd,6*sl);

//real time point
point(wdd,6*sl+1.2*sd);

//show weekday
textSize(20);
fill(240, 130, 50);
text(weekday[int(wd)],1.5*rss,6*sl+0.8*sd);
text("Weekday",dx,6*sl+0.8*sd);

//footer
pushMatrix();
textSize(5);
fill( 245, 220, 50);
text(str,-0.3*dx,255);  
popMatrix();

}//End of void draw()
//EOF
