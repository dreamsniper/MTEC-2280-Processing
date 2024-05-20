int PinButt[] = {2, 3, 4, 5}; // button pins
int PinLED[] = {8, 9, 10, 11}; // LED pins
int StateButt[4]; // button states

void setup() {
  Serial.begin(115200); // Serial communication
  
  // Buttons as inputs with pull-up resistors and LEDs
  for (int i = 0; i < 4; i++) {
    pinMode(PinButt[i], INPUT_PULLUP);
    pinMode(PinLED[i], OUTPUT);
    //digitalWrite(PinLED[i], LOW); // Turn on corresponding LED
  }
}

void loop() {
  // Read button states and send to Processing when pressed
  for (int i = 0; i < 4; i++) {
    StateButt[i] = digitalRead(PinButt[i]);

    if (StateButt[i] == LOW) { // Button is pressed
      digitalWrite(PinLED[i], HIGH); // Turn on corresponding LED
      Serial.write(i); // Send index to Processing
    } else { // Button is released
      digitalWrite(PinLED[i], LOW); // Turn off corresponding LED
    }
  }
  
  delay(200); // Might use millis
}
