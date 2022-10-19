static final int FOXES = 50;
Fox[] foxes = new Fox[FOXES];




void setup() {
  frameRate(120);
  size(1600,1000 );
  smooth();
  for (int i=0; i<foxes.length; i++) {
  foxes[i] = new Fox(random(0,width),random(0,height),random(.5,3));
  }
}

void draw() {
  background(255);
  for (int i=0; i < foxes.length; i++) {
  foxes[i].display();
  }


}
