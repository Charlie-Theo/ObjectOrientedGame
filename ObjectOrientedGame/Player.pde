class Player {
  //PVector variables for movement
  PVector location;
  PVector velocity;
  PVector acceleration;
  
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
    if (up == true) { //only calculates position when a key is pressed by the user (repeated for all directions)
      if (location.y < 600 && location.y > 0) { //checks if the player is at the edge of the screen and if so prevenets movement
        velocity.sub(acceleration); //adds or subtracts acceleration based on direction 
        velocity.limit(5);
        velocity.x = 0; // resets opposite axis to prevent continuous input after releasing key
        
        location.add(velocity);
      } else {
        if (location.y <= 0) {
          location.y = location.y + 2; //bounces player off the screen edge at the top of screen
          velocity.x = 0;
        }
        if (location.y >= 600) {
          location.y = location.y - 2; //bounces player off the screen edge at the bottom of screen
          velocity.x = 0;
        }
      }
    }
    
    if (down == true) {
      if (location.y < 600 && location.y > 0) {
        velocity.add(acceleration);
        velocity.limit(5);
        velocity.x = 0;
        
        location.add(velocity);
      } else {
        if (location.y <= 0) {
          location.y = location.y + 2;
          velocity.x = 0;
        }
        if (location.y >= 600) {
          location.y = location.y - 2;
          velocity.x = 0;
        }
      }
    }
    
    if (left == true) {
      if (location.x < 600 && location.x > 0) {
        velocity.sub(acceleration);
        velocity.limit(5);
        velocity.y = 0;
        
        location.add(velocity);
      } else {
        if (location.x <= 0) {
          location.x = location.x + 2; //bounces player off the screen edge at the left of screen
          velocity.y = 0;
        }
        if (location.x >= 600) {
          location.x = location.x - 2; //bounces player off the screen edge at the right of screen
          velocity.y = 0;
        }
      }
    }
    
    if (right == true) {
      if (location.x < 600 && location.x > 0) {
        velocity.add(acceleration);
        velocity.limit(5);
        velocity.y = 0;
        
        location.add(velocity);
      } else {
        if (location.x <= 0) {
          location.x = location.x + 2; 
          velocity.y = 0;
        }
        if (location.x >= 600) {
          location.x = location.x - 2; 
          velocity.y = 0;
        }
      }
    }
    
    if (reset == true) { //resets player location when restarting the game
      location.x = 250;
      location.y = 300;
    }
  }
  
  
  void checkLose () {
    if (location.x < 100) { //checks if the player's x location is within the monster's zone
      lose = true;
    }
  }
  
  
  void collision (Wall wall) {
    if (location.x < wall.wallX2) {
      location.x -= velocity.x;
    }
    if (location.x > wall.wallX) {
      location.x += velocity.x;
    }
    if (location.y < wall.wallY2) {
      location.y -= velocity.y;
    }
    if (location.y < wall.wallY) {
      location.y += velocity.y;
    }
  }
  
  
  void display () {
    
    strokeWeight (3);
    line (location.x-10, location.y+20, location.x-10, location.y+30);
    line (location.x+10, location.y+20, location.x+10, location.y+30);
    strokeWeight (1);
    
    fill (0, 255, 255);
    triangle (location.x-30, location.y+20, location.x+30, location.y+20, location.x, location.y-30);
    
    fill(0);
    ellipse (location.x-10, location.y, 5, 10);
    ellipse (location.x+10, location.y, 5, 10);
  }
}
