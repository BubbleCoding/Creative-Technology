Fox b1;
Fox b2;
Fox b3;

void setup() {
  size(1000, 500);
  smooth();

  b1 = new Fox(200,250,1);
  b2 = new Fox(500,250,3);
  b3 = new Fox(800,250,2);
}

void draw() {
  background(255);
  b1.display();
  b2.display();
  b3.display();
}
