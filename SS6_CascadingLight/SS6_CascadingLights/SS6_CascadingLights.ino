// constants won't change. They're used here to set pin numbers:
const int buttonPin = 13;  // the number of the pushbutton pin
const int ledPin1 = 9;    // the number of the LED pin
const int ledPin2 = 8;    // the number of the LED pin
const int ledPin3 = 7;    // the number of the LED pin
const int ledPin4 = 6;    // the number of the LED pin
const int ledPin5 = 5;    // the number of the LED pin
const int ledPin6 = 4;    // the number of the LED pin

// variables will change:
int buttonState = 0;  // variable for reading the pushbutton status
//const long interval = 250;  // interval at which to blink (in milliseconds)

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);
  pinMode(ledPin6, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
    // Turn on LEDs with varying brightness
    analogWrite(ledPin1, 255); // Full brightness
    delay(100);  // Delay for LED 1
    analogWrite(ledPin2, 200); // Medium brightness
    delay(200);  // Delay for LED 2
    analogWrite(ledPin3, 150); // Low brightness
    delay(300);  // Delay for LED 3
    analogWrite(ledPin4, 100); // Dim brightness
    delay(400);  // Delay for LED 4
    analogWrite(ledPin5, 50);  // dim brightness
    delay(500);  // Delay for LED 5
    analogWrite(ledPin6, 25);  // Very dim brightness
  } else {
    // turn LED off:
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
    digitalWrite(ledPin4, LOW);
    digitalWrite(ledPin5, LOW);
    digitalWrite(ledPin6, LOW);
  }
}
