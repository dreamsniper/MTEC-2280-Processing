int PinButt[] = {2, 3, 4, 5}; // button pins
int PinLED[] = {8, 9, 10, 11}; //  LED pins
int StateButt[4]; // button states

void setup() {
  Serial.begin(115200); // serial communicate
  
  // buttons as inputs with pull-up resistors and LEDs
  for (int i = 0; i < 4; i++) {
    pinMode(PinButt[i], INPUT_PULLUP);
    pinMode(PinLED[i], OUTPUT);
    digitalWrite(PinLED[i], LOW); // Turn off LEDs initially
  }
  
}

void loop() {
  // Read button states and send to Processing
  for (int i = 0; i < 4; i++) {
    StateButt[i] = digitalRead(PinButt[i]);

    if (StateButt[i] == LOW) { // Button is pressed
      digitalWrite(PinLED[i], HIGH); // Turn on corresponding LED
      //analogWrite(PinLED[i + 6], HIGH); // Full brightness
      Serial.write(i); // Send index to Processing
    } else { // Button is released
      digitalWrite(PinLED[i], LOW); // Turn off corresponding LED
    }
  }
  
  delay(100); // Might use millis
}