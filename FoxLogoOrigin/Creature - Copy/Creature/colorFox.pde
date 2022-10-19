
class colorFox {
  float colorr = 125; 
  float colorg = 125;
  float colorb = 125;
  float alpha = 125;
  float lEyeX  = beginX; 
  float rEyeX  = beginX+M*80; 
  float lEyeY  = beginY+M*40; 
  float rEyeY  = beginY+M*40; 
  void colorDisplay() {
    stroke(colorr, colorg, colorb, alpha);
    //changes the color of the fox smoothly
    if (alpha <= 0 && alpha >=-5) {
      beginX=random(minOffsetX, (maxOffsetX - 40*M));
      beginY=random(minOffsetY, (maxOffsetY - 40*M));
      M = random(.2, 1.5);
    }
    //makes the eyes open and close
    if (alpha >=0 && alpha <=150) {
      //left eye
      noFill();
      arc(lEyeX, lEyeY, M*25, M*35, 0, 1.3*PI, CHORD);

      //right eye
      noFill();
      arc(rEyeX, rEyeY, M*25, M*35, -.3*PI, PI, CHORD);
    } else {
      //sleep left eye
      noFill();
      arc(lEyeX, lEyeY, M*25, M*35, .25*PI, PI);

      //sleep right eye
      noFill();
      arc(rEyeX, rEyeY, M*25, M*35, 0, .75*PI);
    }
    if (millis() - timer>=10) {
      colorr = colorr + random(-5, 5); 
      colorg = colorg + random(-5, 5);
      colorb = colorb + random(-5, 5);
      alpha = alpha + random(0, 3);
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
    if (alpha < -60 ) {
      alpha = alpha + 50;
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
    if (alpha > 255 ) {
      alpha = -50;
    }
  }
}
