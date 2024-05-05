/*
Name: Steven taveras
Title: Winter Cityscape Arduino
Instructions: Move your mouse to interact with the scene.

This sketch depicts a winter cityscape with falling snow and a responsive moon.
*/

PImage cityImage;
PFont font;

float moonX;
float moonY;
// these will store the random snow effect
float snowX[], snowY[], snowSpeed[];

void setup() {
  size(800, 600);
  // Load cityscape image
  cityImage = loadImage("wintercity.jpg");
  // create the font and load it to use
  font = createFont("Arial", 24);
  textFont(font);
  
  // moon variables for if/else statement
  moonX = width / 2;
  moonY = height / 4;
  
  // creates floating points in an array set to from 0-199
  snowX = new float[200];
  snowY = new float[200];
  snowSpeed = new float[200];
  
  // Initialize snowflakes
  for (int i = 0; i < snowX.length; i++) {
    snowX[i] = random(width);
    snowY[i] = random(height);
    snowSpeed[i] = random(1, 3);
  }
}

void draw() {
  background(0);
  
  // cityscape image
  //image(cityImage, 0, 0, width, height);
  
  // moon
  fill(255);
  ellipse(moonX, moonY, 100, 100);
  
  // falling snow
  for (int i = 0; i < snowX.length; i++) {
    fill(255);
    ellipse(snowX[i], snowY[i], 10, 10);
    snowY[i] += snowSpeed[i];
    
    // Reset snowflake if it goes below the screen
    if (snowY[i] > height) {
      snowY[i] = 0;
      snowX[i] = random(width);
    }
  }
  
  // Display text based on moon position
  // Set text color to black
  fill(0);
  if (mouseY < height / 2) {
    text("It's a cold winter night...", 20, 40);
    moonY = height / 4;
  } else {
    text("Stay warm and enjoy the view!", 20, 40);
    moonY = height / 2;
  }
}

void mouseMoved() {
  // Move the moon horizontally based on mouse position
  moonX = mouseX;
}
