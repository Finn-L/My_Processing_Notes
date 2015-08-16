//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
float[][] floats;
Trigs trigs;
int counter;


void setup()
{
  size(640, 960);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player.volume(0.35);
  background(0);
  rectMode(CENTER);
  
  //my cutomized code
  floats = new float[8][2];
  floats[0][0] = width/2;
  floats[0][1] = height/2;
  // init my class
  trigs = new Trigs(floats);
  // keep track of mouse input number
  counter = 0;
}

void draw()
{
  // display the shapes
  trigs.display();
  
}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
 
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 10, 0);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  noStroke();
  fill(red, green, blue, 150);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  // I decided brush 2 is a better choice, so I copy 2 to 1
  brush1(mouseX, mouseY,speed, speed,lineWidth);
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  
  // set the triangle locations based on mouse inputs
  float chance = random(1);
  if(chance > 0.9){
    floats[counter][0] = mouseX + random(-150, 150);
    floats[counter][1] = mouseY + random(-150, 150);
    counter++;
    // so the array could change
    if(counter > floats.length - 1){
      counter = 0;
      background(0);
    }
  }
  // update my customized shapes
  trigs.update(floats);
  
  // tune audio
  //player.setFilter((float) (mouseY/height*5000) ,mouseX / width);  
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  player2.ramp(0.,1000);      
}
