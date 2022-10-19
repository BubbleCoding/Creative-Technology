//State 1b - LEVEL 1b
//subclass of Screen
//leads to level 1c or fail screen

class Level1b extends Screen {

  Level1b(ScreenState[] nextStates) {
    super(nextStates);
    //initialize level components
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(48000, 250), 20, 2)); //otherwise nullpointer
    obstacles.add(new obstacle( 300, 150, 0, 200));
    obstacles.add(new obstacle( 100, 150, 200, 350));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level 1b ", 20, 20);
    }

    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=false;

    //call functions
    bord.border();
    shot.run();

    //run functions on all the arraylist 
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.y >= height) { //if character leaves the screen 
      location.y=2;
      Char.newStage();
      goToState(nextStates[0]); //enter next stage
    }
    if (location.x <= 0) { //if character leaves the screen 
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //enter next stage
    }

    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //leads to fail screen
      location.set(20, height-20); //reset location
      Char.restart=false;
      death=false;
    }

    if (enemies.size() > 0) {//add this and remove some stuff from character
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
    //instructions for the player
    fill(0);
    text("use  the  mouse  to  shoot  enemies", 20, 60);
    Char.run(); //run character last so that it is displayed in front of everything
  }


  void handleKeyPress() { // called by keyPressed() from main
    Char.handleKeyPress();
  }
  void handleKeyReleas() { // called by keyReleased() from main
    Char.handleKeyReleas();
  }
  void handleMousePress() { // called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
}
