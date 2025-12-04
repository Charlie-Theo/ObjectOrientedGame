class Wall {
  float wallX;
  float wallY;
  float wallX2;
  float wallY2;
  
  float levelSpeed = 1;
  float levelX = 0;
  
  boolean hit;
  
  Wall (float _x, float _y, float _x_, float _y_) {
    wallX = _x;
    wallY = _y;
    wallX2 = _x_;
    wallY2 = _y_;
  }
  
  void display () {
    fill (201, 151, 51);
    
    rect (levelX+wallX, wallY, levelX+wallX2, wallY2);
  }
  
  void move () {
    levelX = levelX - levelSpeed;
  }
  
  boolean collision (Player player) {
    if (player.location.x < levelX+wallX2 && player.location.x > levelX+wallX) {
      if (player.location.y < wallY2 && player.location.y > wallY) {
        hit = true;
      } else {
        hit = false;
      }
    } else {
      hit = false;
    }
    
    return hit;
  }
  
  void reset () {
    levelX = 0;
  }
}
