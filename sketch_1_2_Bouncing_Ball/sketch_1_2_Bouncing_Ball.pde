class Ball {
  PVector location;
  PVector velocity;
  
  int    r,  g,  b;
  float tr, tg, tb;
    
  Ball(PVector loc, PVector vel) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2) );
        
    tr = 0;
    tg = 5000.555;
    tb = tg*tg;
    
    this.colorChange();
  }
  void display() {
    noStroke();
    fill(color(r, g, b));
    ellipse(location.x, location.y, 16,16);
    
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

Ball ball;

void setup() {
  size(1020, 720);
  frameRate(120);
  background(255);
  ball = new Ball(new PVector(0,0), new PVector(5,10));
}

void draw() {
  ball.display();
  ball.move();
  //println(ball.location);
}
