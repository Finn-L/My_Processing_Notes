size(700, 200);
background(40);
float offset = 100;
float scaleVal = 80;
float angleInc = PI/75;
float angle = 0;
//beginShape(TRIANGLE_STRIP);
float px = 4;
float py = height/2;
for(int x = 4; x <= width+5; x += 3) {
  float y = sin(angle) * scaleVal + offset;
  float y2 = sin(angle - PI) * scaleVal + offset;

  if((x % 16) == 0) { // every some time
    stroke(255, 41, 39);
    strokeCap(ROUND);
    strokeWeight(5);
    line(x, y, x, y2);
  } else {
    stroke(255);
    strokeWeight(1);
    line(x, y, x, y2);
  }
  
  // chain 1
  strokeWeight(5);
  stroke(11,110, 178);
  line(x, y, px, py);
  // chain 2
  strokeWeight(1);
  noFill();
  ellipse(x, y2, 5, 5);
  
  px = x;
  py = y;
  angle += angleInc;
}

//endShape();
