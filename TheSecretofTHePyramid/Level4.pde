//State 4 - LEVEL 4
//subclass of Screen
//leads to level 4b or fail screen

class Level4 extends Screen {

  Level4(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( 200, 150, width-200, height/4+50)); 
    for (int i=0; i<5; i++) {
      traps.add(new hazard(500+25*i, 162, 25));
    }
  }

  void draw() {
    if (testing==true) {
      fill(0, 255, 0, 255);
      text("level 4", 20, 20);
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

    if (location.x >= width) { //check if character is off screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next state
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
