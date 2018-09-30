class Mover {
  // Movement
  PVector location, velocity, acceleration;  
  float mass;
  
  Mover(float m, float x, float y) {
    location     = new PVector(x, y);
    velocity     = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    //mouseBait = false;   
  }
  
  // UPDATE
  void update() {     
    this.display();
    this.move();
  } 
  void move() {
    velocity.add(acceleration);   
    location.add(velocity);
    acceleration.mult(0);
  } 
  void display() {
    stroke(0);
    fill(192, 180);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  boolean isInside(Liquid l){
   if (
     location.x>l.x     &&
     location.x<l.x+l.w &&
     location.y>l.y     &&
     location.y<l.y+l.h
     )
     return true;
  else
    return false;
  }
  void applyForce(PVector force){
    // a = f/m
    // Copy of vector used b/c Java ref 
    // would affect original.
       
       PVector f = PVector.div(force, mass);
    // Force acts upon acceleration.
       acceleration.add(f);
  }
  void drag(Liquid l) {
    //float theta  = atan(-velocity.y/velocity.x); // Get angle of vector.
    //float theta2 = theta+HALF_PI; // Perpendicular / phase shift pi/2. 
    float mag = velocity.mag();
    // DRAG
    this.applyForce(
      PVector.mult(velocity, -1).normalize().mult(mag * mag * l.c)
      );
    /* LIFT DRAG
    this.applyForce(
      new PVector(mag * cos(theta2), mag * sin(theta2)).normalize()
    );
    */
    
  }
}
