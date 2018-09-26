float xoff = 0.0;
float yoff = 0.0;
int seed;

void setup() {
  size(1020, 720);
  background(255);
  frameRate(30);
  noiseDetail(8, 0.55);
  seed = 0;
}

void draw() {
  noiseSeed(seed++);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff,yoff), 0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff+=0.001;
    }
    xoff+=0.001;
  }
  updatePixels();
  //noLoop();
}
