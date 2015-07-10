import processing.pdf.*;

//Global Variables
PShape baseMap;
String csv[];
String myData[][];
PFont f;

void setup(){
  size(1800, 900);
  //preserve energy consumed;
  noLoop();
  f = createFont("Avenir-Medium", 12);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("MeteorStrikes.csv");
  myData = new String[csv.length][6];
  // parse csv data into a matrix
  for(int i = 0; i < csv.length; i++){
    myData[i] = csv[i].split(",");
  }
}


void draw(){
  beginRecord(PDF, "meteorStrikes.pdf");
  
  textMode(MODEL);
  textFont(f);
  shape(baseMap, 0, 0, width, height);
  // actual data visualization part
  for(int i = 0; i < myData.length; i++){
    noStroke();
    fill(255, 0, 0, 50);
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float markerSize = 0.05 * sqrt(float(myData[i][2])) / PI;
    ellipse(graphLong, graphLat, markerSize, markerSize);
    // label
    if(i < 9){
      fill(0);
      text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
      line(graphLong + markerSize, graphLat, graphLong + markerSize/2, graphLat);
    }
  }
  
  endRecord();
}
