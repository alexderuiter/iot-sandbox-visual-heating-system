const int lepPinsArrayLegnth = 12;
int ledPins[lepPinsArrayLegnth] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
float ledBrightness[lepPinsArrayLegnth];

void setup() {
  Serial.begin(250000);
}

void loop() {
  while(Serial.read() != 'A') {}
  while(!Serial.available()) {}
  char valve = Serial.read();
  
  while (Serial.read() != '$') {}
  while(!Serial.available()) {}
  char brightness = Serial.read();

  analogWrite(ledPins[valve],brightness);
}
