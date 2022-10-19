//State 4f - LEVEL 4f
//subclass of Screen
//leads to win or fail screen

class Level4f extends Screen {
  Flock flock;
  PVector tele;

  Level4f(ScreenState[] nextStates) {
    super(nextStates);
    //initilize level components
    tele=new PVector(width/2, 400);
    flock = new Flock();
    for (int i=0; i<10; i++) { //create inital amount of objects in the ArrayList birds
      flock.addBird(new Bird(100, 100));
      flock.addBird(new Bird(400, 100));
      flock.addBird(new Bird(100, 400));
      flock.addBird(new Bird(400, 400));
      flock.addBird(new Bird(300, 400));
      flock.addBird(new Bird(400, 200));
      flock.addBird(new Bird(100, 200));
    }
  }

  void draw() {    
    if (testing==true) {
      fill(0);
      text("level 4f", 20, 20);
    }

    //setting borders for this level
    bord.borderR=true;
    bord.borderL=true;
    bord.borderU=false;
    bord.borderD=true;

    //call functions
    shot.run();
    bord.border();
    Char.run();
    flock.run();   

    imageMode(CENTER);
    image(hole, tele.x, tele.y, size, size);
    imageMode(CORNER);

    if (PVector.dist(location, tele)<size/2) { //check if character is at the teleporter position
      Char.newStage();
      goToState(nextStates[0]); //if so change to win screen
    }
    if (location.y <= 0) { //check if character if off screen
      location.y=height-2;
      Char.newStage();
      goToState(nextStates[1]); //if so go to previous state
    }
    if (death==true) { 
      Char.newStage();
      location.set(20, height-20);
      goToState(nextStates[2]); //go to fail screen 
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
  void handleMousePress() { // called by mousePressed() from main
    Char.handleMousePress();
    shot.handleMousePress();
  }
}