int gap = 20;  // Distance between arcs
int thickness = 2;  // Thickness of each arc 
float bgColor = 255;
float xnoise, ynoise; // noise for motion

void setup() {
  size(600, 600);
  noFill();
  strokeWeight(thickness);
  stroke(0);
  frameRate(30);
  xnoise = 0;
  ynoise = 5;
}

void draw() {
  background(bgColor);
  float arcLength = mouseX / 95.0;
  // generate motion
  xnoise += 0.2;
  ynoise += 0.2;
  for (int i = gap; i < width-gap; i += gap) {
    float angle = radians(i);
    noStroke();
    fill(255, 118, 94, 50);
    arc(width/2 + noise(xnoise)*30, height/2 + noise(ynoise)*30, i, i, angle, angle + arcLength, CHORD);
  }
  // control bg color
  if(mouseX > 580){
    bgColor --;
  }else if (mouseX < 20){bgColor ++;}
}
