//State 1c - LEVEL 1c
//subclass of Screen
//leads to level 2 or fail screen

class Level1c extends Screen {
  PVector tele; //teleporter position

  Level1c(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    tele=new PVector(500, 400);
    obstacles.add(new obstacle( 100, 360, 200, 0));
    fakeWall.add(new FakeWall(75, 115, 215, 355));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 1c ", 40, 20);
    }
    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=true;
    bord.borderU=false;
    bord.borderD=true;

    //call functions
    bord.border();
    shot.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();
    for (FakeWall f : fakeWall) f.run();


    if (location.y <= 0) { //check if character left screen
      location.y=height-2;
      Char.newStage();
      goToState(nextStates[1]); //if so enter next stage
    }

    //display teleporter that leads to next level
    imageMode(CENTER);
    image(hole, tele.x, tele.y, size, size);
    imageMode(CORNER);

    if (PVector.dist(location, tele)<size/2) { //check if character is at teleporter position
      Char.newStage();
      goToState(nextStates[0]); //if so change to next level
      location.set(tele);
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[1]);//go to fail screen
      location.set(20, height-20); //reset position
      Char.restart=false;
      death=false;
    }
    //instructions for the player
    fill(0);
    text("press  e  ", 75, 200);
    text("to  place  a  bomb", 55, 220);
    Char.run(); //at the end because it should be above everything
    bombUpdate();
    bombDist();
  }
  void handleKeyPress() { // called by keyPressed() from main
    Char.handleKeyPress();
  }
  void handleKeyReleas() { // called by keyReleased() from main
    Char.handleKeyReleas();
  }
  void handleMousePress() { //called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }

  void bombDist() { //method that ckecks if bomb is next to fakeWall
    if (fakeWall.size() > 0) {
      PVector wallCent = new PVector(fakeWall.get(0).widthWall/2, fakeWall.get(0).heightWall/2);
      wallCent.add(fakeWall.get(0).pos); //find center position of wall
      float dist = PVector.dist(wallCent, bombPos); //save distance in a float
      if (dist<60) { 
        fakeWall.get(0).isExplodedBool=true; //set boolean in fakewall to true
      }
      if (fakeWall.get(0).removed) { //if wall s ready to be removed
        fakeWall.remove(0); //remove it
      }
    }
  }
}
