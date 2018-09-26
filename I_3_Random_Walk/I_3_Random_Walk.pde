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
    float num = random(1);
    
    if (num < 0.4) { // 40% chance of moving right
      x++;
    } else if (num < 0.6) { // 20% chance left
      x--;
    } else if (num < 0.8) { // 20% up
      y++;
    } else { // 20% up
      y--;
    }
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
