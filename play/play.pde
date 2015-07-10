PImage img; 

void setup() {
  size(600, 590);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("alienskin.jpg");
  image(img, 0, 0);
  for(int i = 1; i < 50; i++){
    fill(140);
    stroke(140);
    ellipse(random(width), random(height), 5, 5);
  }
}

void draw() {


}
