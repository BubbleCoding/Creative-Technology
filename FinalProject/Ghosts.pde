//class for the ghosts in the background

class Ghosts { 
  //attributes
  PImage ghostIm;
  float xGhosts= random(-1200, -100); //ghosts appear at random spots in that area
  float yGhosts= random(170, 600);
  float xspeed = 3; 
  float yspeed;
  float amplitude = 1;
  float angle = 0.0;
  float period = 100;

  //constructor ghost
  Ghosts() {
    ghostIm = loadImage("smallGhost.png");
  }

  //controls movment of the ghosts in the back
  void move() {
    xGhosts = xGhosts + xspeed;
    yspeed = amplitude * sin((frameCount/period)*TWO_PI);
    yGhosts = yGhosts + yspeed;

    //moves the ghosts to the left of the screen if they leave the screen on the right
    if (xGhosts>1100) {
      xGhosts= random(-100, -50);
      yGhosts = random(170, 600);
    }
  }
  //this is the ghost
  void show() {
    image(ghostIm, xGhosts, yGhosts);
  }
}
