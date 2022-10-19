//Rover Vos S2161702 //<>//

static final int FOXES = 50;
Fox[] foxes = new Fox[FOXES];
int foxesCreated = 0;
counter Counter = new counter();



void setup() {
  frameRate(120);
  size(1600, 800);
  smooth();
  for (int i=0; i<FOXES; i++) {
    foxes[i] = new Fox();
  }
}

void mouseClicked() {
  if (foxesCreated > 0 && mouseX < 1600 && mouseX > 1550 && mouseY < 800 && mouseY > 750) {
    foxesCreated--;
  }

  if (foxesCreated < foxes.length && mouseX < 1600 && mouseX > 1550 && mouseY < 750 && mouseY > 700) {
    foxesCreated++;
  }
  if (foxesCreated > 0 && mouseX < 1550 && mouseX > 1500 && mouseY < 800 && mouseY > 750) {
    foxesCreated=0;
  }
  if (foxesCreated < foxes.length && mouseX < 1550 && mouseX > 1500 && mouseY < 750 && mouseY > 700 && foxesCreated > 40) {
    foxesCreated = foxesCreated + 50-foxesCreated;
  } 
  if (foxesCreated < foxes.length && mouseX < 1550 && mouseX > 1500 && mouseY < 750 && mouseY > 700){
    foxesCreated=foxesCreated+10;
  }
}
void draw() {

  background(255);
  for (int i=0; i < foxesCreated; i++) {
    foxes[i].display();
  }
  Counter.display();
}
