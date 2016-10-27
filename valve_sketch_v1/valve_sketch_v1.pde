import processing.serial.*;

Serial myPort;  // Create object from Serial class

Valve[] valves;
int amountTurnedOn; 

void setup() {
  size(430, 720);
  valves = new Valve[12];
  for (int i = 0; i < valves.length; i++) {
    if (i < valves.length/2) {
      valves[i] = new Valve(width/4, (i+0.5) * (height/(valves.length/2)));
    } else {
      valves[i] = new Valve((3 * width)/4, ((i - (valves.length/2))+ 0.5) * (height/(valves.length/2)));
    }
    println(valves[i].buttonXPos, valves[i].buttonYPos);
  }
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}


void draw() {
  background(122);

  for (int i = 0; i < valves.length; i++) {
    valves[i].checkHovering(mouseX, mouseY);
    valves[i].display();
    valves[i].checkTimer();
    valves[i].determineBrightness();
    println("currentBrightness of valve " + i + " = " + valves[i].currentBrightness + "\t" + "maxCurrentBrightness of valve " + valves[i].maxCurrentBrightness);
  }
  
  countTurnedOnValves();
  println(frameRate);
  
}

void mousePressed() {
  for (int i = 0; i < valves.length; i++) {
    if (valves[i].buttonOver) {
      valves[i].stateSwitch();
    }
  }
}

void countTurnedOnValves () {
  amountTurnedOn =0;
  for (int i = 0; i < valves.length; i++) {
    if (valves[i].turnedOn) {
      amountTurnedOn++;
    }
  }
}