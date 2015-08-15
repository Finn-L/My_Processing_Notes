float r = 400;
int bgInfo = 5000;
int fgNew = 15;
int fgOld = 2 * fgNew;
// initialize a slider to adjust ratio
Button slider;
// declare two graphs
RiskInfo before;
RiskInfo after;

int bgCol = 255;

void setup() {
  size(1024, 768);
  // define two graphs
  before = new RiskInfo(width/4, height/3, r, bgInfo, fgOld);
  after = new RiskInfo(width*3/4, height/3, r, bgInfo, fgNew);
  slider = new Button(width/2, height*4/5, 300, 40);
}

void draw() {
  background(bgCol);
  // button
  slider.display();
  
  // draw pie chart skeleton
  before.displayGraph();
  after.displayGraph();
  // display risk information
  before.displayText();
  after.displayText();
  
  // update foreground information
  fgNew = (int)slider.ratio;
  fgOld = 2 * fgNew;
  before.update(fgOld);
  after.update(fgNew);
  
  // Label switch
  
  if(mousePressed && dist(mouseX, mouseY, width*3/4, height*4/5) < 20){
    fill(232, 137, 12);
    before.showLabel();
    after.showLabel();
  } else {
    fill(255, 250, 103);
  }
  
   ellipse(width*3/4, height*4/5, 20, 20);
   
   // bonus color scheme
   if(mousePressed && dist(mouseX, mouseY, width/4, height*4/5) < 20){
    fill(68, 12, 232);
    bgCol = constrain(bgCol - 1, 0, 255);
  } else {
    fill(0, 171, 171);
  }
  
   ellipse(width/4, height*4/5, 20, 20);
}

void mouseDragged(){
  slider.update();
}

