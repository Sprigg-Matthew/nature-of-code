class Walker {
  int x;
  int y;
  
  Walker() { // Constructor
  x = width/2;
  y = height/2;
  
  }
  
  void display() {
    stroke(0);
    point(x, y);
  }
  
  void step() {
    x += int(random(3))-1;
    y += int(random(3))-1;
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
