//State 3b - LEVEL 3b
//subclass of Screen
//leads to level 3c or fail screen

class Level3b extends Screen {

  Level3b(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    for (int i =0; i<6; i++) {
      waveTrap.add(new WaveTrap(new PVector(100, 75*i), 40, 150));
    }
    obstacles.add(new obstacle( 100, 150, width-100, 30));
    obstacles.add(new obstacle( 100, 150, width-100, 319));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 3b", 20, 200);
    }

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (WaveTrap w : waveTrap) w.display();

    if (location.x >= width) { //check if character leaves the screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next state
    }
    if (location.x <= 0) { //check if character leaves the screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20, height-20); //reset location
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
