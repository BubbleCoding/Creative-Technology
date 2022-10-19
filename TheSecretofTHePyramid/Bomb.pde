//class that creates a bomb
class Bomb {
  float speed;
  PVector pos;
  PImage bomb;
  boolean hasExploded, isActive;
  long timer;
  Particle[] particles=new Particle[100]; //create particle array of size 100

  //constructor
  Bomb(float x, float y) {
    pos=new PVector(x, y);
    bomb=loadImage("bomb.png");
    isActive = false;
    hasExploded = false;
    PImage explosionParticle = loadImage("explode.png"); //this is here for memory saving reasons, called in particle class it would be loaded 100 times per bomb instead of once

    for (int i=0; i<particles.length; i++) {
      particles[i]=new Particle(explosionParticle, pos.x, pos.y);
    }
    timer = 922337203;//gives initial value
  }

  void display() { 
    if (isActive) {
      image(bomb, pos.x - 10, pos.y - 10, 20, 20);
    }
    if (millis()>=timer) {
      isExploded=2; //set to 2 if bomb is exploded
      //draw particles
      for (int i=0; i<particles.length; i++) {
        particles[i].display();
        particles[i].move();
      }
      if (pos.dist(location)<50) {
        death=true;
      }
      isActive=false;
      pos = new PVector(1000, 1000);
    }
  }
  void setLocation(float x, float y) {
    // Can't move a detonating bomb.
    if (!isActive) {
      pos.set(x, y);
      for (int i=0; i<particles.length; i++) {
        particles[i].setPosition(pos.x, pos.y);
      }
    }
  }
  PVector getPosition() {
    return pos;
  }

  void lightFuse() {
    // Can't light a fuse that's already lit.
    if (!isActive) {
      isActive = true;
      timer=millis()+2000; //so that the bomb doesnt explode immedietly
      hasExploded = false;

      for (int i=0; i<particles.length; i++) {
        particles[i].reset();
      }
    }
  }

  boolean isExploded() { //check if bomb is exploded
    if (isExploded==2) {
      return true; //if so return true
    } else {
      return false;
    }
  }
}
