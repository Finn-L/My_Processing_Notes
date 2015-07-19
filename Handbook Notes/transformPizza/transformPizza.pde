float theta;

void setup(){
  background(255);
  size(600, 600);
  theta = 0;
}

void draw(){
  stroke(255, 120);
  translate(width/2, height/2);   // Set initial offset
  rotate(theta);
  for (int i = 0; i < 10; i++) {  // 10 repetitions
    strokeWeight(4);  // Increase stroke weight
    rotate(PI/4.8);    // Accumulate the rotation
    // foundation
    stroke(90, 38, 36);
    fill(216, 158, 91);
    arc(0, 0, 300, 300, 0, radians(35), PIE);
    // cheese
    stroke(90, 38, 36);
    fill(255, 207, 0);
    arc(0, 0, 260, 260, 0, radians(35));
    
    // ingrediant
    fill(255, 34, 55);
    strokeWeight(2);
    float diameter = random(14, 18);
    ellipse(random(40, 70), random(-30, 30), diameter, diameter);
    ellipse(random(70, 110), random(-30, 30), diameter, diameter);
    strokeWeight(6);
    point(random(40, 60), random(-30, 30));
    point(random(60, 110), random(-30, 30));
   }
}

