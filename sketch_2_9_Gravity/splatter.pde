import java.util.Random;

class Splatter {
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
