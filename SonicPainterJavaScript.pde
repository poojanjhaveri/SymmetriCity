//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
int r=0,g=0,b=0;
float stroker=0,strokerg=0,strokerb=0;
boolean customstroke=false;
int currentbrushno;
int currentreflection;
boolean []brushes = new boolean[10];
int i;

void setup()
{
	brushes[0]=true;
  size(450, 450);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player.volume(0.25);
  background(r,g,b);
  rectMode(CENTER);
  colorMode(RGB, 255);
 				
}

//void draw()
//{

//}

void drawText(String t)
  {
  	stroke(#FFFFFF);
    fill(#FFFFFF);				
    textSize(100);
    // get the width for the text
    float twidth = textWidth(t);
    // place the text centered on the drawing area
    text(t, (width - twidth)/2, height/2);
  }
  

  
  
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
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 5, 5);
  
  
  noStroke();
  fill(r,g,b, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(stroker, strokerg, strokerb, 255);
  strokeWeight(lineWidth);

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

  player.setFilter(map(mouseY,0,height,50,5000),10);
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{

  player2.ramp(0.,1000); 
}

void setArea(w1,h1)
{
size(w1,h1);
}


//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies




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

void brush6(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
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

void brush7(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}



void setBackColor(int r1,int g1,int b1)
{
r=r1;
g=g1;
b=b1;
background(r1,g1,b1);
}

void setStrokeColor(int r1,int g1,int b1)
{
customstroke=true;
stroker=r1;
strokerg=g1;
strokerb=b1;
}


void changeBrush(String []s)
{
for(int i=0;i<s.length;i++)
{
brushes[i]=s[i];
}

}
