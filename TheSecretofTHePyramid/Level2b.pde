//State 2b - LEVEL 2b
//subclass of Screen
//leads to level 2c or fail screen
class Level2b extends Screen {

Level2b(ScreenState[] nextStates) {
    super(nextStates);
    //initilize components of the level
    obstacles.add(new obstacle( 200, 150, 400, 319));
    for (int i=0; i<7; i++) {
      traps.add(new hazard(445+25*i, 310, 25));
    }
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(300, 250), 100, 2));
    enemies.add(new enemy(new PVector(480000, 250), 100, 3));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level2b", 20, 20);
    }
    //setting the borders for this level
    bord.borderR=false;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=true;
    
    //call functions
    shot.run();
    bord.border();
    Char.run();
    
    //run function on all the arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.x >= width) {  //check if character leaves the screen right
      location.x=2; 
      Char.newStage();
      goToState(nextStates[0]); //if so got to next stage
    }
    if (location.x <= 0) { //check character leaves the screen left
      location.x=width-2; 
      Char.newStage();
      goToState(nextStates[1]); //if so go to preavious stage
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20,height-20); //reset location
      Char.restart=false;
      death=false;
    }

    if (enemies.size() > 0) {
      float minDist=20; //determine the distance at which an enemy is shot
      for (int i=shot.bullets.size()-1; i>=0; i--) {
        enemy e = enemies.get(i);
        for (int j=0; j<shot.bullets.size(); j++) {
          Bullet b = shot.bullets.get(j);
          float d = e.position.dist(b.location2);
          //println(d);
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
