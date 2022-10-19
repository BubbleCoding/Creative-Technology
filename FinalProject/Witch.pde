//class for the witch flying over the screen
class Witch {

  float witchX =width;
  float witchY=random(200, 700);
  float witchSpeedX = 5;
  float witchSpeedY;
  float witchWidth = 150;
  float witchHeight = 98;
  float amplitude = 1;
  float period = 100;
  PImage witch;

  Witch() {
    witch = loadImage("witch.png");
  }
  void display() {
    image(witch, witchX, witchY, witchWidth, witchHeight);
  }
  void move() {
    //movement of the witch
    witchSpeedY = amplitude * sin((frameCount/period)*TWO_PI);
    witchY = witchY + witchSpeedY;
    witchX = witchX-witchSpeedX;

    //moves the witch from the left to the right of the screen if x pixels off screen
    if (witchX <-1000) {
      witchX = width+200;
      witchY = random(100, 800);
    }
  }
  //makes a sound when witch is clicked
  void sound() { 
    if (mouseX > witchX && mouseX < witchX+witchWidth && mouseY > witchY && mouseY < witchY+witchHeight) {
      witchLaugh.play();
    }
  }
}
