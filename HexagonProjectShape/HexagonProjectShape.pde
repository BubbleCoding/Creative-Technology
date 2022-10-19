Hexagon Grid;

void setup() {
  Grid = new Hexagon(51, 20, 5, width/2, width/2);
  size(400, 400);
}

void draw() {
  Grid.update();
}
