// A simple Particle class
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  color self;
  float power;
  float diameter;

  Particle(color self_, float power_) {
    x = mouseX;
    y = mouseY;
    xspeed = random(-1,1); 
    yspeed = random(-1,0);
    self = self_;
    power = power_;
    if(power > threshold){
      xspeed += random(-10, 10);
      yspeed += random(-10, 2);
      diameter = 25;
      self = color(255);
    } else {
      diameter = 10;
    }
  }
  
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += 0.15;
  }
  
  void display() {
    noStroke();
    fill(self);
    ellipse(x,y,diameter,diameter);
    if(power > threshold){
      diameter -= 0.6;
    }
  }
}
