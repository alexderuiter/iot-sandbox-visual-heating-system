import processing.serial.*;

Serial myPort;  // Create object from Serial class

Valve[] valves;
int amountTurnedOn; 
int maxFrameRate = 60;

void setup() {
  size(430, 720);
  frameRate(maxFrameRate);
  
  // innitiates 12 valve objects
  valves = new Valve[12];
  for (int i = 0; i < valves.length; i++) {
    if (i < valves.length/2) {
      valves[i] = new Valve(width/3, (i+0.5) * (height/(valves.length/2)));
    } else {
      valves[i] = new Valve((2 * width)/3, ((i - (valves.length/2))+ 0.5) * (height/(valves.length/2)));
    }
    println(valves[i].buttonXPos, valves[i].buttonYPos);
  }
  
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 250000);
}

void draw() {
  background(122);

  for (int i = 0; i < valves.length; i++) {
    valves[i].checkHovering(mouseX, mouseY);
    valves[i].display(i);
    valves[i].determineBrightness();
    //println("currentBrightness of valve " + i + " = " + valves[i].currentBrightness + "\t" + "maxCurrentBrightness of valve " + valves[i].maxCurrentBrightness);
    myPort.write("A");
    myPort.write((byte)i);
    myPort.write('$');
    myPort.write((byte)valves[i].currentBrightness);
    myPort.write('\n');
    
}
  
  countTurnedOnValves();
  if (frameRate < 30) println(frameRate);
  
  
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