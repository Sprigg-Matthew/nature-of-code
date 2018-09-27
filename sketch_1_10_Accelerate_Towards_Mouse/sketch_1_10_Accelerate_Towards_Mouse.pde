import java.util.Random;

Ball ball;
boolean rec;

void setup() {
  size(640, 480);
  background(255);
  ball = new Ball();
  rec = false;
}

void draw() {
    if (rec) {
      saveFrame("frames/####.tif");  
    }
    ball.update();
    
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    rec = !rec;
  }
}

class Ball {
  // Movement
  PVector location, velocity, acceleration;
  float topspeed;  
    
  // Color & Color Change 
  int    r,  g,  b;
  float tr, tg, tb;
  int timer; // Update once a cycle.
  
  Paint brush;
    
    
  Ball() {
    location = new PVector(random(width), 0);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    acceleration = PVector.random2D();
    topspeed = 10; // Limit velocity to magnitude 10.
    
    timer = 0;
       
    tr = 0;
    tg = 5000.555;
    tb = tg*tg;
    
    this.colorChange();
    
    brush = new Paint(r, g, b, 140);
  }
  
  void update() { 
    this.display();
    this.move();
  
    if (timer == 3) {
      this.colorChange();
      brush.setColor(r, g, b, 140);
      brush.setSplatter(
        int(map(noise(tr*tg), 0, 1, 1, 100)),
        int(map(noise(tg*tb), 0, 1, 10, 150))
      );
      timer = 0;
    }
    timer++;
  }
  
  void move() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir   = PVector.sub(mouse, location);
    
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    
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

  
  void display() {
    brush.splatter(
      int(location.x),
      int(location.y)
      );
    // Change color every 0.1 seconds.
        
  }
  
  void colorChange() {
    r = int(map(noise(tr), 0, 1, 0, 255));
    g = int(map(noise(tg), 0, 1, 0, 255));
    b = int(map(noise(tb), 0, 1, 0, 255));
    
    tr+=0.1;
    tg+=0.1;
    tb+=0.1;
    
  }
}

class Paint {
  int r,g,b,t; // red, green, blue, transparency.
  
  int d; // Diameter
  int n; // Number of splatter marks.


  Random gen; // Generator

  Paint (int red, int green, int blue, int trans) {
    r = red;
    g = green;
    b = blue;
    t = trans; 
    gen = new Random();
  }
  
  void setColor(int r_, int g_, int b_, int t_) {
    r = r_;
    g = g_;
    b = b_;
    t = t_;
  }
  void setSplatter(int d_, int n_){
    d = d_;
    n = n_;
  }

  void splatter(int d0, int d1) {

    int sd  = 5;
    // Mean is (d0, d1)

    noStroke();
    smooth();
    fill(r, g, b, t);

    for (int i = 0; i < n; i++) {
      float x = (float) gen.nextGaussian();
      float y = (float) gen.nextGaussian();
      ellipse(
        sd*x+d0,
        sd*y+d1,
        5,
        5
      );
    }
  }
}
