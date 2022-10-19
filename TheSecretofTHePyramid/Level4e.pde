//State 4e - LEVEL 4e
//subclass of Screen
//leads to level 1c or fail screen

class Level4e extends Screen {
  Flock flock;

  Level4e(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    Char = new character(200);
    bord = new Border();
    obstacles.add(new obstacle( 100, 150, 0, height/4+50)); 
    obstacles.add(new obstacle( 100, 180, 0, -5));
    enemies.add(new enemy(new PVector(480, 250), 100, 1));
    enemies.add(new enemy(new PVector(48000, 250), 100, 2));
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
      fill(0);
      text("level 4e", 20, 20);
    }

    //setting borders for this level
    bord.borderR=true;
    bord.borderL=false;
    bord.borderU=true;
    bord.borderD=false;

    //call functions
    shot.run();
    bord.border();
    Char.run();
    flock.run();

    //run functions on arrayLists
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();

    if (location.y >= height) { //check if character is off screen down
      location.y=2; 
      Char.newStage();
      goToState(nextStates[0]); //if so go to next state
    }
    if (location.x <= 0) { //check if character is off screen left
      location.x=width-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]);
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
