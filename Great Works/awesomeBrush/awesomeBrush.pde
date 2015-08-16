//------------------------------------------------------------------

class Segment 
{
  color FILL_COLOUR; //sorry for all you americans out there

  float spikiness;
  float amount;

  PVector startPoint;
  PVector middlePoint;
  PVector middleTopPoint;
  PVector middleBottomPoint;
  PVector endPoint;

  int start; //what time in system millis was this created?
  int destroyStart;

  int lifeSpan = 2;
  boolean alive;

  Segment(PVector _point, PVector _previousPoint, float _spikiness)
  {
    start = millis();
    destroyStart = 0;
    alive = true;
    amount = 0;

    startPoint = new PVector(0, 0);
    middlePoint = new PVector(0, 0);
    middleTopPoint = new PVector(0, 0);
    middleBottomPoint = new PVector(0, 0);
    endPoint = _point;

    spikiness = _spikiness;

    calculateSegment(_previousPoint); 
    //println(startPoint.x + "," + startPoint.y + " " + middleTopPoint.x + "," + middleTopPoint.y + " " + endPoint.x + "," + endPoint.y + " " + middleBottomPoint.x + "," + middleBottomPoint.y + " " );
  }

  void calculateSegment(PVector _previousPoint)
  {
    // get previous point
    startPoint = _previousPoint;

    // middle point
    middlePoint = new PVector((_previousPoint.x + endPoint.x)/2, (_previousPoint.y + endPoint.y)/2);

    // middle vector and points
    final float dist = (_previousPoint.dist(endPoint)/2) * random(1, spikiness);    
    final float dx = _previousPoint.x - endPoint.x * random(1, spikiness);
    final float dy = _previousPoint.y - endPoint.y * random(1, spikiness);   
    final float angle = atan2(dy, dx) + (PI/2);    
    final PVector point1 = new PVector(-dist * cos(angle), -dist * sin(angle));
    final PVector point2 = new PVector(dist * cos(angle), dist * sin(angle));
    middleTopPoint = new PVector(middlePoint.x - point1.x, middlePoint.y - point1.y);
    middleBottomPoint = new PVector(middlePoint.x - point2.x, middlePoint.y - point2.y);

    //colour
    final float red = map(startPoint.x, 0, width, 0, 255);
    final float blue = map(startPoint.y, 0, width, 0, 255);
    final float green = dist(startPoint.x, startPoint.y, width/2, height/2);
    FILL_COLOUR = color(red, blue, green);
  }

  void display()
  {
    noStroke();
    if (alive) { 
      fill(FILL_COLOUR);
    } else { 
      fill(200);
    }
    point(startPoint.x, startPoint.y);
    beginShape();
    vertex(startPoint.x, startPoint.y);
    vertex(middleTopPoint.x, middleTopPoint.y);
    vertex(endPoint.x, endPoint.y);
    vertex(middleBottomPoint.x, middleBottomPoint.y);
    endShape(CLOSE);
  }

  void update()
  {
    if (alive)
    {
      int ellapsed = (millis() - start) / 1000;    
      if (ellapsed > lifeSpan)
      {
        destroyStart = millis();
        alive = false;
      }
    } else {
      destroy();
    }
  }

  boolean deleteMe()
  {
    if (amount >= 1) {
      return true;
    } else {
      return false;
    }
  }

  void destroy()
  {
    if (!alive) {

      final PVector oldMiddleTopPoint = middleTopPoint.get();
      final PVector oldMiddleBottomPoint = middleBottomPoint.get();

      if (amount <= 1) {
        amount += 0.01;
      }

      float lerpMTPX = lerp(oldMiddleTopPoint.x, middlePoint.x, amount);
      float lerpMTPY = lerp(oldMiddleTopPoint.y, middlePoint.y, amount);
      float lerpMBPX = lerp(oldMiddleBottomPoint.x, middlePoint.x, amount);
      float lerpMBPY = lerp(oldMiddleBottomPoint.y, middlePoint.y, amount);

      middleTopPoint.x = lerpMTPX;
      middleTopPoint.y = lerpMTPY;
      middleBottomPoint.x = lerpMBPX;
      middleBottomPoint.y = lerpMBPY;
    }
  }
}

//------------------------------------------------------------------

class Path 
{

  ArrayList<Segment> segments;

  Path()
  {
    segments = new ArrayList();
  }

  void addAt(int _x, int _y)
  {
    final int index = segments.size();
    final PVector previousPoint = new PVector(0, 0);
    final PVector currentPoint = new PVector(_x, _y);
    
    if (index == 0) {
      previousPoint.x = _x;
      previousPoint.y = _y;
    } else {
      Segment s = segments.get(index - 1);
      if (s.endPoint.dist(currentPoint) > 100)
      {
        previousPoint.x = _x;
        previousPoint.y = _y;
      } else {
        previousPoint.set(s.endPoint);
      } 
    }

    Segment newSeg = new Segment(currentPoint, previousPoint, 3);
    segments.add(newSeg);
  }

  void run()
  {
    for (Segment s : segments)
    {
      s.display();
      s.update();
    }

    for (int i = segments.size() - 1; i >= 0; i--) {
      Segment s = segments.get(i);
      if (s.deleteMe()) {
        segments.remove(i);
      }
    }
  }
}

//------------------------------------------------------------------

Path path;

void setup()
{
  path = new Path();
  size(600, 600); 
  smooth();
}

void draw()
{
  background(0);
  path.run();
}

void mouseDragged()
{
  path.addAt(mouseX, mouseY);
}
