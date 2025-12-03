float user = 0; //the variable that is used to direct the player around the game

//variables for maze movement
float levelX = 0; //this variable slowly gets more negative to move the maze to the left
float levelSpeed = 1; //how fast the level moves
boolean reset = false; //determines if the level needs to be reset or not

//variables that change based on movement direction from player
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

//creating objects
Player player;

void setup () {
  size (600, 600);
  
  rectMode (CORNERS);
  ellipseMode (CENTER);
  
  player = new Player();
}


void draw () {
  if (user == 0) { //user changes depending on where the user wants to go in the game
    //calling main menu function
    menu();
  } else if (user == 1) {
    //calling game function
    game();
  }
}


void mouseClicked () {
  //function for clicking the start button
  if (mouseX >= 240 && mouseX <= 360) { //checks if mouse's X position is on button
    if (mouseY >= 330 && mouseY <= 380) { //checks if mouse's Y position is on button
      user = 1; //tells draw to call the game function
    }
  }
}//mouseClicked end


void keyPressed () {
  if (key == 'w') {
    player.up = true;
  }
  
  if (key == 's') {
    player.down = true;
  }
  
  if (key == 'a') {
    player.left = true;
  }
  
  if (key == 'd') {
    player.right = true;
  }
}


void keyReleased () {
  if (key == 'w') {
    player.up = false;
  }
  
  if (key == 's') {
    player.down = false;
  }
  
  if (key == 'a') {
    player.left = false;
  }
  
  if (key == 'd') {
    player.right = false;
  }
}


void menu () {
  background (255, 238, 139);
  
  //drawing start button
  fill (188, 85, 0);
  rect (240, 330, 360, 380);
  
  //making start button lighter when mouse is over
  if (mouseX >= 240 && mouseX <= 360) { //checks if mouse's X position is on button
    if (mouseY >= 330 && mouseY <= 380) { //checks if mouse's Y position is on button
      //drawing start button
      fill (216, 108, 20);
      rect (240, 330, 360, 380);
    }
  }
}//menu end


void game () {
  background (255, 238, 139);
  
  if (reset == true) {
    levelX = 0; //resets the level position whenever the game function is called
  }
  
  if (levelX%1500 == 0) {
    levelSpeed = levelSpeed * 1.3; //increases level speed every 1500 pixels
  }
  
  if (levelX > -3400) {//makes the level stop moving at the end
    //moving level
    levelX = levelX - levelSpeed; //updated the level position every frame based on the set speed
  }
  
  //creating display for maze
  fill (201, 151, 51);
  
  rect (levelX+500, 0, levelX+1000, 100);
  rect (levelX+500, 250, levelX+800, 400);
  rect (levelX+650, 400, levelX+800, 600);
  rect (levelX+1000, 0, levelX+1200, 400);
  rect (levelX+1400, 0, levelX+2000, 100);
  rect (levelX+1400, 200, levelX+2000, 300);
  rect (levelX+1400, 500, levelX+2000, 600);
  rect (levelX+2000, 200, levelX+2100, 600);
  rect (levelX+2200, 0, levelX+2300, 150);
  rect (levelX+2200, 300, levelX+2300, 600);
  rect (levelX+2400, 0, levelX+2500, 400);
  rect (levelX+2400, 550, levelX+2500, 600);
  rect (levelX+2600, 0, levelX+2700, 100);
  rect (levelX+2600, 100, levelX+3000, 200);
  rect (levelX+2600, 300, levelX+2900, 400);
  rect (levelX+2600, 500, levelX+3000, 600);
  rect (levelX+3000, 100, levelX+3100, 250);
  rect (levelX+3200, 0, levelX+3300, 400);
  rect (levelX+2900, 350, levelX+3200, 400);
  
  //creating display for finish
  fill (87, 209, 40);
  
  rect (levelX+3400, 0, levelX+4000, 600);
  
  //player movement
  player.move();
  player.display();
}//game end
