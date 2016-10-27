const int lepPinsArrayLegnth = 12;
int ledPins[lepPinsArrayLegnth] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
float ledBrightness[lepPinsArrayLegnth];

void setup() {
  Serial.begin(9600);
}

void loop() {
  for (int i = 0; i < lepPinsArrayLegnth; i++) {
    analogWrite(ledPins[i], 200);
  }
}
