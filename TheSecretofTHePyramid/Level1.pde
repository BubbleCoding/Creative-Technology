//State 1 - LEVEL 1 
//subclass of Screen
//can lead to every other level if testing mode is activated

class Level1 extends Screen {
  boolean lvl2, lvl3, lvl4, lvl5, victoryScreen; //for testing mode
  WaveTrap wt;

  Level1(ScreenState[] nextStates) {
    super(nextStates);
    //initialize level components
    wt = new WaveTrap(new PVector(300, 350), 40, 150);
    for (int i=0; i<7; i++) {
      traps.add(new hazard(400+25*i, 188, 25));
    }
    obstacles.add(new obstacle( 300, 150, 300, 200));
    Char.newStage();
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 1", 100, 30);
    }

    //choose in what level you want to start for testingmode
    lvl2 = false;
    lvl3 = false;
    lvl4 = false;
    victoryScreen = false;

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=true;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    bord.border();
    shot.run();
    wt.display();

    //run functions on all the arraylist 
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (death==true) { //death leads to fail screen
      Char.newStage();
      location.set(20, height-20); //reset position
      Char.restart=false;
      death=false;
      goToState(nextStates[1]);
    }

    if (location.x >= width) { //if character leaves the screen
      location.x=4;
      Char.newStage();
      goToState(nextStates[0]); //enter next stage
    }

    //start in a diffrent level (used for testing)
    if (lvl2==true && testing==true) {
      goToState(nextStates[2]);
    }
    if (lvl3==true && testing==true) {
      goToState(nextStates[3]);
    }
    if (lvl4==true && testing==true) {
      goToState(nextStates[4]);
    }
    if (victoryScreen==true && testing==true) {
      goToState(nextStates[5]);
    }
    //instructions for the player
    fill(0);
    text("use  W A S D  to  navigate", 100, 300);
    Char.run(); //call character last to make sure he is above everything
  }

  void handleKeyPress() { // called by keyPressed() from main
    Char.handleKeyPress();
  }
  void handleKeyReleas() { // called by keyRealessed() from main
    Char.handleKeyReleas();
  }
  void handleMousePress() {// called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
  void reset() {
  }
}