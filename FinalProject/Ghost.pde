//class for the main Ghost

class Ghost { 

  //variables for the main ghost
  float ghostX;
  float ghostY;
  float startX;
  float startY;
  float ghostWidth;
  float ghostHeight;
  float speed = 8;
  PImage ghostImage;



  //ghost facing right or left if the left arrow key is pressed
  int lookingRight =1;


  //constructor main ghost
  Ghost(float startX, float startY) {
    ghostX=startX;
    ghostY=startY;
    ghostImage = loadImage("GhostLight.png");
  }

  void display() {
    //display main ghost
    imageMode(CENTER);
    pushMatrix();
    translate(ghostX, ghostY);

    scale(lookingRight, 1);
    image(ghostImage, 0, 0, 123, 92);
    popMatrix();
    imageMode(CORNER);
  }

  void getMoved(int code) { //move the ghost with the arrow keys 

    if (code == LEFT) {
      ghostX = ghostX-speed;
      lookingRight = -1;
    }
    if (code == RIGHT) {
      ghostX = ghostX+speed;
      lookingRight = 1;
    }
    if (code == UP) {
      ghostY = ghostY-speed;
    }
    if (code == DOWN) {
      ghostY = ghostY+speed;
    }

    //keeps the ghost from moving out of the screen
    if (ghostX<50) {
      ghostX = ghostX+speed;
    }
    if (ghostX>width-50) {
      ghostX = ghostX-speed;
    }
    if (ghostY<40) {
      ghostY = ghostY+speed;
    }
    if (ghostY>height-40) {
      ghostY = ghostY-speed;
    }
  }
}
