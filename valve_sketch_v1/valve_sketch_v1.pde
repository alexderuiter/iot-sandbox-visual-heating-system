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
}


void draw() {
  background(122);

  for (int i = 0; i < valves.length; i++) {
    valves[i].checkHovering(mouseX, mouseY);
    valves[i].display();
    valves[i].checkTimer();
    valves[i].determineBrightness();
    println("onTime of valve " + i + " = " + valves[i].onTime);
  }
  
  countTurnedOnValves();
}

void mousePressed() {
  for (int i = 0; i < valves.length; i++) {
    if (valves[i].buttonOver) {
      valves[i].stateSwitch();
    }
  }
}

int countTurnedOnValves () {
  for (int i = 0; i < valves.length; i++) {
    if (valves[i].turnedOn) {
      amountTurnedOn++;
    }
  }
  return amountTurnedOn;
}