import javax.swing.*; 
// hold the target string
String op1, opPath, message;
PFont f;

void setup() {
  size(1100, 450);
  f = createFont("Arial", 210);
  // show dialog box
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  // user prompt
  String preset="Please enter your text";
  String op1s = JOptionPane.showInputDialog(frame, "TEXT TO PICTURE", preset);
  if(op1s != null) op1= op1s;
  
  // choose path to save
  message = "running";
  selectOutput("Select a file to write to:", "saveFile");
  frameRate(10);
}

void draw() {
  background(0);
  stroke(255);
  textFont(f);
  fill(255);
  textAlign(CENTER);
}

void saveFile(File selection){
  if (selection == null) {
    message = "No selection";
    text(message, width/2, height/2 + 55);
    exit();
  } else {
    if(op1 != null){
      // show text to the end user
      message = op1;   
      text(message, width/2, height/2 + 55);
      saveFrame(selection.getAbsolutePath() + ".png");  
      exit();
    } else{
      // show error message
      message = "No text";
      text(message, width/2, height/2 + 55);
      exit();
    }
  }
  
  
}

