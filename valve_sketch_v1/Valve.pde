class Valve {

  // valve part
  float brightness = 0;
  float maxBrightness = 50;
  float pulse = 0;
  float basePulse = 5;
  boolean turnedOn = false;
  long onTime = 0;

  // button part
  float buttonXPos, buttonYPos;     // Position of square button
  int buttonDiameter = 40;        // width as well as height of button
  int maxButtonDiameter =  50;
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

  void determinePulse (int amountTurnedOn) {
    if (turnedOn) {
      pulse = basePulse * amountTurnedOn;
    }
  }

  void checkTimer () {
    if (turnedOn) {
      onTime++;
      } else {
      onTime = 0;
      }
  }

  void determineBrightness () {
    if (turnedOn) {
      if (brightness < maxBrightness) {
        brightness =+ onTime;
      }
    }
  }

  void checkHovering(int xMouse, int yMouse) {
    if (xMouse >= (buttonXPos - (0.5 * buttonDiameter)) && xMouse <= buttonXPos +(0.5 * buttonDiameter) 
      && yMouse >= (buttonYPos - (0.5 * buttonDiameter)) && yMouse <= buttonYPos + (0.5 * buttonDiameter)) {
      buttonOver = true;
    } else {
      buttonOver = false;
    }
  }

  void display() {
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
  }
} 