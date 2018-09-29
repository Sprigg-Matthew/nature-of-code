
class Liquid {
  float x, y, w, h; 
  float c; // drag coeff
  
  Liquid(float x_, float y_, float w_, float h_, float drag) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = drag;
  }
  void display() {
    noStroke();
    fill(50, 100);
    rect(x, y, w, h);
  }
}
