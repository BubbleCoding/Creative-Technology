//State 2e - LEVEL 2e
//subclass of Screen
//leads to level 3 or fail screen

class Level2e extends Screen {
  PVector tele;

  Level2e(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    tele=new PVector(100, width/2);
    for (int i=0; i<23; i++) {
      traps.add(new hazard(50+25*i, 460, 25));
    }
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 2e", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=true;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run functions on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (hazard h : traps) h.run();

    imageMode(CENTER);
    image(hole, tele.x, tele.y, size, size);
    imageMode(CORNER);


    if (PVector.dist(location, tele)<size/2) { //check if character is at teleporter location
      Char.newStage();
      goToState(nextStates[0]); //if so go to next level
      location.set(tele);
    }
    if (location.x >= width) { //check if character leaves screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[1]); //if so go back to previous state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20,height-20); //reset position
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
