class Circle {
  float x;
  float y;
  float h;
  float w;
  float r;
  float g;
  float b;
  float trans;
  
  Circle (float _x, float _y, float _h, float _w, float _r, float _g, float _b, float t) {
    x = _x;
    y = _y;
    h = _h;
    w = _w;
    
    r = _r;
    g = _g;
    b = _b;
    
    trans = t;
  }
  
  
  void display () {
    noStroke();
    fill (r, g, b);
    
    ellipse (x, y, h, w);
    stroke(0);
  }
  
  
  void flicker () {
    noStroke();
    fill (r, g, b, trans);
    
    ellipse (x, y, h, w);
    stroke(0);
  }
  
  
  void displayEyes () { //adds an extra ellipse from display for specifically eyes
    noStroke();
    fill (r, g, b);
    
    ellipse (x, y, h, w);
    
    fill (255);
    ellipse (x, y, h-5, w-5);
    
    fill (0);
    ellipse (x, y, h-12, w-12);
    stroke(0);
  }
}
