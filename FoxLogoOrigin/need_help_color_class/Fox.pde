Color C;

class Fox {
  float beginX;
  float beginY;
  float M;
  float alpha = 125;
  int timer = millis();
  //float x = 5;
  //float alpha = sin(radians(x));


  


  Fox(float Multiplier) {
    M=Multiplier;
    float maxOffsetX = width - 110*M;
    float maxOffsetY = height - 120*M;
    float minOffsetX = 110*M;
    float minOffsetY = 110*M;
    beginX=random(minOffsetX,maxOffsetX) - 40*M;
    beginY=random(minOffsetY,maxOffsetY) - 40*M;
  }

  void display() { 
    strokeWeight(5);
   
   
    float punt1x = beginX; float punt2x = beginX-M*40; float punt3x = beginX-M*40; float punt4x = beginX-M*60; float punt5x = beginX+M*40; float punt6x = beginX+M*140; float punt7x = beginX+M*120; float punt8x = beginX+M*120; float punt9x = beginX+M*80;
    float punt1y = beginY; float punt2y = beginY-M*40; float punt3y = beginY+M*40; float punt4y = beginY+M*60; float punt5y = beginY+M*160; float punt6y = beginY+M*60; float punt7y = beginY+M*40; float punt8y = beginY-M*40; float punt9y = beginY;
    float lEyeX  = beginX; float rEyeX  = beginX+M*80; 
    float lEyeY  = beginY+M*40; float rEyeY  = beginY+M*40; 



    stroke(colorr, colorg, colorb, alpha);

    //horizontal line
    line(punt1x, punt1y, punt9x, punt9y);

    //diamond side 1 left
    line(punt1x, punt1y, punt3x, punt3y);
    //diamond side 2 left
    line(punt3x, punt3y, punt5x, punt5y);
    //diamond side 1 right
    line(punt9x, punt9y, punt7x, punt7y);
    //diamond side 2 right
    line(punt7x, punt7y, punt5x, punt5y);

    //left ear
    //vertical line
    line(punt2x, punt2y, punt2x, punt3y);
    //diagnal line
    line(punt1x, punt1y, punt2x, punt2y);

    //right ear
    //verical line
    line(punt7x, punt7y, punt8x, punt8y);
    //diagnal line
    line(punt8x, punt8y, punt9x, punt9y);

    //left cheek
    line(punt3x, punt3y, punt4x, punt4y);
    line(punt4x, punt4y, punt5x, punt5y);

    //right cheek
    line(punt5x, punt5y, punt6x, punt6y);
    line(punt6x, punt6y, punt7x, punt7y);

    //hat
    //line(beginX, beginY, beginX+10, (beginY-80)/M);
   // line(beginX+80, beginY, beginX+80-10, (beginY-80)/M);
    //line(beginX+3,beginY-10,beginX+80-3,beginY-10);
    //line(beginX+5, beginY-20, beginX+80-5, beginY-20);
   // line(beginX+10, (beginY-80)/M, beginX+80-10, (beginY-80)/M);

    //makes the eyes open and close
    if (alpha >=0 && alpha <=100) {
      //left eye
      noFill();
      arc(lEyeX, lEyeY, M*25, M*35, 0, 1.3*PI, CHORD);

      //right eye
      noFill();
      arc(rEyeX, rEyeY, M*25, M*35, -.3*PI, PI, CHORD);
    } 
      else{
      //sleep left eye
      noFill();
      arc(lEyeX, lEyeY, M*25, M*35, .25*PI, PI);

      //sleep right eye
      noFill();
      arc(rEyeX, rEyeY, M*25, M*35, 0, .75*PI);
    }
    if (millis() - timer>=10) {
      alpha = alpha + random(-2, 5);
      // x = x+(.3*PI);
      timer=millis();
    }
    if (alpha < -60 ) {
      alpha = alpha + 50;
    }
    if (alpha > 255 ) {
      alpha = -50;
    }
    if (alpha <= 0 && alpha >=-5) {
      beginX=random(110*M, width - 110*M) - 40*M;
      beginY=random(110*M, height - 120*M) - 40*M;
    }
    C.colorDisplay();
    
  }
}
