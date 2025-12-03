class Player {
  //PVector variables for movement
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  //constructer
  Player () {
    location = new PVector (250, 250);
    velocity = new PVector (0, 0);
    
    acceleration = new PVector (-0.0001, 0.001);
  }
  
  
  void update () {
    //updating position using velocity and acceleration
    velocity.add(acceleration);
    velocity.limit(5);
    
    location.add(velocity);
  }
  
  
  void display () {
    ellipse (location.x, location.y, 40, 40);
  }
}
