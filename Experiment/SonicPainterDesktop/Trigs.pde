public class Trigs{
  
  float[][] floats;
  
  Trigs(float[][] floats_){
    floats = floats_;
  }
  
  void display(){
    fill(0);
    strokeWeight(10);
    strokeJoin(ROUND);
    beginShape(TRIANGLE_STRIP);
    // draw shapes based on random mouse inputs
    for(float[] loc : floats){
      vertex(loc[0], loc[1]);
    }
    endShape();
  }
  
  void update(float[][] newFloats){
    for(int i = 0; i < floats.length; i++){
      floats[i][0] = newFloats[i][0];
      floats[i][1] = newFloats[i][1];
    }
  }
  
}
