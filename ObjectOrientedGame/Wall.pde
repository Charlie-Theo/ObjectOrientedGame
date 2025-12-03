class Wall {
  float wallX;
  float wallY;
  float wallX2;
  float wallY2;
  
  Wall (float _x, float _y, float _x_, float _y_) {
    wallX = _x;
    wallY = _y;
    wallX2 = _x_;
    wallY2 = _y_;
  }
  
  void display () {
    fill (201, 151, 51);
    
    rect (wallX, wallY, wallX2, wallY2);
  }
  
  void collision () {
    
    
  }
}
