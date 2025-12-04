class Wall {
  float wallX;
  float wallY;
  float wallX2;
  float wallY2;
  
  float levelSpeed = 1; //how fast the level moves
  float levelX = 0; //this variable slowly gets more negative to move the maze to the left
  
  boolean hit; //tells main if the player has hit a wall
  
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
    if (player.location.x < levelX+wallX2 && player.location.x > levelX+wallX) { //checks if the player location is within the x and y paramaters of each wall
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
  
  void reset () { //resets the wall positions
    levelX = 0;
  }
}
