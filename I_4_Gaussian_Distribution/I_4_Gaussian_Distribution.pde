import java.util.Random;

Random generator;

void setup() {
  size(640,360);
  background(230);
  generator = new Random(); 
}

void draw() {
  float num = (float) generator.nextGaussian();
  float sd = 60;
  float mean = 320;

  float x = sd * num + mean; // Multiply by sigma and mu

  noStroke();
  fill(100, 10);
  ellipse(x, 180, 16, 16);
}
