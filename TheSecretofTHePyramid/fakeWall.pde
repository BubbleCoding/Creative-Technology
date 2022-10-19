//class that creates a wall that can be removed by placing a bomb next to it

class FakeWall {
  float widthWall, heightWall;
  PVector pos;
  boolean isExplodedBool, removed;

  FakeWall(float w, float h, float x, float y) { //constructor
    //initilize values
    widthWall=w;
    heightWall=h;
    pos=new PVector(x, y);
    removed =false;
  }

  void run() {
    if (isExploded==2 && isExplodedBool) {
      goAway();
    } else {
      display();
      collision();
    }
  }

  void display() {
    pushMatrix();
    stroke(#FFD700);
    strokeWeight(3); 
    fill(#DAA520);
    rect(pos.x, pos.y, widthWall, heightWall); 
    for (int i=1; i<widthWall/45; i++) { //draw the walls
      for (int j=1; j<heightWall/15; j++) {
        for (int k=0; k<(heightWall/15)/2; k++) {
          line(pos.x+i*50, pos.y+k*30+15, pos.x+i*50, pos.y+k*30+30); 
          line(pos.x+i*50-25, pos.y+k*30, pos.x+i*50-25, pos.y+15+k*30);
          line(pos.x, pos.y+15*j, pos.x+widthWall, pos.y+15*j);
        }
      }
    }
    noStroke();
    popMatrix();
  }

  void goAway() { //remove wall
    removed = true;
  }

  void collision() {
    if (location.x >= pos.x && location.x <= pos.x+widthWall && location.y >= pos.y-10 && location.y <= pos.y+5) {//collision top
      location.y=pos.y-10;
    }
    if (location.x >= pos.x-10 && location.x <= pos.x+5 && location.y >= pos.y && location.y <= pos.y+heightWall) {//collision left
      location.x=pos.x-10;
    }
    if (location.x >= pos.x+widthWall && location.x <= pos.x+widthWall+5 && location.y >= pos.y && location.y <= pos.y+heightWall) {//collision right
      location.x=pos.x+widthWall+10;
    }
    if (location.x >= pos.x && location.x <= pos.x+widthWall && location.y >= pos.y+heightWall && location.y <= pos.y+heightWall+5) {//collision bottom
      location.y=pos.y+heightWall+10;
    }
  }
}
