import java.util.Random;
Mover[] movers = new Mover[10];

PVector helium, wind;
float dwindx, dwindy;
int timer;

void setup(){
  size(1020, 720);
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(); 
  }
  helium = new PVector(0, -0.001);  // Helium
  wind   = new PVector(0,  0  );  // Wind
}

void draw(){
  background(255);
  if (timer == 15){ // Change Direction of Wind
      wind = new PVector(
        map(noise(dwindx), 0, 1, -0.01,  0.01),
        map(noise(dwindy), 0, 1, -0.001,  0.001)
      );
      dwindx+=0.001;
      dwindy+=0.001;
      timer=0;
  }
   else {
     timer++;
   }
  
  // Apply Forces
  for (int i = 0; i < movers.length; i++){
    movers[i].applyForce(wind);
    movers[i].applyForce(helium);
    movers[i].update();
    }
    println(wind);
  }


public class Mover {
  // Movement
  PVector location, velocity, acceleration;  
  
  float mass;
  
  int timer; // Update once a cycle.
  
  //boolean mouseBait;
  
  Splatter brush;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,1);
    acceleration = new PVector(0,0);
    mass = 0.05;
    
    timer = 0;  
    
    //mouseBait = false;
    brush = new Splatter();
    
    brush.setColor(
      int(random(255)),
      int(random(255)),
      int(random(255)),
      255
      );   
  }
  
  void update() { 
    
    this.display();
    this.move();
  
    if (timer == 3) {
      brush.changeAll();
      timer = 0;
    }
    else
      timer++;
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
    this.checkEdges();
  } 
  
  void checkEdges(){
    if ((location.x >= width)  || (location.x <= 0 )) {
      velocity.x *= -1;
      brush.changeAll();
    }
    if ((location.y >= height) || (location.y <= 0))  {
      velocity.y *= -1;
      brush.changeAll();
    }
  }
  void display() {
    brush.splatter(
      int(location.x),
      int(location.y)
      );
  }
}


public class Splatter {
  int    r,  g,  b,  t; // red, green, blue, transparency.
  float tr, tg, tb, tt; // rate of transition for each variable.
    
  int sizex, sizey;  // Speckle size.
  float tx, ty;      // rate of transition.
  
  int    d; // Diameter
  float td;
  
  int    n; // Number of splatter marks.
  float tn;
  
  float sd; // Standard deviation of distribution of splatter.
  float ts;

 Random gen; // Generator
 
 Splatter () {
    r = g = b = 0;
    tr = 0;
    tg = 5000;
    tb = tg*tg;
    
    t = 255;
    
    sizex = sizey = 5;
    tx = 0.5;
    //ty = 0.1;
    
    d  =  5;
    td =  0.01;
    
    n  = 20;
    tn =  0.5;
    
    sd = 5.0;
    ts = 0.1;   
    gen = new Random();
  }
  
  void splatter(int d0, int d1) {

    int sd  = 5;
    // Mean is (d0, d1)

    noStroke();
    smooth();
    fill(r, g, b, t);

    for (int i = 0; i < n; i++) {
      float x = (float) gen.nextGaussian();
      float y = (float) gen.nextGaussian();
      ellipse(
        sd*x+d+d0,
        sd*y+d+d1,
        sizex,
        sizey
      );
    }
  }
  void setColor(int r_, int g_, int b_, int t_) {
    r = r_;
    g = g_;
    b = b_;
    t = t_;
  } void colorChange() {
    r = int(map(noise(tr), 0, 1, 0, 255));
    g = int(map(noise(tg), 0, 1, 0, 255));
    b = int(map(noise(tb), 0, 1, 0, 255));   
    tr+=0.1;
    tg+=0.1;
    tb+=0.1;   
  }
  
  void setSplatter(int d_, int n_){
    d = d_;
    n = n_;
  } void splatterChange(){
    d = int(map(noise(td), 0, 1, 0, 100));
    n = int(map(noise(tn), 0, 1, 0, 150));
  }
  
  void setDropSize(int sizex_, int sizey_){
    sizex = sizex_;
    sizey = sizey_;
  } void changeDropSize(){
    sizex = sizey = int(map(noise(tx), 0, 1, 0, 10));
    //sizey = int(random(10));
  }
  
  void setSigma(float sd_){
    sd = sd_;
  } void changeSigma(){
    sd = map(noise(ts), 0, 1, 0, 30);
  }
  
  void changeAll(){
    this.colorChange();
    this.splatterChange();
    this.changeDropSize();
    this.changeSigma();
  }
}
