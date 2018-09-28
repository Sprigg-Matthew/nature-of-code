//import processing.core.PVector;

class Friction  {
  float mu; // friction coefficient.
  float normal; 

  Friction(float c, float n) {
    mu     = c;
    normal = n;
  }
  public PVector get(PVector v) {
    return PVector.mult(v, -1).normalize().mult(mu).mult(normal); 
  }
  public void setFriction(float c, float n) {
    mu     = c;
    normal = n;
  }
}

class Drag { // NOTE SIMPLIFIED
  float density;
  float drag; // coeff of drag.
  // Frontal Area of object.
  // Velocity magnitude
  Drag(float f, float d){
    density = f;
    drag    = d;
  }
  public PVector get(PVector v){
    return PVector.mult(v, -1).normalize().mult(v.mag()*v.mag()).mult(drag);
  }
  public void set(float f, float d){
    density = f;
    drag    = d;
  }
}
