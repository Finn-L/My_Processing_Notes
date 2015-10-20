import javax.swing.*; 
String op1;
PFont f;

void setup() {
  size(1100, 450);
  f = createFont("Arial", 210);
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  String preset="2";
  String op1s = JOptionPane.showInputDialog(frame, "Option 1", preset);
  if(op1s != null) op1= op1s;
  frameRate(10);
}

void draw() {
  background(0);
  stroke(255);
  textFont(f);
  fill(255);
  textAlign(CENTER);
  text(op1, width/2, height/2 + 55);
  saveFrame("output.png");
  exit();
  
}

