//class that creates the ghost enemy

class enemy {
  float drawX, drawY, directionY, directionX, distance, drawLengthX, drawLengthY, size;
  PVector position, direction;
  PImage ghost;
  int number;

  enemy(PVector p, float d, int num) {
    //initilize values
    position = p;
    size = d;
    ghost=loadImage("ghost.png");
    direction=new PVector(0, 0);
    number = num;
  }

  void run() {
    display();
    update();
  }
  void display() {
    pushMatrix();
    float theta = direction.heading() + PI/2; //head in character direction
    translate(position.x, position.y);
    fill(0);
    text(number, -15, -10);
    rotate(theta);

    imageMode(CENTER);
    image(ghost, 0, 0, size, size);

    imageMode(CORNER);
    popMatrix();
  }

  void update() {
    if (dist(location.x, location.y, position.x, position.y)<=size/2) { //check if character is hit by enemy
      death=true; //if so kill character
    } 
    drawLengthX= position.x;
    drawLengthY= position.y;
    drawX= location.x;
    drawY = location.y;
    directionX = drawX-drawLengthX;
    directionY = drawY-drawLengthY;
    direction = new PVector(directionX, directionY);
    direction.normalize();
    direction.mult(2);
    position.add(direction);
  }
}