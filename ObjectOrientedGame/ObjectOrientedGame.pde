float user = 0; //the variable that is used to direct the player around the game

//variables for maze movement
float levelX = 0; //this variable slowly gets more negative to move the maze to the left
float levelSpeed = 1; //how fast the level moves
boolean reset = false; //determines if the level needs to be reset or not

boolean lose = false; //tells the program if the user lost

String winLose; //variable for restart text

boolean hit; //tells the wall collider if the player has hit a wall

//creating objects and arraylists
Player player;

ArrayList <Circle> monsterEffect = new ArrayList <Circle>();
ArrayList <Circle> eyes = new ArrayList <Circle>();
ArrayList <Wall> walls = new ArrayList <Wall>(); //arraylist to store the maze walls and layout

void setup () {
  size (600, 600);
  textAlign(CENTER);
  
  rectMode (CORNERS);
  ellipseMode (CENTER);
  
  player = new Player();
  
  //adding data for each wall into ArrayList
  //this has to be done manually since all the walls have different values
  walls.add (new Wall (500, 0, 1000, 100));
  walls.add (new Wall (500, 250, 800, 400));
  walls.add (new Wall (650, 400, 800, 600));
  walls.add (new Wall (1000, 0, 1200, 400));
  walls.add (new Wall (1400, 0, 2000, 100));
  walls.add (new Wall (1400, 200, 2000, 300));
  walls.add (new Wall (1400, 500, 2000, 600));
  walls.add (new Wall (2000, 200, 2100, 600));
  walls.add (new Wall (2200, 0, 2300, 150));
  walls.add (new Wall (2200, 300, 2300, 600));
  walls.add (new Wall (2400, 0, 2500, 400));
  walls.add (new Wall (2400, 550, 2500, 600));
  walls.add (new Wall (2600, 0, 2700, 100));
  walls.add (new Wall (2600, 100, 3000, 200));
  walls.add (new Wall (2600, 300, 2900, 400));
  walls.add (new Wall (2600, 500, 3000, 600));
  walls.add (new Wall (3000, 100, 3100, 250));
  walls.add (new Wall (3200, 0, 3300, 400));
  walls.add (new Wall (2900, 350, 3200, 400));
  
  //circles for display
  for (int a = 0; a < 20; a++) {
    eyes.add (new Circle (random(0, 75), random (0, 600), 15, 15, 222, 59, 0, 100));
  }
  
  for (int b = 0; b < 40; b++) {
    monsterEffect.add (new Circle(random(0, 75), random (0, 600), 10, 10, 139, 55, 24, random (60, 100)));
  }
}


void draw () {
  if (user == 0) { //user changes depending on where the user wants to go in the game
    //calling main menu function
    menu();
  } else if (user == 1) {
    //calling game function
    game();
  } else if (user == 2) {
    //calling restart function
    restart();
  }
}


void mouseClicked () {
  //function for clicking the start button
  if (mouseX >= 240 && mouseX <= 360) { //checks if mouse's X position is on button
    if (mouseY >= 330 && mouseY <= 380) { //checks if mouse's Y position is on button
      if (user == 0) {
        user = 1; //tells draw to call the game function
      }
    }
  }
  
  if (user == 2) {
    if (mouseX >= 100 && mouseX <= 250) {
      if (mouseY >= 300 && mouseY <= 400) {
        user = 1; //tells the game to call the game function in draw
        reset = true;
        lose = false;
      }
    }
    
    if (mouseX >= 350 && mouseX <= 500) {
      if (mouseY >= 300 && mouseY <= 400) {
        user = 0; //tells the game to call the menu function in draw
        reset = true;
        lose = false;
      }
    }
  }
}//mouseClicked end


void keyPressed () {
  if (key == 'w') { //checks if the player is pressing a movement key, and sends it to the object (repeated for all directions)
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
  if (key == 'w') { //tells the object the player is no longer pressing the movement key (repeated for all directions)
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
  
  //displaying title text
  textSize(80);
  fill(188, 104, 0);
  text("Can't Turn Back", 300, 200);
  
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
  
  //displaying start button symbol
  fill(255);
  triangle (280, 335, 280, 375, 320, 355);
}//menu end


void game () {
  background (255, 238, 139);
  
  if (reset == true) {
    for (int a = 0; a < 17; a++) {
      walls.get(a).reset(); //resets the level position whenever the game function is called
    }
    levelX = 0; //resets end position
    player.move(); //calls the move function which restarts the location
    reset = false;
  }
  
  if (levelX < -3400) {//makes the level stop moving at the end
    user = 2; //sends the user to the restart function through draw, but with the win conditions
  }
  
  //displays and moves walls
  for (int a = 0; a < 19; a++) {
    walls.get(a).display();
    walls.get(a).move();
    
    //checks if the player is within the bounderies of a wall
    hit = walls.get(a).collision(player);
  
    if (hit == true) { //tells the wall collision that the player is in a wall
      player.collision(walls.get(a));
      hit = false;
    }
  }
  
  levelX = levelX - levelSpeed; //adds the level speed to move the level
  
  //creating display for finish
  fill (87, 209, 40);
  
  rect (levelX+3400, 0, levelX+4000, 600);
  
  //player object display and movement
  player.move();
  player.display();
  
  //checks if the player as run into the monster
  player.checkLose();
  
  //displaying monster
  fill(0);
  
  ellipse (0, 100, 200, 200);
  ellipse (50, 0, 100, 100);
  ellipse (50, 150, 100, 100);
  ellipse (0, 300, 250, 250);
  ellipse (25, 400, 150, 150);
  ellipse (-25, 500, 200, 200);
  ellipse (50, 600, 100, 100);
  
  triangle (0, 0, 150, 100, 0, 125);
  triangle (0, 75, 125, 140, 0, 150);
  triangle (0, 200, 150, 240, 0, 275);
  triangle (0, 310, 140, 350, 0, 385);
  triangle (0, 450, 120, 490, 0, 510);
  triangle (0, 540, 110, 575, 0, 600);
  
  //drawing monster effects
  if (frameCount %150 == 0 || frameCount %100 == 1 || frameCount %100 == 3 || frameCount %100 == 4) { //making the effects flicker every few frames for 4 frames
    for (int c = 0; c < 40; c++) {
      Circle m = monsterEffect.get(c);
      m.flicker();
    }  
  } else {
    for (int d = 0; d < 40; d++) { //no transparency effects for the remainder of frames
      Circle m = monsterEffect.get(d);
      m.display();
    }
  }
  
  //drawing eye array list
  for (int f = 0; f < 20; f++) {
    Circle e = eyes.get(f);
    e.displayEyes();
  }  
  
  //adding lose condition
  if (lose == true) {
    user = 2; //tells the draw function to call the restart function
  }
  
}//game end


void restart () {
  if (lose == true) { //changes based on if the user is in this menu because they won or lost
    fill (216, 76, 37); //lost
    winLose = "Game Over!";
  } else {
    fill (111, 242, 37); //wins
    winLose = "You Win!";
  }
  rect (0, 0, 600, 600);
  
  //displaying text
  textSize(100);
  fill(255);
  text(winLose, 300, 200);
  
  //displaying restart button
  if (mouseX <= 250 && mouseX >= 100) { //check if the user's mouse is hovering over the button, and if so makes the button lighter
    if (mouseY <= 400 && mouseY >= 300) {
      fill (100);
      rect (100, 300, 250, 400);
    } else {
      fill (0);
      rect (100, 300, 250, 400);
    }
  } else {
    fill (0);
    rect (100, 300, 250, 400);
  }
  
  //drawing main menu button
  if (mouseX <= 500 && mouseX >= 300) {
    if (mouseY <= 400 && mouseY >= 300) {
      fill (100);
      rect (350, 300, 500, 400);
    } else {
      fill (0);
      rect (350, 300, 500, 400);
    }
  } else {
    fill (0);
    rect (350, 300, 500, 400);
  }
  
  //main menu symbol
  fill (255);
  noStroke();
  
  rect (380, 320, 470, 335);
  rect (380, 345, 470, 360);
  rect (380, 370, 470, 385);
  
  //restart symbol
  ellipse (175, 350, 70, 70);
  
  if (mouseX <= 250 && mouseX >= 100) { //checks user's mouse location to gray out button
    if (mouseY <= 400 && mouseY >= 300) {
      fill (100);
      ellipse (175, 350, 50, 50);
      rect (160, 300, 190, 330);
    } else {
      fill (0);
      ellipse (175, 350, 50, 50);
      rect (160, 300, 190, 330);
    }
  } else {
    fill (0);
    ellipse (175, 350, 50, 50);
    rect (160, 300, 190, 330);
  }
  
  fill (255);
  triangle (160, 305, 160, 350, 185, 322.5);
  
  stroke(0);
}
