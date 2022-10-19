//class that moves the particles of the bom explosion
class Particle { 
  float counter, speed, size;
  PImage explode;
  PVector pos, speedP;


  Particle(PImage image, float initX, float initY) {
    explode=image;
    pos=new PVector(initX, initY);
    speed=3;
    speedP=new PVector(random(-speed, speed), random(-speed, speed));
    size=random(20, 40);
  }

  void display() {
    if (counter<0) {
      return;
    }
    image(explode, pos.x, pos.y, size, size);
    counter=counter-2.5;
  }

  void setPosition(float x, float y) {
    pos.set(x, y);
  }

  void reset() {
    counter=random(20, 80);
  }

  void move() {
    pos.add(speedP);
  }
}
