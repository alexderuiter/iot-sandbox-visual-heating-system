Valve[] valves;

void setup() {
  size(430, 720);
  valves = new Valve[11];
  for (int i = 0; i < valves.length; i++) {
    valves[i] = new Valve(width/4, (i+0.5) * (height/valves.length));
  }
}


void draw() {
  background(122);

  for (int i = 0; i < valves.length; i++) {
    valves[i].checkHovering(mouseX, mouseY);
    valves[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < valves.length; i++) {
    if (valves[i].buttonOver) {
      valves[i].stateSwitch();
    }
  }
}