int i = 0;
boolean stopDraw = true;
int positionX = 0;
int positionY = 0;

void setup()
{
  size(600, 600);
  background(255, 255, 255);
}

void draw()
{
  if (!stopDraw)
  {
    drawShape(positionX, positionY);
    i++;

    stopDraw = i > 10;
  }
}

void mouseClicked() {
  i = 0;
  positionX = mouseX;
  positionY = mouseY;
  stopDraw = false;
}
void drawShape(float centerX, float centerY) {
  //for(int i=0; i<10; i++) {   
    float length = 10*random(1, 7);
    float delta  = 40;

    float red = random(10, 255);
    float green = random(10, 255);
    float blue = random(10, 255);
    fill(red, green, blue, random(50, 200));
    bezier(centerX-length, centerY+delta, centerX-length, centerY-delta, centerX+length, centerY+delta, centerX+length, centerY-delta);

    red = red*random(0.1, 0.9);
    green = green*random(0.1, 0.9);
    blue = blue*random(0.1, 0.9);
    fill(red, green, blue, random(50, 200));
    bezier(centerX-delta, centerY-length, centerX+delta, centerY-length, centerX-delta, centerY+length, centerX+delta, centerY+length);
  //}
}
