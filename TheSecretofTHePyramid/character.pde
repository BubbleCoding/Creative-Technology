class character {
  float characterSize,c , speed;
  boolean [] keys = new boolean[128000];
  boolean restart=false;

  Bomb bomb;

  character(float x) {//constructor
    speed = 5;
    c=x;
    characterSize=20; 
    bomb=new Bomb(location.x, location.y);
  }


  void run() {//easy way to run all methods
    display();
    controls();
  }

  //the movement of this character hase been made possible with the code of "eraser peel" on youtube. https://www.youtube.com/watch?v=nermdWNIhm0
  void controls() {
    if (keys['w']) {
      location.y-=speed;
    }
    if (keys['a']) {
      location.x-=speed;
    }
    if (keys['s']) {
      location.y+=speed;
    }
    if (keys['d']) {
      location.x+=speed;
    }
  }
  void newStage() {
    for (int i=0; i<128; i++) {
      keys[i] = false;
    }
  }
  void display() {
    fill(c);
    ellipse(location.x, location.y, characterSize, characterSize);//the player sphere
    bomb.display();
  }
  void handleKeyPress() {
    keys[key] = true;
    if(key=='e'){ //if key e is pressed place bomb
      bomb.setLocation(location.x,location.y);
      bomb.lightFuse();
          bomb.isExploded(); //alex

    }
  }
  void handleKeyReleas() {
    keys[key] = false;
  }
  void handleMousePress() {
  }
}
