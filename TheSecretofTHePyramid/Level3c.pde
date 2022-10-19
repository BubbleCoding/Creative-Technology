//State 3c - LEVEL 3c
//subclass of Screen
//leads to level 3d or fail screen

class Level3c extends Screen {

  boolean run; //make sure only one wall can be removed

  Level3c(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( width, 150, 0, 15));
    obstacles.add(new obstacle( 220, 200, 0, 320)); 
    obstacles.add(new obstacle( 220, 200, width-220, 320)); 
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(480000, 250), 100, 2));
    fakeWall.add(new FakeWall(75, 150, 525, 168));
    waveTrap.add(new WaveTrap(new PVector(100, 200), 20, 150));
    //set boolean
    run = true;
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 3c", 20, 200);
    }

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=false;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run functions on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (FakeWall f : fakeWall) f.run();
    for (WaveTrap w : waveTrap) w.display();

    if (location.y >= height ) { //check if character is off screen down
      location.y=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next stage
    }
    if (location.x <= 0) {  //check if character leaves screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (location.x >= width) { //check if character leaves screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[3]); //if so go to next state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20, height-20); //reset location
      Char.restart=false;
      death=false;
    }

    if (enemies.size() > 0) {
      float minDist=20; //determine when an enemy is shot
      for (enemy e : enemies) {
        for (int i=0; i<shot.bullets.size(); i++) {
          Bullet b = shot.bullets.get(i);
          float d = e.position.dist(b.location2);
          //println(d);
          if (d < minDist) { //if enemy is hit by the bullet
            enemies.remove(e); //remove it from arraylist
          }
        }
      }
    }
    bombUpdate(); //update bombs position
    bombDist(); //measure distance between bomb and Fakewall
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

  void bombDist() { //method that checks if the bomb is near a fakeWall
    if (fakeWall.size() > 0 && run) {
      PVector wallCent = new PVector(fakeWall.get(0).widthWall/2, fakeWall.get(0).heightWall/2);
      wallCent.add(fakeWall.get(0).pos); //find middle of the wall 
      float dist1 = PVector.dist(wallCent, bombPos); //get distance between wallcenter and bomb
      if (dist1<60) {
        fakeWall.get(0).isExplodedBool=true;
      }
      if (fakeWall.get(0).removed) {
        fakeWall.remove(0);
        run = false; //make sure wall doesnt get removed again
      }
    }
  }
}
