class Color {
  float colorr = 125; 
  float colorg = 125;
  float colorb = 125;
  int timer = millis();
  
  
  void colorDisplay() {
    //changes the color of the fox smoothly
    if (millis() - timer>=10) {
      colorr = colorr + random(-5, 5); 
      colorg = colorg + random(-5, 5);
      colorb = colorb + random(-5, 5);
      // x = x+(.3*PI);
      timer=millis();
    }
    //with this the rgb values cant go under 0
    if (colorr < 0 ) {
      colorr = colorr +10;
    }
    if (colorg < 0 ) {
      colorg = colorg +10;
    }
    if (colorb < 0 ) {
      colorb = colorb +10;
    }




    //with this the rgb values cant go over 255
    if (colorr > 255 ) {
      colorr = colorr-10;
    }
    if (colorg > 255 ) {
      colorg = colorg-10;
    }
    if (colorb > 255 ) {
      colorb = colorb-10;
    }

  }
}
