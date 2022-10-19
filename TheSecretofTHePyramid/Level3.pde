//State 3 - LEVEL 3
//subclass of Screen
//leads to level 3b or fail screen

class Level3 extends Screen {

  Level3(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 3", 20, 200);
    }

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=true;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();

    if (location.x >= width) { //check if character leaves the screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[1]); //go to fail screen
      location.set(20, height-20); //reset location
      Char.restart=false;
      death=false;
    }
    Char.run();
  }
  void handleKeyPress() { // called by keyPressed() from main
    Char.handleKeyPress();
  }
  void handleKeyReleas() { // called by keyPressed() from main
    Char.handleKeyReleas();
  }
  void handleMousePress() { // called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
}
