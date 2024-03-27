/*
Name: Steven Taveras
Title: Final_Midterm
Instructions: Move your mouse over the screen and click on an art piece to view it.
*/

String state = "pregame"; // Storing our states as Strings 
float sunColorR, sunColorG, sunColorB;
float cloudX = 0; // Initial position of the clouds
PImage backgroundImg;
float rainX[], rainY[], rainSpeed[];
int numRain = 200;
// Position of the moon
int moonX; 
int moonY;
// Flag to track mouse press
boolean mousePressedFlag = false;



void setup() {
  size (800, 800);
  sunColorR = 255;
  sunColorG = 150;
  sunColorB = 255;
  backgroundImg = loadImage("cats3.jpg"); 
  backgroundImg.resize(800, 800); // Resize background image
  
  rainX = new float[numRain]; 
  rainY = new float[numRain]; 
  rainSpeed = new float[numRain]; 
  
  // setup the rain
  for (int i = 0; i < numRain; i++) {
    rainX[i] = random(width); // Random X position
    rainY[i] = random(-height, 0); 
    rainSpeed[i] = random(2, 9); // Random falling speed
  }
  
  moonX = width / 2;
  moonY = height / 3;
  
  textAlign(CENTER);
  textSize(25);
}

////////////////////////////////////////////////////////////

void draw() {
  if (state == "pregame") {
    pregame();
  } else if (state == "game") {
    game();
  } else if (state == "game over") {
    gameover();
  } else if (state == "sketch one") {
    sketchOne();
  } else if (state == "sketch two") {
    sketchTwo();
  } else if (state == "sketch three") {
    sketchThree();
  } else if (state == "sketch five") {
    sketchFive();
  }
  
  //println(state);
}


////////////////////////////////////////////////////////////

void pregame() {
  background(255);
  fill(0);
  text("Welcome to my Processing Gallery", width/2, height/2);
  text("click to view pieces", width/2, height/1.5);
}

////////////////////////////////////////////////////////////

void game() {
  background(200);
  
  // Display score
  fill(0);
  text("Stevens Processing sketch gallery", width/2, 50);
  
   if (mouseX <= width/2 && mouseY <= height/2 && mouseX >= 0 && mouseY >=0) {
    fill(255,0,0);
    rect(0, 0, width/2, height/2);
    fill(0);
    text("Sketch 1", width/4, height/4);
    //sketchOne();
  } else if(mouseX >= width/2 && mouseY <= height/2 && mouseX <= width && mouseY >=0){
    fill(0,0,255);
    rect(width/2, 0, width/2, height/2);
    fill(0);
    text("Sketch 2", width/1.5, height/4);
    //sketchTwo();
  } else if(mouseY >= height/2 && mouseX <= width/2 && mouseY <= height && mouseX <= height) {
    fill(0,255,0);
    rect(0, height/2, width/2, height/2);
    fill(0);
    text("Sketch 3", width/4, height/1.5);
    //sketchThree();
  } else if(mouseY >= height/2 && mouseX >= height/2 && mouseX <= width && mouseY <= height) {
    fill(127, 0, 127);
    rect(width/2, height/2, width/2, height/2);
    fill(0);
    text("Sketch 5", width/1.5, height/1.5);
    //sketchFive();
  }
  
}

////////////////////////////////////////////////////////////

void gameover() {
  background(255, 0, 0);
  fill(0);
  text("Thanks for visiting", width/2, height/2);
  text("click to see more.", width/2, height/2 + 50);
 
}

////////////////////////////////////////////////////////////

void sketchOne(){
    //stroke(255);
   
   //moon
   fill(255,255,255);
   ellipse(224, 184, 220, 220);
   
   //silhouette of buildings
   fill(80,80,80);
   rect(0, 550, 520, 720);
   rect(300, 450, 320, 340);
   rect(600, 650, 120, 240);
   rect(800, 300, 300, 440);
   rect(1000, 650, 220, 240);

    fill(0,0,0);
   rect(0, 450, 220, 420);
   rect(200, 500, 220, 240);
   rect(500, 650, 100,150);
   rect(900, 350, 300, 320);
   rect(850, 550, 150, 340);
}

////////////////////////////////////////////////////////////

void sketchTwo(){
  background(0, 10, 50); // Dark blue night sky
  
  // Draw moonlight
  if (mousePressedFlag) {
    fill(146,161,207, 150); // Brightened moonlight
    ellipse(moonX, moonY, 200, 200);
  }
  
  // Draw moon
  fill(255);
  ellipse(moonX, moonY, 100, 100);
  
  // Draw stars
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    stroke(255);
    //draws a point at x and ys location. location is random
    point(x, y);
  }
  
  // Draw buildings
  fill(100); // Gray buildings

  //buildings
  rect(100,height-150, 80,150);
  rect(250,height-200, 100,200);
  rect(400,height - 250, 120,250);
  rect(550,height - 180, 90,180);
  rect(700,height - 220, 110,220);
}
////////////////////////////////////////////////////////////

void sketchThree(){
   // Sky gradient
  background(255, 204, 0);
  for (int y = 0; y < height; y++) {
    float inter = y / float(height);
    float r = (1 - inter) * 255 + inter * 51;
    float g = (1 - inter) * 204 + inter * 102;
    float b = (1 - inter) * 0 + inter * 255;
    stroke(r, g, b);
    line(0, y, width, y);
  }
  // stroke(random(0,255), random(0,255),random(0,255));
  // line(0, random(height), width, random(height));

  // Sun
  int sunColor = color(sunColorR, sunColorG, sunColorB);
  fill(sunColor);
  ellipse(width / 2, height / 3, 200, 200);

  // Clouds
  drawClouds();

  // Silhouettes
  drawSilhouettes();
  
  //used to figure out if mouse was over the tree
  //print(mouseX, mouseY);
}

////////////////////////////////////////////////////////////

void sketchFive(){
  background(0); // Clear background
  //backgroundImg.resize(800, 800); // Resize background image
  image(backgroundImg, 0, 0); 
  
  drawRain();
  
  drawSnowman(mouseX, mouseY);
  
    fill(255);
  if (mouseY < height / 2) 
  {
    text("I'm going to melt...", 50, 40);
    mouseY = height / 4;
  } else 
  {
    text("Stay dry and enjoy the view!", 50, 40);
    mouseY = height / 2;
  }
}

////////////////////////////////////////////////////////////
// Functions for sketch 3
////////////////////////////////////////////////////////////

void drawClouds() {
  fill(255);
  // this moves the clouds forward
  cloudX += 0.5;
  if (cloudX > width + 100) {
    // if cloud moves off-screen reset position back to normal
    cloudX = -100;
  }
  
  //draws the clouds 5 times in a row 200 pixels apart from x position
  for (int i = 0; i < 5; i++) {
    float x = cloudX + i * 200;
    float y = height / 4;
    ellipse(x, y, 80, 50);
    ellipse(x + 30, y - 20, 80, 50);
    ellipse(x + 60, y, 80, 50);
  }
}

void drawSilhouettes() {
  fill(0, 50);
  rect(0, height / 2, width, height / 2);

  // Trees
  for (int x = 100; x < width; x += 150) {
    if (isMouseOverTree(x, height / 2)) {
      drawHighlightedTree(x, height / 2);
    } else {
      drawTree(x, height / 2);
    }
  }
}

void drawTree(int x, int y) {
  fill(0, 102, 0);
  triangle(x, y, x - 30, y - 100, x + 30, y - 100);
  fill(139, 69, 19);
  rect(x - 20, y, 40, 100);
}

void drawHighlightedTree(int x, int y) {
  fill(0, 200, 0);
  triangle(x, y, x - 30, y - 100, x + 30, y - 100);
  fill(139, 69, 19);
  rect(x - 20, y, 40, 100);
  
  // Draw Circle Pattern
  fill(255, 204, 0, 100);
  ellipse(x, y + 120, 100, 100);
}

boolean isMouseOverTree(int x, int y) {
  return mouseX > x - 20 && mouseX < x + 20 && mouseY > y - 100 && mouseY < y;
}

////////////////////////////////////////////////////////////
// Sketch 5 Functions
////////////////////////////////////////////////////////////

// Function to draw rain
void drawRain() {
  stroke(150, 150, 255); // Set rain color
  strokeWeight(2);
  for (int i = 0; i < numRain; i++) {
    line(rainX[i], rainY[i], rainX[i], rainY[i]+10); // Draw rain
    rainY[i] += rainSpeed[i]; // Move rain downwards
    
    // Reset snowflake if it goes below the screen
    if (rainY[i] > height) 
    {
      rainY[i] = random(-height, 0); // Reset Y position above the window
      rainX[i] = random(width); // Randomize X position
    }
  }
}

// Function to draw snowman
void drawSnowman(float x, float y) 
{
  fill(255); // Set snowman color
  
  // body
  ellipse(x, y, 100, 100);
  ellipse(x, y - 80, 70, 70); 
  ellipse(x, y - 140, 50, 50); 
  
  // face
  fill(0); 
  ellipse(x - 20, y - 155, 10, 10); 
  ellipse(x + 20, y - 155, 10, 10); 
  arc(x, y - 140, 30, 30, 0, PI); 
  
  // hat
  fill(0); 
  rect(x - 30, y - 180, 60, 20); 
  rect(x - 15, y - 220, 30, 40); 
}

void mouseMoved() {
  if(state == "sketch three") {
     sunColorR = mouseX / 2;
    sunColorB = 255 - mouseY / 2;
  } 
  else if (state == "state five") {
    // Prevent snowman from going off-screen horizontally
    if (mouseX < 50) 
    {
      mouseX = 50;
    } 
    else if (mouseX > width - 50) 
    {
      mouseX = width - 50;
    }
  }
  else if (state == "state two") {
    // Move the moon based on mouse position
    moonX = mouseX;
    moonY = mouseY;
  }
}

////////////////////////////////////////////////////////////
// Shared Functions
////////////////////////////////////////////////////////////


void mousePressed() {
  if (state == "pregame") {
    state = "game";
  } else if (state == "game over") {
    state = "pregame";
  } else if (state == "game") {
    if (mouseX <= width/2 && mouseY <= height/2) {
      state = "sketch one";
    } else if (mouseX >= width/2 && mouseY <= height/2) {
      state = "sketch two";
    } else if (mouseY >= height/2 && mouseX <= width/2) {
      state = "sketch three";
    } else if (mouseY >= height/2 && mouseX >= width/2) {
      state = "sketch five";
    }
  } else if (state == "sketch one") {
    state = "game over";
  }
  else if (state == "sketch two") {
    state = "game over";
    // Toggle mousePressedFlag to the opposite of what it currently is
    mousePressedFlag = !mousePressedFlag;
    
  } else if (state == "sketch two") {
    // Toggle mousePressedFlag to the opposite of what it currently is
    state = "game over";
  } else if (state == "sketch three") {
    state = "game over";
  } else if (state == "sketch five") {
    state = "game over";
  }
}
