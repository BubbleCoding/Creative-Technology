//State 4c - LEVEL 4c
//subclass of Screen
//leads to level 4d or fail screen

class Level4c extends Screen {

  Level4c(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    obstacles.add(new obstacle( width, 150, 0, height/4+50)); 
    obstacles.add(new obstacle( width/2, 180, width/2, -5));
    for (int i=0; i<5; i++) {
      traps.add(new hazard(0+25*i, 162, 25));
    }
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(380, 250), 100, 2));
    enemies.add(new enemy(new PVector(280, 250), 100, 3));
  }

  void draw() {
    if (testing==true) {
      fill(0, 255, 0, 255);
      text("level4c", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=false;
    bord.borderU=false;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.x >= width) { //check if character is off screen right
      location.x=2;
      Char.newStage();
      goToState(nextStates[0]); //if so go to next state
    }
    if (location.x <= 0) { //check if character is off screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (location.y <= 0) { //check if character is off screen up
      location.set(450, 50); //telport into trap
      Char.newStage();
      goToState(nextStates[3]); //if so go to next state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]);  //go to fail screen
      location.set(20, height-20); //reset location
      Char.restart=false;
      death=false;
    }
    if (enemies.size() > 0) {
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
  void handleMousePress() { // called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
}