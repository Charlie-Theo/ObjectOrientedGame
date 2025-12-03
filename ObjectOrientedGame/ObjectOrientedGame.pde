float user = 0; //the variable that is used to direct the player around the game

//variables for maze movement
float levelX = 0; //this variable slowly gets more negative to move the maze to the left
float levelSpeed = 1; //how fast the level moves
boolean reset = false; //determines if the level needs to be reset or not

void setup () {
  size (600, 600);
  
  rectMode (CORNERS);
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
  
  //moving level
  levelX = levelX - levelSpeed; //updated the level position every frame based on the set speed
  
  //creating display for maze
  fill (201, 151, 51);
  
  rect (levelX+400, 0, levelX+1000, 100);
  rect (levelX+400, 250, levelX+800, 400);
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
  
}//game end
