//State 3d - LEVEL 3d trap room
//subclass of Screen
//leads to level 3e or fail screen

class Level3d extends Screen {
  Flock flock;

  Level3d(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( 75, 150, 0, 15));
    obstacles.add(new obstacle( 75, 200, 0, 320));
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
      text("level3d", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();
    flock.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.x <= 0) { //check if charater is off screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to previous state
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
