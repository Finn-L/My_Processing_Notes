size(600, 600);
background(58, 134, 178);
noFill();
randomSeed(0);
strokeWeight(6);
stroke(255, 150);
for(int i = 0; i < 2000; i += 15){
  float begin = radians(i);
  float end = begin + HALF_PI;
  arc(width/2, height/2, i, i, begin, end);
}

float radius = 0.15;
float cx = width/2;
float cy = height/2;
float px = cx;
float py = cy;
stroke(255, 95, 99, 180);
for (int deg = 0; deg > -360 * 100; deg -= 27){
  float angle = radians(deg);
  float x = cx + (cos(angle) * radius);
  float y = cy + (sin(angle) * radius);
  line(px, py, x, y);
  radius = radius * 1.05;
  px = x;
  py = y;
}


