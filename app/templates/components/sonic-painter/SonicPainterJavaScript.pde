//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
// we have two audio players to add two sounds 
AudioPlayer player;
AudioPlayer player2;


void setup()
{
  size(768, 1024);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("beat.wav");
  player2.setLooping(true);
  //turns the volume down for the first player
  player.volume(0.25);
  player2.volume(0.25);
  background(0);
  rectMode(CENTER);

}

//void draw()
//{
//  
//}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  // dist uses the pythagorean theorem logic to get the middle point 
  // of the drawn line, so that the center is more green than outer 
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 5);
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);
  //makes the width of the line at a max of 10 and min 0
  lineWidth = constrain(lineWidth, 0, 10);
  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  
  //different patterns of drawings that will display (squares, circles, etc)
  //rect(mouseX, mouseY, speed, speed);
  //line(pmouseX, pmouseY,mouseX, mouseY);
  //brush1(mouseX, mouseY,speed, speed,lineWidth);
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  player.setFilter(map(mouseY,0,height,50,5000),10);
  player2.ramp(1.,1000);
  // wherever you are from 0 to X / (width/2) controls the sound speed 
  // as you move 
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{

  player2.ramp(0.,1000);

        
}