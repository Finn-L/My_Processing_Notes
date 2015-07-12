PFont f1, f2;

void setup() {
  size(1000, 600);
  // get font list
  String[] fontList = PFont.list();
  printArray(fontList);
  // font setup
  f1 = createFont("Cochin-Italic", 32);
  f2 = createFont("BodoniSvtyTwoSCITCTT-Book", 32);
  fill(0);
  
}

void draw() {
  background(255);
  // timeline
  stroke(60, 203, 255);
  strokeCap(ROUND);
  strokeWeight(14);
  line(width/2, 20, width/2, height - 20);
  
  // verse 1
  textAlign(LEFT); 
  textFont(f1);
  textLeading(40); 
  fill(232, 68, 43);
  text("Sherlock, you are going to tell me how you did it? How you jumped off that building and survived?", 20, 50, 450, height);
  
  // verse 2
  textAlign(RIGHT); 
  textFont(f2);
  textLeading(40); 
  fill(84, 154, 204);
  text("You know my methods, John, I am known to be indestructible", width/2 + 10, 260, 450, height);
  
  // verse 3
  textAlign(LEFT); 
  textFont(f1);
  textLeading(40); 
  fill(232, 68, 43);
  text("No, but seriously, when you were dead, I went to your grave", 20, 400, 450, height);
}
