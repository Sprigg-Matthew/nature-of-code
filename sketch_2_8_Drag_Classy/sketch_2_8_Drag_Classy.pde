import java.util.Random;
//import forces;

Drag air_resistance;

Mover[] movers = new Mover[25];

PVector gravity, wind, mouse;
float dwindx, dwindy;
int timer;
boolean click;

void setup() {
  // Screen Setup
  frameRate(60);
  size(640,480);
  background(255);
  
  // Forces
  air_resistance = new Drag(1, 0.5);
  gravity = new PVector(0,     0.098);
  wind    = new PVector(0.001, 0.0001);

  timer  = 0;
  dwindx = 0;
  dwindy = 10000;
  click = false;
  
  for (int i=0; i<movers.length; i++)
    movers[i] = new Mover(random(0.1, 5), 0, 0);

}

void draw() {
  background(255);
  
  if (timer == 150){
     wind = new PVector(
       map(noise(dwindx), 0, 1, -0.1,  0.1 ),
       map(noise(dwindy), 0, 1, -0.01, 0.1 )
       );
     timer = 0;
     dwindx+=0.5;
     dwindy+=0.5;
  }
  timer++;
  
  for (int i = 0; i < movers.length; i++){
    if (click) {
      movers[i].location.set(new PVector(mouseX, mouseY));
      movers[i].velocity.set(new PVector(     0,      0));
      /*
      movers[i].applyForce(
        PVector.sub( 
          movers[i].location ,
          new PVector(mouseX, mouseY)).normalize().mult(-0.01)
       );
       */
    }
       
     if (movers[i].location.x < 0     ||
         movers[i].location.x > width ||
         movers[i].location.y < 0     ||
         movers[i].location.y > height
         )
         movers[i].applyForce(
           PVector.mult(movers[i].velocity, -2).mult(movers[i].mass));
     
     movers[i].applyForce(
       air_resistance.get(movers[i].velocity)
       );
     movers[i].applyForce(PVector.mult(gravity, movers[i].mass));
     movers[i].applyForce(wind);
     movers[i].update();
     }
  }

void mousePressed(){
  click = true;
}
void mouseReleased(){
  click = false;
}
