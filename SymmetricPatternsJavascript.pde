// Coded by Poojan Jhaveri above SonicPainter


Maxim maxim;			// Variable for maxim API	
AudioPlayer player;		// Player for background
AudioPlayer player2;	// Player to play when pattern is drawn
int r=0,g=0,b=0;		// R,G,B for background 

float stroker=0,strokerg=0,strokerb=0,lineWidth=10,alpha=1;		// R,G,B for strokes, default linewidth and alpha
boolean customstroke=false,defaultStrokeSpeed=true,defaultAlpha=true,automaticgenerator=true; // Booleans for various conditions
int currentbrushno;		// Current Brush Number
boolean []brushes = new boolean[12];	//Array of booleans for brushes ON/OFF
float time = 0; 			// clock 
int i;				
float multiplier=5;			// Float value of multiplier for automatic patterns

void setup()
{

	brushes[8]=true;		// Default brush 8 to be ON
  size(450, 450);			// Size 
  maxim = new Maxim(this);	
  player = maxim.loadFile("atmos1.wav");	// Setting up player1
  player.setLooping(true);		
  player2 = maxim.loadFile("hiphop.wav");	// Setting up player2
  player2.setLooping(true);
  player.volume(0.25);
  background(r,g,b);		// Change Background
  rectMode(CENTER);				
  colorMode(RGB, 255);
 frameRate(10);				// Setting up frame rate
}

void draw()

{
  if(automaticgenerator)		// Checking boolean value of automaticgenerator boolean value for brushes/symmetricity
  
  {
  
  background(r,g,b);			// Setting up background
  
  

  
  translate(width*0.5,height*0.5); 			/* translate all the drawing to the middle of the screen */
  noFill(); 								/*stop the computer filling in shapes*/
  time=time+0.01; 							/* update the value in the variable 'time'. This means that we add 'time' every frame */
  for (int i = 0;i < 20; i++) 
  { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
  rotate(time); /* rotate the coordinate system a bit */

  if(!customstroke)						// Custom Stroke condition
  {
  stroker = random(255);				// Random color red value
  strokerb = random(255);				// Random color blue	
  strokerg = random(255);				// Random color green
  }
  stroke(stroker, strokerg, strokerb, 255);		// Setting stroke

/* Symmetric generator based on which brush is selected . multiplier is the value selected by user*/

if(brushes[0])
	{
 	point(i*multiplier,i*multiplier);
	}
	if(brushes[1])
	{
	point(i*multiplier,i*multiplier);
	point(width/2+((width/2)-i*multiplier),i*multiplier);
	}
	if(brushes[2])
	{
	point(i*multiplier,i*multiplier);
	point(i*multiplier,height/2+((height/2)-i*multiplier));
	}
	if(brushes[3]){
  	rect(i, i, i*multiplier, i*multiplier);
	}
	
  	if(brushes[4]){
  	line(i, i,i*multiplier, i*multiplier);
	}
	
	if(brushes[5]){
  	brush1(i, i,i*multiplier, i*multiplier,lineWidth);
	}
	
	if(brushes[6]){
	brush2(i, i,i*multiplier, i*multiplier,lineWidth);
	}
	
	if(brushes[7]){
	brush4(i, i,i*multiplier, i*multiplier,lineWidth);
	}
	
	if(brushes[8]){
	brush5(i, i,i*multiplier, i*multiplier,lineWidth);
	}
	
	if(brushes[9]){
	brush6(i, i,i*multiplier, i*multiplier,lineWidth);
	}
	
	if(brushes[10]){
	brush7(i, i,i*multiplier, i*multiplier,lineWidth);
  }
  if(brushes[11]){
	brush3(i, i,i*multiplier, i*multiplier,lineWidth);
  }


  }
  }
}

void drawText(String t)
  {
  	stroke(#FFFFFF);
    fill(#FFFFFF);							// Fill for the text
    textSize(100);   						// get the width for the text
    float twidth = textWidth(t);
    text(t, (width - twidth)/2, height/2);  // place the text centered on the drawing area
  }
  

  /* Resetting the canvas */
  
void reset()
{
background(r,g,b);
}

void mouseDragged()
{
  player.play();
  player2.play();
  
  if(!customstroke)
  {
  stroker = map(mouseX, 0, width, 0, 255);
  strokerb = map(mouseY, 0, width, 0, 255);
  strokerg = dist(mouseX,mouseY,width/2,height/2);
  }
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  if(defaultAlpha)	// Check for default alpha button pressed
  {
  alpha = map(speed, 0, 20, 0, 10);	// mapping alpha to speed
  }
  
  if(defaultStrokeSpeed)
  {
 	lineWidth = map(speed, 0, 10, 10, 1);	// mapping strokewidth to speed
  lineWidth = constrain(lineWidth, 5, 5);
  }
  
  noStroke();
  fill(r,g,b, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(stroker, strokerg, strokerb, 255);
  strokeWeight(lineWidth);


/* Setting up brushes based on value selected by user*/

 	if(brushes[0])
	{
 	point(mouseX,mouseY);
	}
	if(brushes[1])
	{
	point(mouseX,mouseY);
	point(width/2+((width/2)-mouseX),mouseY);
	}
	if(brushes[2])
	{
	point(mouseX,mouseY);
	point(mouseX,height/2+((height/2)-mouseY));
	}
	if(brushes[3]){
  	rect(mouseX, mouseY, speed, speed);
	}
	
  	if(brushes[4]){
  	line(pmouseX, pmouseY,mouseX, mouseY);
	}
	
	if(brushes[5]){
  	brush1(mouseX, mouseY,speed, speed,lineWidth);
	}
	
	if(brushes[6]){
	brush2(mouseX, mouseY,speed, speed,lineWidth);
	}
	
	if(brushes[7]){
	brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
	}
	
	if(brushes[8]){
	brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
	}
	
	if(brushes[9]){
	brush6(mouseX, mouseY,speed, speed,lineWidth);
	}
	
	if(brushes[10]){
	brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  }
  if(brushes[11]){
	brush3(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  }

 // player.setFilter(map(mouseY,0,height,50,5000),10);
  player2.ramp(1.,1000);
  //player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{

  player2.ramp(0.,1000); 
}

/* To choose custom area based on user condition*/
void setArea(w1,h1)
{
size(w1,h1);
}



void brush1(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  return;
}


void brush2(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}

void brush4(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}



void brush5(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}


// Brush 6 - ellipses for different situations
void brush6(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  px=px;
  py=py;
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  return;
}


// BRush 7 opposite horizontal
void brush7(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}


/* Set background color */
void setBackColor(int r1,int g1,int b1)
{
r=r1;
g=g1;
b=b1;
background(r1,g1,b1);
}

/* Stroke Color to be true */
void setStrokeColor(int r1,int g1,int b1)
{
customstroke=true;
stroker=r1;
strokerg=g1;
strokerb=b1;
}



void setDefaultStrokeWidth()
{
defaultStrokeSpeed = true;
}

/* Custom stroker width */
void setStrokeWidth(float t)
{
lineWidth=t;
defaultStrokeSpeed = false;
}

/* default alpha to be on */


void setDefaultAlpha()
{
defaultAlpha = true;
}


/* mapping alpha to value as mentioned by user */
void setAlpha(float t)
{
alpha = map(t, 0, 20, 0, 10);
defaultAlpha = false;
}

/* setting boolean value for brush as selected by user */ 


void changeBrush(String []s)
{
for(int i=0;i<s.length;i++)
{
brushes[i]=s[i];
}
}

/* choosing between painter or between generator */

void setAutomaticGenerator(Boolean b)
{
automaticgenerator=b;
}


/* Setting multiplier value */
void setMultiplier(float x)
{
multiplier=x;
}

