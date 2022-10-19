//class that creates walls

class obstacle {
  float widthObstacle, heightObstacle, locationX, locationY;

  obstacle(float x, float y, float xPos, float yPos) { //constructor
    //initilize PVectors
    widthObstacle=x;
    heightObstacle=y;
    //location.set(xPos, yPos);
    locationX = xPos;
    locationY = yPos;
  }

  void run() {
    display();
    collision();
  }

  void display() {
    pushMatrix();
    stroke(#DAA520);
    strokeWeight(3); 
    fill(#FFD700);
    rect(locationX, locationY, widthObstacle, heightObstacle);
    for (int i=1; i<widthObstacle/45; i++) { //draw the bricks
      for (int j=1; j<heightObstacle/15; j++) {
        for (int k=0; k<(heightObstacle/15)/2; k++) {
          line(locationX+i*50, locationY+k*30+15, locationX+i*50, locationY+k*30+30); 
          line(locationX+i*50-25, locationY+k*30, locationX+i*50-25, locationY+15+k*30);
          line(locationX, locationY+15*j, locationX+widthObstacle, locationY+15*j);
        }
      }
    }
    noStroke();
    popMatrix();
  }

  void collision() {
    if (location.x >= locationX && location.x <= locationX+widthObstacle && location.y >= locationY-10 && location.y <= locationY+5) {//collision top
      location.y=locationY-10;
    }
    if (location.x >= locationX-10 && location.x <= locationX+5 && location.y >= locationY && location.y <= locationY+heightObstacle) {//collision left
      location.x=locationX-10;
    }
    if (location.x >= locationX+widthObstacle && location.x <= locationX+widthObstacle+5 && location.y >= locationY && location.y <= locationY+heightObstacle) {//collision right
      location.x=locationX+widthObstacle+10;
    }
    if (location.x >= locationX && location.x <= locationX+widthObstacle && location.y >= locationY+heightObstacle && location.y <= locationY+heightObstacle+5) {//collision bottom
      location.y=locationY+heightObstacle+10;
    }
  }
}