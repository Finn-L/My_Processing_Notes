size(300, 300);
background(50);

smooth();

stroke(200, 0, 0);
strokeWeight(4);
for(int x = 0; x < 300; x++){
  float n = norm(x, 0, 300);
  float y = pow(n, 8) ;
  y *= 300;
  
  
 // drawing parameters
 strokeWeight(1);
 float alpha1 = map(y, 0, 300, 0, 255);
 float alpha2 = map(y, 0, 300, 0, 100);
 // background ingradient
 stroke(120, 209, 255, alpha1);
 line(x, 0, x, height);
 
 // curves using data of y = x^8
 stroke(229, 84, 17, alpha2);
 bezier(width/2, height,  0, height/2,  y, height*3/4,  width, height /4);
 
}
