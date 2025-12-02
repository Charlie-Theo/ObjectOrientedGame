class Player {
  //PVector variables for movement
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  int direction; //variable to determine direction
  
  //constructer
  Player (float x, float y) {
    position = new PVector (x, y);
  }
}
