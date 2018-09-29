class Mover {
  // Movement
  PVector location, velocity, acceleration;
  float topspeed;  
  int timer; // Update once a cyc;le.
  
  boolean mouseBait;
  
  Splatter brush;  
    
  Mover() {
    location = new PVector(random(width), 0);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    acceleration = PVector.random2D();
    topspeed = 10; // Limit velocity to magnitude 10.
    
    timer = 0;  
    mouseBait = false;
    brush = new Splatter();
    
    brush.setColor(
      int(random(255)),
      int(random(255)),
      int(random(255)),
      255
      );
  }
  
  void update() { 
    this.display();
    this.move();
  
    if (timer == 3) {
      brush.changeAll();
      timer = 0;
    }
    else
      timer++;
  }
  
  void move() {
    
    if (mouseBait)
      this.moveTowardsMouse();
    else
      acceleration = PVector.random2D();
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    this.checkEdges();
  }
  void moveTowardsMouse(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir   = PVector.sub(mouse, location);
    float mag = dir.mag();
    
    dir.normalize();
    dir.mult(0.5);
    dir.limit(10);
    acceleration = dir; 
  }
  void checkEdges(){
    if ((location.x >= width)  || (location.x <= 0 )) {
      velocity.x *= -1;
      brush.changeAll();
    }
    if ((location.y >= height) || (location.y <= 0))  {
      velocity.y *= -1;
      brush.changeAll();
    }
  }

  
  void display() {
    brush.splatter(
      int(location.x),
      int(location.y)
      );
    // Change color every 0.1 seconds.     
  }
}
