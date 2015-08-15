// Thanks to Jon in the comments for catching my stupid mistakes!

color[] atlas = {#59AEE1, #7A102D, #1581C4, #C6B32E, #1581C4, #7A102D, #59AEE1};

int x;
int w;


void setup() {
 size(800,525);
 smooth();
 background(180);
 noFill();
};

void draw() {
 stroke(atlas[int(random(7))]);
 strokeWeight(2);

 // choosing the x value!
 x = 50*(int(random(17)));

 w = 100*int(random(1, 9));
 // int w = 500; // Another cool option!

 arc(x, 450, w, 750, PI, 2*PI);


 stroke(#FFFFFF); // stroke = white 
 strokeWeight(14);

 // These are the white points. 
 for (int i = 50; i <= 800; i = i + 50) { 
 point(0, 450);
 point(i, 450);
 }
}
