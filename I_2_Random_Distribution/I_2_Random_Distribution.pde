int[] randomCounts; // array to keep track of how often random numbers are picked.

void setup() {
  size (640, 240);
  randomCounts = new int[20];
}

  void draw() {
    background(255);
    
    int index = int(random(randomCounts.length)); // Random number from 0 to length.
    randomCounts[index]++;
    
    stroke(0); // Black outline.
    fill(175); // Grey filling.
    
    int w = width/randomCounts.length; // Evenly distribute bars.
    
    for (int x = 0; x < randomCounts.length; x++) {
      rect(
        x*w,  // left is spaced in intervals = w
        height-randomCounts[x], // top array entry in pixels from bottom.
        w-1, // 1 pixel space btw histogram bars.
        randomCounts[x] // fill to bottom.
        );
    }
  }
