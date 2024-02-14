// Position of the moon
int moonX; 
int moonY;

// Flag to track mouse press
boolean mousePressedFlag = false;

void setup() {
  size(800, 600);
  moonX = width / 2;
  moonY = height / 3;
}

void draw() {
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

void mousePressed() {
  // Toggle mousePressedFlag to the opposite of what it currently is
  mousePressedFlag = !mousePressedFlag;
}

//The mouseMoved() function is called every time the mouse moves and a mouse button is not pressed.
void mouseMoved() {
  // Move the moon based on mouse position
  moonX = mouseX;
  moonY = mouseY;
}
