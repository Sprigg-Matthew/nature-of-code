Ball ball;

void setup() {
  size(800, 640);
  background(255);
  ball = new Ball();
}

void draw() {
    ball.update();
}

class Ball {
  // Movement
  PVector location, velocity, acceleration;
  float topspeed;  
    
  // Color & Color Change 
  int    r,  g,  b;
  float tr, tg, tb;
  int timer; // Update once a cycle.
    
  Ball() {
    location = new PVector(random(width), 0);
    velocity = new PVector(1,0);
    acceleration = new PVector(0.001, 0.05);
    
    topspeed = 10; // Limit velocity to magnitude 10.
    
    timer = 0;
    
    tr = 0;
    tg = 5000.555;
    tb = tg*tg;
    
    this.colorChange();
  }
  void display() {
    noStroke();
    fill(color(r, g, b));
    ellipse(location.x, location.y, 16,16);
    
    // Change color every five seconds.
    if (timer == 150) {
      this.colorChange();
      timer = 0;
    }
    
  }
  void update() {
    acceleration = PVector.random2D();
    this.display();
    this.move();
    
  }
  void colorChange() {
    r = int(map(noise(tr), 0, 1, 0, 255));
    g = int(map(noise(tg), 0, 1, 0, 255));
    b = int(map(noise(tb), 0, 1, 0, 255));
    
    tr+=0.1;
    tg+=0.1;
    tb+=0.1;
    
  }
  void move() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    if ((location.x > width)  || (location.x < 0 )) {
      velocity.x *= -1;
      this.colorChange();
    }
    if ((location.y > height) || (location.y < 0))  {
      velocity.y *= -1;
      this.colorChange();
    }
  }
}
