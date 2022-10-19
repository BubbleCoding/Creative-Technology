//State 2 - LEVEL 2
//subclass of Screen
//leads to level 2b or fail screen

class Level2 extends Screen {

  Level2(ScreenState[] nextStates) {
    super(nextStates);
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 2", 20, 20);
    }
    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=true;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    bord.border();
    shot.run();
    Char.run();

    if (location.x >= width) { //check if character leaves the screen
      location.x=2; 
      Char.newStage();
      goToState(nextStates[0]); //if so go to next stage
    }

    if (death==true) { 
      Char.newStage();
      goToState(nextStates[1]); //go to fail screen 
      location.set(20,height-20); //reset location
      Char.restart=false;
      death=false;
    }
  }
  void handleKeyPress() { // called by keyPressed() from main
    Char.handleKeyPress();
  }
  void handleKeyReleas() { // called by keyPressed() from main
    Char.handleKeyReleas();
  }
  void handleMousePress() { //called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
}
