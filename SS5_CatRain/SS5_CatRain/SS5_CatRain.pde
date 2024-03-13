/*
Name: Steven Taveras
Title: rainy Cat Wonderland
Instructions: Move your mouse to move the snowman.see what he says.

This sketch depicts a cat with a snowman that is going to melt
*/

PImage backgroundImg;
float rainX[], rainY[], rainSpeed[];
int numRain = 200;

//////////////////////////////////////////////////////////////

void setup() {
  size(800, 600);
  backgroundImg = loadImage("cats3.jpg"); 
  
  rainX = new float[numRain]; 
  rainY = new float[numRain]; 
  rainSpeed = new float[numRain]; 
  
  // setup the rain
  for (int i = 0; i < numRain; i++) {
    rainX[i] = random(width); // Random X position
    rainY[i] = random(-height, 0); 
    rainSpeed[i] = random(2, 9); // Random falling speed
  }
}

//////////////////////////////////////////////////////////////

void draw() {
  background(0); // Clear background
  backgroundImg.resize(800, 600); // Resize background image
  image(backgroundImg, 0, 0); 
  
  drawRain();
  
  drawSnowman(mouseX, mouseY);
  
    fill(255);
  if (mouseY < height / 2) 
  {
    text("I'm going to melt...", 20, 40);
    mouseY = height / 4;
  } else 
  {
    text("Stay dry and enjoy the view!", 20, 40);
    mouseY = height / 2;
  }
}

//////////////////////////////////////////////////////////////

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

void mouseMoved() 
{
  // Prevent snowman from going off-screen horizontally
  if (mouseX < 50) 
  {
    mouseX = 50;
  } else if (mouseX > width - 50) 
  {
    mouseX = width - 50;
  }
}
