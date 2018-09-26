import static util.Random

Random generator;

void setup() {
  size(640,360);
  generator = new Random(); 
}

void draw() {
  float num = (float) generator.nextGaussian();
}
