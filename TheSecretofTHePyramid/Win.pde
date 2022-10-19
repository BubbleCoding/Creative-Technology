// State 7 - WIN SCREEN 
//subclass of Screen

class Win extends Screen {
  PImage titleImg, button, text, rip;
  PVector pos, size;
  boolean mouseOver = false;
  float opacity;

  Win(ScreenState[] nextStates) {
    super(nextStates);
    //load images
    titleImg=loadImage("large.png");
    button=loadImage("retry.png");
    text=loadImage("win.png");
    //initilize PVectors
    pos=new PVector (width/2-100, height/2); 
    size = new PVector(200, 100);
  }

  void draw() {
    tint(255, 255);
    image(titleImg, 0, 0, width, height);
    image(text, 0, -10, width, height);
    update();
    if (mouseOver) { //check if mouse is over button
      opacity=120; //if so change opacity
    } else {
      opacity=200;
    }
    tint(255, opacity);
    image(button, pos.x, pos.y, size.x, size.y);
  }

  void update() {
    if ( isOver() ) {
      mouseOver = true;
    } else {
      mouseOver = false;
    }
  }

  void handleMousePress() { //called from mousePressed() in the main
    if (mouseOver) { 
      goToState(nextStates[0]);
    }
  }


  boolean isOver() { //method that checks if mouse is over button
    if (mouseX >= pos.x && mouseX <= pos.x+size.x && mouseY >= pos.y && mouseY <= pos.y+size.y) {
      return true;
    } else {
      return false;
    }
  }
}
