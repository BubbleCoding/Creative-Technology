//class for the clouds
class Cloud {

  //attributes 
  float xCloud;
  float yCloud;
  float cloudSpeedX=0.3;


  //images
  PImage cloudImage;


  //constructor cloud
  Cloud(float xPos, float yPos) {
    xCloud=xPos;
    yCloud=yPos;

    //load the image
    cloudImage = loadImage("cloud.png");
  }

  void display() {
    image(cloudImage, xCloud, yCloud);
  }
  void moveClouds() {

    xCloud=xCloud+cloudSpeedX;

    //moves the clouds from the right back to the start of the screen if they get out of the screen 
    if (xCloud>=900) {
      xCloud = -80;
    }
  }
}
