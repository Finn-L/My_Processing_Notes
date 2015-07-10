class RiskInfo{
  float r;
  float x;
  float y;
  int bg;
  int fg;
  float angle;
  
  RiskInfo(float x_, float y_, float r_, int bg_, int fg_){
    x = x_;
    y = y_;
    r = r_;
    bg = bg_;
    fg = fg_;
    angle = 360.0*fg/bg;
  }
  
  void update(int fg_){
    fg = fg_;
  }
  
  void displayGraph(){
    noStroke();
    fill(0);
    ellipse(x, y, r, r);
    float fgFloat = float(fg);
    float bgFloat = float(bg);
    float ratio = fgFloat/bgFloat;
    angle = 360.0*ratio;
    float leftEdge = 270 - angle/2;
    float rightEdge = 270 + angle/2;
    fill(255);
    arc(x, y, r+1, r+1, radians(leftEdge), radians(rightEdge));
  }
  
  void displayText(){
    fill(0);
    textAlign(CENTER);
    textSize(32);
    text(fg + "/" + bg, x, y+r/2+100);
  }
  
  void showLabel(){
    textAlign(CENTER);
    textSize(14);
    text(fg, x, y - r/2 - 20);
  }
}
