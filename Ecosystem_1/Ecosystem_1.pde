import java.util.Random;

Mover[] movers = new Mover[30];
boolean trail = false;

void setup() {
  size(1020, 720);
  background(255);
  for (int i = 0; i<movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  if (!trail)
    background(255);
  for (int i = 0; i<movers.length; i++){
    movers[i].update();
  }
}

void keyPressed(){
  trail = !trail;
}

void mousePressed(){
   for (int i = 0; i<movers.length; i++){
     movers[i].mouseBait = true;
   }
}

void mouseReleased(){
    for (int i = 0; i<movers.length; i++){
     movers[i].mouseBait = false;
   }
}
