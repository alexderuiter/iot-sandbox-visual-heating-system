const int lepPinsArrayLegnth = 12;
int ledPins[lepPinsArrayLegnth] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
float ledBrightness[lepPinsArrayLegnth];
char val;

void setup() {
  Serial.begin(9600);
}

void loop() {
  while (Serial.available()) {
    val = Serial.read();
  }

  if (val == 'A'){
    analogWrite(ledPins[0], 200); 
    }
  
  for (int i = 0; i < lepPinsArrayLegnth; i++) {
//    analogWrite(ledPins[i], 200);
  }
}
