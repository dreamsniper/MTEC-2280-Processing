int PinButt[] = {2, 3, 4, 5}; // button pins
int PinLED[] = {8, 9, 10, 11}; //  LED pins
int StateButt[3]; // button states

void setup() {
  Serial.begin(9600); // serial communicate
  
  // buttons as inputs with pull-up resistors
  for (int i = 0; i < 4; i++) {
    pinMode(PinButt[i], INPUT_PULLUP);
  }
  
  // Set LEDs 
  for (int i = 0; i < 4; i++) {
    pinMode(PinLED[i], OUTPUT);
  }
}

void loop() {
  // Read button states and send to Processing
  for (int i = 0; i < 4; i++) {
    StateButt[i] = digitalRead(PinButt[i]);
    
    if (StateButt[i] == LOW) { // Button is pressed
      Serial.write(i); // Send index to Processing
    }
  }
  
  delay(100); // Might use millis
}
