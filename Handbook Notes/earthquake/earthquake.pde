int gap = 20;  // Distance between arcs
int thickness = 2;  // Thickness of each arc 
float bgColor = 255;

void setup() {
  size(600, 600);
  noFill();
  strokeWeight(thickness);
  stroke(0);
  frameRate(30);
}

void draw() {
  background(bgColor);
  float arcLength = mouseX / 95.0;
  for (int i = gap; i < width-gap; i += gap) {
    float angle = radians(i);
    noStroke();
    fill(255, 118, 94, 50);
    arc(width/2 + random(15), height/2 + random(15), i, i, angle, angle + arcLength, CHORD);
  }
  
  if(mouseX > 580){
    bgColor --;
  }
}
