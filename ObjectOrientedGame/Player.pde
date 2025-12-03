class Player {
  //PVector variables for movement
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float xV;
  float yV;
  float xL;
  float yL;
  
  //boolean variables for movement
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  
  //constructer
  Player () {
    location = new PVector (250, 300);
    velocity = new PVector (0, 0);
    
    acceleration = new PVector (0.1, 0.1);
  }
  
  
  void move () {
    if (up == true) {
      velocity.sub(acceleration);
      velocity.limit(5);
      velocity.x = 0;
      
      location.add(velocity);
    }
    
    if (down == true) {
      velocity.add(acceleration);
      velocity.limit(5);
      velocity.x = 0;
      
      location.add(velocity);
    }
    
    if (left == true) {
      velocity.sub(acceleration);
      velocity.limit(5);
      velocity.y = 0;
      
      location.add(velocity);
    }
    
    if (right == true) {
      velocity.add(acceleration);
      velocity.limit(5);
      velocity.y = 0;
      
      location.add(velocity);
    }
  }
  
  
  void display () {
    ellipse (location.x, location.y, 40, 40);
  }
}
