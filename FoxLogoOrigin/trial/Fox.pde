class Fox {
  //i stands for initial
  float xi;
  float yi;
  float M;
  float colorr = 125; 
  float colorg = 125;
  float colorb = 125;
  int timer = millis();
  //multiplier
  


  Fox(float x, float y, float Multiplier) {
    xi=x;
    yi=y;
    M=Multiplier;
  }

  void display() { 
    strokeWeight(5);

    beginShape();
    //l stands for left
    
    float punt1x = xi-40; float punt2x = xi-40; float punt3x = xi-40; float punt4x = xi-40; float punt5x = xi-40; float punt6x = xi-40; float punt7x = xi-40; float punt8x = xi-40; float punt9x = xi-40;
    float punt1y = yi-80; float punt2y = yi-80; float punt3y = yi-80; float punt4y = yi-80; float punt5y = yi-80; float punt6y = yi-80; float punt7y = yi-80; float punt8y = yi-80; float punt9y = yi-80;
    //r stands for right
    float xr = punt1x+80;
    float yr = punt1y;
    vertex(punt1x,punt1y);
    vertex(punt2x,punt2y);
    vertex(punt3x,punt3y);
    vertex(punt4x,punt4y);
    vertex(punt5x,punt5y);
    vertex(punt6x,punt6y);
    vertex(punt7x,punt7y);
    vertex(punt8x,punt8y);
    vertex(punt9x,punt9y);
    endShape(CLOSE);


    stroke(colorr, colorg, colorb);

    ////horizontal line
    //line(punt1x, punt1y, xr, yr);

    ////diamond side 1 left
    //line(punt1x, punt1y, punt1x-40, punt1y+40);
    ////diamond side 2 left
    //line(punt1x-40, punt1y+40, punt1x+40, punt1y+160);
    ////diamond side 1 right
    //line(xr, yr, xr+40, yr+40);
    ////diamond side 2 right
    //line(xr+40, yr+40, punt1x+40, punt1y+160);

    ////left ear
    ////vertical line
    //line(punt1x-40, punt1y+40, punt1x-40, punt1y-40);
    ////diagnal line
    //line(punt1x-40, punt1y-40, punt1x, punt1y);

    ////right ear
    ////verical line
    //line(xr+40, yr+40, xr+40, yr-40);
    ////diagnal line
    //line(xr+40, yr-40, xr, yr);

    ////left cheek
    //line(punt1x-40, punt1y+40, punt1x-60, punt1y+60);
    //line(punt1x-60, punt1y+60, punt1x+40, punt1y+160);

    ////right cheek
    //line(xr+40, yr+40, xr+60, yr+60);
    //line(xr+60, yr+60, punt1x+40, punt1y+160);

    ////hat
    //line(punt1x, punt1y, punt1x+10, (punt1y-80)/M);
    //line(xr, punt1y, xr-10, (punt1y-80)/M);
    ////line(punt1x+3,punt1y-10,xr-3,punt1y-10);
    //line(punt1x+5, punt1y-20, xr-5, punt1y-20);
    //line(punt1x+10, (punt1y-80)/M, xr-10, (punt1y-80)/M);

    //makes the eyes open and close
    if (keyPressed == true) {
      //left eye
      noFill();
      arc(punt1x, punt1y+40, 25, 35, 0, 1.3*PI, CHORD);

      //right eye
      noFill();
      arc(xr, punt1y+40, 25, 35, -.3*PI, PI, CHORD);
    } else if (keyPressed == false) {
      //sleep left eye
      noFill();
      arc(punt1x, punt1y+40, 25, 35, .25*PI, PI);

      //sleep right eye
      noFill();
      arc(xr, punt1y+40, 25, 35, 0, .75*PI);
    }

    //changes the color of the fox smoothly
    if (millis() - timer>=.1) {
      colorr = colorr + random(-5, 5); 
      colorg = colorg + random(-5, 5);
      colorb = colorb + random(-5, 5);
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
