
void setup() {
  size(1020, 720);
  background(255);
}

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float red   = random(255);
      float green = random(255);
      float blue  = random(255);
        pixels[x+y*width] = color(red, green, blue);
    }
  }
  updatePixels();
}
