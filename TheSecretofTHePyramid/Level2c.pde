//State 2c - LEVEL 2c
//subclass of Screen
//leads to level 1c or fail screen

class Level2c extends Screen {

  Level2c(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( 200, 200, 0, 319));
    for (int i=0; i<7; i++) {
      traps.add(new hazard(0+25*i, 310, 25));
    }
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(300, 250), 100, 2));
    enemies.add(new enemy(new PVector(480000, 250), 100, 3));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 2c", 20, 20);
    }
    //setting the borders for this level
    bord.borderR=true;
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
    for (hazard h : traps) h.run();

    if (location.y >= height) {  //check if character is leaving the screen right
      location.y=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next stage
    }
    if (location.x <= 0) { //check if character is leaving the screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to next stage
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20,height-20); //reset location
      Char.restart=false;
      death=false;
    }

    if (enemies.size() > 0) {//check if there is an enemy
      float minDist=20; //determine when an enemy is shot
      for (int i=shot.bullets.size()-1; i>=0; i--) {
        enemy e = enemies.get(i);
        for (int j=0; j<shot.bullets.size(); j++) {
          Bullet b = shot.bullets.get(j);
          float d = e.position.dist(b.location2);
          if (d < minDist) { //if enemy is hit by the bullet
            enemies.remove(e); //remove it from arraylist
          }
        }
      }
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
