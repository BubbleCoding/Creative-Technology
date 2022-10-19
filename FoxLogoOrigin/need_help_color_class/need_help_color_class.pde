static final int FOXES = 10;
Fox[] foxes = new Fox[FOXES];




void setup() {
  frameRate(120);
  size(1600,800 );
  smooth();
  for (int i=0; i<foxes.length; i++) {
  foxes[i] = new Fox(random(.5,3));
  }
}

void draw() {
  background(255);
  for (int i=0; i < foxes.length; i++) {
  foxes[i].display();
  }


}
