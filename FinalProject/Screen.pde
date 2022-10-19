//class for the easteregg screen  

class Screen {
  //attributes
  float screenX;
  float screenY;
  float screenWidth; 
  float screenHeight; 
  float size;
  boolean isSelected=false;
  Gif screenImage;

  //constructor
  Screen(Gif animation) {
    screenX=85;
    screenY=565;
    screenWidth=134;
    screenHeight=79;
    screenImage = animation;
  }

//video gets played if screen is clicked
  void display() {
    if (isSelected) {
      pushMatrix();
      translate(screenX, screenY);
      rotate(-PI/25);
      image(screenImage, 0, 0, screenWidth, screenHeight);
      popMatrix();
    }
  }

//check if mouse is over the screen and play video if the screen is clicked
  void isOver(float xPos, float yPos) {
    if (xPos >= screenX && xPos <= screenX + screenWidth) {
      if (yPos >= screenY && yPos < screenY + screenHeight) {
        isSelected = !isSelected;
        screenImage.play();
      }
    }
  }
}
