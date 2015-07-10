class Button {
  float x;
  float y;
  float w;
  float h;
  boolean on;
  float elliX;
  float ratio;
  
  Button(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    on = false;
    elliX = x_;
    ratio = fgNew;
  }
  
  void display(){
    rectMode(CENTER);
    noStroke();
    if(on){
    fill(10);
    } else {
      fill(175);
      }
    rect(x,y,w,h);
    // display slider indicator
    fill(200);
    ellipse(elliX, y, h, h);
    
  }
  
  void update(){
    if (dist(mouseX, mouseY, elliX, y) < h/2) {
      on = true;
      ratio = map(mouseX, x - w/2, x + w/2, 1, 100);
      elliX = mouseX;
      elliX = constrain(elliX, x - w/2, x + w/2);
    } else{
      on = false;
    }  
  }
}
