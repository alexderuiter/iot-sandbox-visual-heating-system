class Valve {

  // valve part
  float currentBrightness = 0;
  float maxBrightness = 255;
  float maxCurrentBrightness; 
  boolean turnedOn = false;
  boolean cooledDown = false;
  //long onTime = 0;
  int periodTime = 8;
  

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

  void checkTimer () {
    if (turnedOn) {
      //onTime++;
      } else {
      //onTime = 0;
      }
  }

  void determineBrightness () {
    if (turnedOn) {
      if (maxCurrentBrightness < maxBrightness) {
        maxCurrentBrightness++;  
      }
      // this uses framerate to make it adaptable to different framerates
      //for (int i = 0; i < 360; i += (amountTurnedOn * frameRate)) { 
        //float period = 4 - ((float)amountTurnedOn/(valves.length*2));
        //currentBrightness = (sin((float)onTime/frameRate/(period*TWO_PI))+1)/2 * maxCurrentBrightness;  
      //}
      //cooledDown = false;
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