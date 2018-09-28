import java.util.Random;

Mover[] movers = new Mover[25];

PVector gravity, wind, mouse;
float dwindx, dwindy;
int timer;
boolean click;

void setup() {
  frameRate(60);
  size(640,480);
  background(255);
  for (int i=0; i<movers.length; i++)
    movers[i] = new Mover(random(0.1, 5), 0, 0);
  gravity = new PVector(0,     0.098);
  wind    = new PVector(0.001, 0.0001);

  timer  = 0;
  dwindx = 0;
  dwindy = 10000;
  click = false;
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
       PVector.mult(movers[i].velocity, - 1).normalize().mult(0.01));
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

class Mover {
  // Movement
  PVector location, velocity, acceleration;  
 
  float mass;
  
  Mover(float m, float x, float y) {
    location     = new PVector(x, y);
    velocity     = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    //mouseBait = false;   
  }
  
  void update() {     
    this.display();
    this.move();
  }
  void applyForce(PVector force){
    // a = f/m
    // Copy of vector used b/c Java ref 
    // would affect original.
       
       PVector f = PVector.div(force, mass);
    // Force acts upon acceleration.
       acceleration.add(f);
  }
  void move() {
    velocity.add(acceleration);   
    location.add(velocity);
    acceleration.mult(0);
  } 
  void display() {
    stroke(0);
    fill(192, 180);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
}
