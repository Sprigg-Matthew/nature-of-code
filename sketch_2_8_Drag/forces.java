

class Friction  {
  float mu; // friction coefficient.
  float normal; 

  Friction(c, n) {
    mu     = c;
    normal = n;
  }
  PVector get(PVector v) {
    return PVector.mult(v, -1).normalize().mult(mu).mult(normal); 
  }
  void setFriction(c, n){
    mu     = c;
    normal = n;
  }
}

class Drag { // NOTE SIMPLIFIED
  float density;
  float drag; // coeff of drag.
  // Frontal Area of object.
  // Velocity magnitude
  Drag(f, d){
    density = f;
    drag    = d;
  }
  PVector get(PVector v){
    return PVector.mult(v, -1).normalize().mult(v.mag()**2).mult(drag);
  }
}
