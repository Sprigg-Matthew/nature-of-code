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
    
    if (num < 0.5) { // 50% chance of moving towards mouse
      if (mouseX > x) { 
        x++;
      }
      else if (mouseX < x) {
        x--;
      }
      // implied else mouseX == x do nothing.
      
      if (mouseY > y) {
        y++;
      }
      else if (mouseY < y) {
        y--;
      }
      // implied else mouseY == y do nothing
    } else if (num < 0.625) {
      x++;
    }
    else if (num < 0.75) { // 20% chance left
      x--;
    } else if (num < 0.875) { // 20% up
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
