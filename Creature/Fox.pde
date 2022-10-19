class Fox {
  float M = random(.05,.3);
  float maxOffsetX = width - 300*M;
  float maxOffsetY = height - 300*M;
  float minOffsetX = 300*M;
  float minOffsetY = 300*M;
  float beginX=random(minOffsetX, maxOffsetX) - 140*M;
  float beginY=random(minOffsetY, maxOffsetY) - 140*M;
  float colorr = 125; 
  float colorg = 125;
  float colorb = 125;
  float alpha = 125;
  int timer = millis();





  void display() { 
    strokeWeight(5*M);
    float coord1x = beginX; float coord2x = beginX-M*40; float coord3x = beginX-M*40; float coord4x = beginX-M*60; float coord5x = beginX+M*40; float coord6x = beginX+M*140; float coord7x = beginX+M*120; float coord8x = beginX+M*120; float coord9x = beginX+M*80;
    float coord1y = beginY; float coord2y = beginY-M*40; float coord3y = beginY+M*40; float coord4y = beginY+M*60; float coord5y = beginY+M*160; float coord6y = beginY+M*60; float coord7y = beginY+M*40; float coord8y = beginY-M*40; float coord9y = beginY;
    float lEyeX  = beginX; float rEyeX  = beginX+M*80; 
    float lEyeY  = beginY+M*40; float rEyeY  = beginY+M*40; 
    
    stroke(colorr, colorg, colorb, alpha);
    noFill();
    beginShape();
      vertex(coord1x,coord1y);
      vertex(coord2x,coord2y);
      vertex(coord3x,coord3y);
      vertex(coord4x,coord4y);
      vertex(coord5x,coord5y);
      vertex(coord6x,coord6y);
      vertex(coord7x,coord7y);
      vertex(coord8x,coord8y);
      vertex(coord9x,coord9y);
      vertex(coord1x,coord1y);
      vertex(coord3x,coord3y);
      vertex(coord5x,coord5y);
      vertex(coord7x,coord7y);
      vertex(coord9x,coord9y);
    endShape();

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

    //changes the color of the fox smoothly
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
    if (alpha <= 0 && alpha >=-5) {
      beginX=random(minOffsetX, (maxOffsetX - 40*M));
      beginY=random(minOffsetY, (maxOffsetY - 40*M));
      M = random(.05,.3);
    }
  }
}
