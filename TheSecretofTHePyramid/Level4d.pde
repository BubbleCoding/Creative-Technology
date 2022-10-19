//State 4d - LEVEL 4d
//subclass of Screen
//leads to level 4b or fail screen

class Level4d extends Screen {
  Flock flock;

  Level4d(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( 300, 150, width/2, height-150));
    flock = new Flock();
    for (int i=0; i<10; i++) { //create inital amount of objects in the ArrayList birds
      flock.addBird(new Bird(100, 100));
      flock.addBird(new Bird(400, 100));
      flock.addBird(new Bird(100, 400));
      flock.addBird(new Bird(400, 400));
    }
  }

  void draw() {
    if (testing==true) {
      fill(0, 255, 0, 255);
      text("level 4d", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=true;
    bord.borderU=true;
    bord.borderD=false;

    //call functions
    shot.run();
    bord.border();
    Char.run();
    flock.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.y >= height) { //check if character is off screen down
      location.y=2;
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
