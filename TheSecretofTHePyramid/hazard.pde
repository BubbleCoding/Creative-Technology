//class that creates a hazard that will kill the character if touched

class hazard {
  PImage spike;
  PVector pos;
  float size;

  hazard(float x, float y, float s) {
    //initilze values
    pos=new PVector(x, y);
    size=s;
    spike= loadImage("spikes.png");
  }
  void run() {
    display();
    update();
  }
  void display() {
    pushMatrix();
    imageMode(CENTER);
    image(spike, pos.x, pos.y, size, size);
    imageMode(CORNER);
    popMatrix();
  }

  void update() {
    if (dist(location.x, location.y, pos.x, pos.y)<=size/2+7) { //check if hazard is touching character
      death=true; //if so kill character
    }
  }
}
