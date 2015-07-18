float power;
float d;

void setup(){
  size(600, 600);
  background(184, 143, 80);
  power = 3;  // turbulence power
  d = 12;   // turbulence density
  noStroke();
  frameRate(3);
}

void draw(){
  for(int y = 0; y < height; y++){
  for(int x = 0; x < width; x++){
    float total = 0;
    for(float i = d; i >= 1; i = i/2){
      total += noise(x/d, y/d) * d;
    }
    
    float turbulence = 128 * total / d;
    float base = (x * 0.2) + (y * 0.12);
    float offset = base + (power * turbulence / 256);
    float gray = abs(sin(offset)) * 256;
    stroke(gray, 100);
    point(x, y);
  }
  }
  
  d++;
  if(d > 128){
    d = 0;
  }
}

