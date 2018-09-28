//import processing.core.PVector;
//import processing.core.PGraphics;
//import processing.core.PApplet;

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
  
  void update() {     
    this.display();
    this.move();
  }
  void applyForce(PVector force){
    // a = f/m
    // Copy of vector used b/c Java ref 
    // would affect original.
       
       PVector f = PVector.div(force, mass);
    // Force acts upon acceleration.
       acceleration.add(f);
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
}
