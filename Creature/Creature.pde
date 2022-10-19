//Rover Vos S2161702 //<>// //<>// //<>//

static final int FOXES = 500;
Fox[] foxes = new Fox[FOXES];
int foxesCreated = 20;
//counter Counter = new counter();



void setup() {
  frameRate(120);
  size(600, 240);
  smooth();
  for (int i=0; i<FOXES; i++) {
    foxes[i] = new Fox();
  }
}

//void mouseClicked() {
//  if (foxesCreated > 0 && mouseX < width && mouseX > width-50 && mouseY < height && mouseY > height-50) {
//    foxesCreated--;
//  }

//  if (foxesCreated < foxes.length && mouseX < width && mouseX > width-50 && mouseY < height-50 && mouseY > height-100) {
//    foxesCreated++;
//  }
//  if (foxesCreated > 0 && mouseX < width-50 && mouseX > width-100 && mouseY < height && mouseY > height-50) {
//    foxesCreated=0;
//  }
//  if (foxesCreated < foxes.length && mouseX < width-50 && mouseX > width-100 && mouseY < height-50 && mouseY > height-100 && foxesCreated > foxes.length-10) {
//    foxesCreated = foxesCreated + foxes.length-foxesCreated;
//  } 
//  if (foxesCreated < foxes.length && mouseX < width-50 && mouseX > width-100 && mouseY < height-50 && mouseY > height-100){
//    foxesCreated=foxesCreated+10;
//  }
//}
void draw() {

  background(0);
  for (int i=0; i < foxesCreated; i++) {
    foxes[i].display();
  }
  //Counter.display();
}
