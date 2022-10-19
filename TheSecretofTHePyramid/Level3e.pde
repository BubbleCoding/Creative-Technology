//State 3e - LEVEL 3e trap room
//subclass of Screen
//leads to level 4 or fail screen

class Level3e extends Screen {
  PVector tele;

  Level3e(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    Char = new character(200);
    bord = new Border();
    tele=new PVector(400, width/2);
    obstacles.add(new obstacle( 220, 60, 0, 0)); 
    obstacles.add(new obstacle( 220, 60, width-220, 0));
  }

  void draw() {
    if (testing==true) {
      fill(0, 255, 0, 255);
      text("level 3e", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=true;
    bord.borderU=false;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (hazard h : traps) h.run();

    if (location.y <= 0) { //check if location of character is off screen up
      location.y=height-2;
      Char.newStage();
      goToState(nextStates[1]); //go back to previous state
    }

    imageMode(CENTER);
    image(hole, tele.x, tele.y, size, size);
    imageMode(CORNER);

    if (PVector.dist(location, tele)<size/2) {  //check if character is over teleporter
      Char.newStage();
      goToState(nextStates[0]); //go to next state
      location.set(tele);
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
