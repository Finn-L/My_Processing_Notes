
ArrayList<Particle> particles;
// Music Player
Maxim maxim;
AudioPlayer player;
float power=0;
//float threshold = 0.35;// vary this until the square appears on the beats
float threshold = 0.28;// vary this until the square appears on the beats
int wait = 0;
boolean playit = false;

// color scheme
color[] colorPane;
color selfColor;

void setup() {
  size(768, 1024); 
  particles = new ArrayList<Particle>();
  frameRate(30); // this is the framerate. Tweak for performance.
  maxim = new Maxim(this);
  player = maxim.loadFile("beat.wav");
  player.setLooping(true);
  player.setAnalysing(true);
  //initialize color panel
  colorPane = new color[5];
  colorPane[0] = color(178, 65, 50);
  colorPane[1] = color(201, 255, 25);
  colorPane[2] = color(255, 30, 0);
  colorPane[3] = color(20, 94, 204);
  colorPane[4] = color(9, 77, 178);
}

void draw() {
  // music
  //  noFill();
  if (playit) {
    background(20);
    fill(255);
    player.play(); 
    power = player.getAveragePower(); 
    println(power);
    // generate particles
    int colorPick = (int)random(4);
    selfColor = colorPane[colorPick];
    particles.add(new Particle(selfColor, power)); 
//    colorPick = (int)random(4);
//    selfColor = colorPane[colorPick];
//    particles.add(new Particle(selfColor, power));
    // Iterate through our ArrayList and get each Particle
    // The ArrayList keeps track of the total number of particles.
    for (Particle p : particles) { 
      p.run();
      p.gravity();
      p.display();
    }
    if (power>threshold && wait < 0) {
      wait=10;      
    }
    wait--;
  } else {
        particles.clear();
        background(255);
         }

  // If the ArrayList has more than 100 elements in it, we delete the first element, using remove().
  if (particles.size() > 100) {
    particles.remove(0);
  }
}

void mousePressed() {
  
    playit = !playit;
    
    if (playit) {

         player.play(); 
 
    } else {
     
     player.stop(); 
      
    }
  
}
