import java.util.Random;

class Walker {
  float  x,  y;
  float tx, ty;
  Random gen;
  
  
  Walker() { // Constructor
     x = width/2;
     y = height/2;
    tx = 0;
    ty = 10000;
    gen = new Random();
  }
  
  void display() {
    stroke(0);
    fill(192);
    ellipse(x, y, 16, 16);
  }
  
  void step() {
    int stepsize;
    if (gen.nextGaussian() < 0.2) {
      stepsize = 150;
    } else {
      stepsize = 25;
    }
    
    x = map(noise(tx), 0, 1, 0, stepsize);
    y = map(noise(ty), 0, 1, 0, stepsize);
    tx += 0.01;
    ty += 0.01;
  }
}

Walker w;

void setup() {
  size(640,360);
  background(255);
  w = new Walker();
}

void draw() {
  w.display();
  w.step();
}
