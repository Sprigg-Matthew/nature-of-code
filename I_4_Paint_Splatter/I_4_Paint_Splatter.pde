Paint p;

import java.util.Random;

class Paint {
  int r; // Red
  int g; // Green
  int b; // Blue
  int t; // Transparency
  
  //int d; // Diameter

  Random gen; // Generator

  Paint (int red, int green, int blue, int trans) {
    r = red;
    g = green;
    b = blue;
    t = trans; 
    gen = new Random();
  }

  void splatter(int xm, int ym) {

    int sd  = 5;
    int mean = 0;

    noStroke();
    smooth();
    fill(r, g, b, t);

    for (int i = 0; i < 50; i++) {
      float x = (float) gen.nextGaussian();
      float y = (float) gen.nextGaussian();
      ellipse(
        sd*x+xm+mean,
        sd*y+ym+mean,
        5,
        5
      );
    }
  }
}

void setup() {
  size(800, 640);
  background(255);
  p = new Paint(100, 192, 20, 120);  
}

void draw() {
  
}

void mousePressed() {
  p.splatter(mouseX, mouseY);
}
