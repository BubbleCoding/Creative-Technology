Fox b1;


void setup() {
  size(1000, 500);
  smooth();
  stroke(0);

  b1 = new Fox(200,250,1);

}

void draw() {
  background(255);
  b1.display();

}
