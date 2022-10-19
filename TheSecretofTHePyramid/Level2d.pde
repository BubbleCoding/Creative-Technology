//State 2d - LEVEL 2d
//subclass of Screen
//leads to level 2e or fail screen

class Level2d extends Screen {
  Slider slider;
  boolean wallTrap;
  PVector sliderTrap;

  Level2d(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    sliderTrap = new PVector(500, 200);
    for (int i=0; i<23; i++) {
      traps.add(new hazard(0+25*i, 460, 25));
    }
    obstacles.add(new obstacle( 200, 30, 0, 0));
    slider= new Slider(10, sliderTrap);
    enemies.add(new enemy(new PVector(450, 450), 100, 1));
    enemies.add(new enemy(new PVector(300, 350), 100, 2));
    enemies.add(new enemy(new PVector(480000, 250), 100, 3));
  }

  void draw() {
    if (testing==true) {
      fill(0);
      text("level2d", 20, 20);
    }
    //setting the borders for this level
    bord.borderR=true;
    bord.borderL=false;
    bord.borderU=false;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();

    //run function on all the arrayList
    for (obstacle o : obstacles) o.run();
    for (enemy e : enemies) e.run();
    for (hazard h : traps) h.run();

    if (location.x <= 0) { //check if character leaves the screen left
      location.x=width-2; 
      Char.newStage();
      goToState(nextStates[0]); //if so go to next stage
    }
    if (location.y <= 0) {  //check if character leaves the screen up
      location.y=height-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (death==true) { 
      Char.newStage();
      goToState(nextStates[2]); //go to fail screen
      location.set(20,height-20); //reset location
      Char.restart=false;
      death=false;
      slider= new Slider(10, sliderTrap);
      wallTrap=false;
    }
    if (enemies.size() > 0) {
      float minDist=20; //determine when an enemy is shot
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

    //MSD trap
    if (location.x >= sliderTrap.x-300 && location.x <= sliderTrap.x && location.y >= sliderTrap.y-100 && location.y <= sliderTrap.y) { //make trap shoot out if player is near
      wallTrap = true;
    }
    if (wallTrap == true) {
      slider.display();
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
