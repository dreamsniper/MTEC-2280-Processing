import processing.serial.*;
Serial myPort; // Serial object

int currentStep = 0; // Current step in the pattern
int[] pattern; // Array to store the pattern
int patternLength = 4; //  Initial pattern length
int playerInput[]; // Store player's input
int inputIndex = 0; // Track player input index
int buttonPressed;
boolean gameActive = false; // Track if the game is active


/////////////////////////////////////////////////////////////////

void setup() {
  size(600, 600); // Set canvas size
  background(200); // Set background color
  textAlign(CENTER, CENTER); // Center text
  
  String portName = Serial.list()[0]; // Get first available serial port
  myPort = new Serial(this, portName, 115200); // Initialize serial
  
  startGame(); // Start the game
}

/////////////////////////////////////////////////////////////////

void draw() {
  if (gameActive) {
    background(200);
    text("Follow the pattern!", width / 2, height / 4);
    
    // Check which button was pressed and draw the corresponding colored circle
    switch(buttonPressed) {
      case 0:
        fill(255, 0, 0); // Red
        break;
      case 1:
        fill(0, 255, 0); // Green
        break;
      case 2:
        fill(0, 0, 255); // Blue
        break;
      case 3:
        fill(255, 255, 0); // Yellow
        break;
      default:
        fill(100); // Default color (grey)
    }
    
    // Draw the circle at the center of the window
    ellipse(width / 2, height / 2, 100, 100);
  } else {
    background(255, 0, 0);
    text("Game over! Press any button to restart.", width / 2, height / 2);
  }
}


/////////////////////////////////////////////////////////////////

void serialEvent(Serial myPort) {
  buttonPressed = myPort.read(); // Read the button pressed
  
  
  if (gameActive) {
    playerInput[inputIndex] = buttonPressed; // Store player input
    
    if (playerInput[inputIndex] == pattern[inputIndex]) {
      
      inputIndex++; // Move to next step in the pattern
      
      if (inputIndex == patternLength) { // If the pattern is complete
        patternLength++; // Increase the pattern length
        generatePattern(); // Generate a new pattern
        inputIndex = 0; // Reset player input index
      }
    } else {
      gameActive = false; // Game over if the player makes a mistake
    }
  } else {
    startGame(); // Restart the game on any button press
  }
}

/////////////////////////////////////////////////////////////////

void startGame() {
  gameActive = true; // Activate the game
  patternLength = 4; // Reset pattern length
  generatePattern(); // Generate initial pattern
  playerInput = new int[patternLength]; // Reset player input array
  inputIndex = 0; // Reset input index
}

/////////////////////////////////////////////////////////////////

void generatePattern() {
  pattern = new int[patternLength];
  
  for (int i = 0; i < patternLength; i++) {
    pattern[i] = int(random(4)); // Randomize pattern between 0 and 2
    print(pattern[i] + " | ");
  }
}

/////////////////////////////////////////////////////////////////////

void drawPattern() {
  int circleSize = 50; // Diameter of the circle
  int padding = 20; // Padding between circles
  int startX = (width - (patternLength * (circleSize + padding))) / 2; // Starting X position
  
  for (int i = 0; i < patternLength; i++) {
    int x = startX + i * (circleSize + padding); // Calculate X position for each circle
    
    // Set color based on pattern value
    if (pattern[i] == 0) {
      fill(255, 0, 0); // Red
    } else if (pattern[i] == 1) {
      fill(0, 0, 255); // Blue
    } else if (pattern[i] == 2) {
      fill(0, 255, 0); // Green
    } else if (pattern[i] == 3) {
      fill(255); // White
    }
    
    // Draw colored circle
    ellipse(x, height / 2, circleSize, circleSize);
  }
}
