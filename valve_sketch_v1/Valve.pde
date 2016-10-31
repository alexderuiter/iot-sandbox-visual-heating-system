class Valve {

  // valve part
  float currentBrightness = 0;
  float maxBrightness = 255;
  float maxCurrentBrightness; 
  boolean turnedOn = false;
  boolean cooledDown = false;
  int periodTime = 6;
  

  // button part
  float buttonXPos, buttonYPos;     // Position of square button
  int buttonDiameter = 80;        // width as well as height of button
  color buttonOnColor = 210;
  color buttonOffColor = 140;
  color buttonHoverColor = 70;
  boolean buttonOver = false;
  boolean buttonClicked = false;
  boolean finishedButtonAnimation = false;

  Valve (float xPos, float yPos) {
    // valve part

    // button part
    buttonXPos = xPos;
    buttonYPos = yPos;
  }

  void stateSwitch() {
    if (!turnedOn) {
      turnedOn = true;
    } else if (turnedOn) {
      turnedOn = false;
    }
  }


  void determineBrightness () {
    if (turnedOn) {
      if (maxCurrentBrightness < maxBrightness) {
        maxCurrentBrightness += 0.25;  
      }
    } else if (!turnedOn && maxCurrentBrightness > 0){
      maxCurrentBrightness--;
    }
    float period = periodTime - ((float)amountTurnedOn/valves.length)*periodTime/2;
    println(period);
    currentBrightness = (sin((float)frameCount/maxFrameRate/period*TWO_PI)+1)/2 * maxCurrentBrightness;
  }

  void checkHovering(int xMouse, int yMouse) {
    if (xMouse >= (buttonXPos - (0.5 * buttonDiameter)) && xMouse <= buttonXPos +(0.5 * buttonDiameter) 
      && yMouse >= (buttonYPos - (0.5 * buttonDiameter)) && yMouse <= buttonYPos + (0.5 * buttonDiameter)) {
      buttonOver = true;
    } else {
      buttonOver = false;
    }
  }

  void display(int valveNumber) {
    if (!buttonClicked) {
      fill(buttonOffColor);
    }
    if (turnedOn) {
      fill(buttonOnColor);
    }
    if (buttonOver){
      fill(buttonHoverColor);
    }
    noStroke();
    rectMode(CENTER);
    rect(buttonXPos, buttonYPos, buttonDiameter, buttonDiameter);
    fill(255);
    textMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(valveNumber, buttonXPos, buttonYPos);
  }
} 