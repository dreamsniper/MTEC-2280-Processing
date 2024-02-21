/*
Steven Taveras
Title: Sunset Silhouette
Instructions: Move your mouse to change the color of the sun!

This sketch depicts a sunset scene with a changing sun color as you move the mouse 
and a mouseover effect when you mouseover the trees. The Background gradients were tough to make.
*/

float sunColorR, sunColorG, sunColorB;
float cloudX = 0; // Initial position of the clouds

void setup() {
  size(800, 600);
  sunColorR = 255;
  sunColorG = 150;
  sunColorB = 255;
  noStroke();
}

void draw() {
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
}

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

void mouseMoved() {
  sunColorR = mouseX / 2;
  sunColorB = 255 - mouseY / 2;
}
