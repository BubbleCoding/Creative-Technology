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


    //l stands for left
    float xl = xi-40;
    float yl = yi-80;
    //r stands for right
    float xr = xl+80;
    float yr = yl;


    stroke(colorr, colorg, colorb);

    //horizontal line
    line(xl, yl, xr, yr);

    //diamond side 1 left
    line(xl, yl, xl-40, yl+40);
    //diamond side 2 left
    line(xl-40, yl+40, xl+40, yl+160);
    //diamond side 1 right
    line(xr, yr, xr+40, yr+40);
    //diamond side 2 right
    line(xr+40, yr+40, xl+40, yl+160);

    //left ear
    //vertical line
    line(xl-40, yl+40, xl-40, yl-40);
    //diagnal line
    line(xl-40, yl-40, xl, yl);

    //right ear
    //verical line
    line(xr+40, yr+40, xr+40, yr-40);
    //diagnal line
    line(xr+40, yr-40, xr, yr);

    //left cheek
    line(xl-40, yl+40, xl-60, yl+60);
    line(xl-60, yl+60, xl+40, yl+160);

    //right cheek
    line(xr+40, yr+40, xr+60, yr+60);
    line(xr+60, yr+60, xl+40, yl+160);

    //hat
    line(xl, yl, xl+10, (yl-80)/M);
    line(xr, yl, xr-10, (yl-80)/M);
    //line(xl+3,yl-10,xr-3,yl-10);
    line(xl+5, yl-20, xr-5, yl-20);
    line(xl+10, (yl-80)/M, xr-10, (yl-80)/M);

    //makes the eyes open and close
    if (keyPressed == true) {
      //left eye
      noFill();
      arc(xl, yl+40, 25, 35, 0, 1.3*PI, CHORD);

      //right eye
      noFill();
      arc(xr, yl+40, 25, 35, -.3*PI, PI, CHORD);
    } else if (keyPressed == false) {
      //sleep left eye
      noFill();
      arc(xl, yl+40, 25, 35, .25*PI, PI);

      //sleep right eye
      noFill();
      arc(xr, yl+40, 25, 35, 0, .75*PI);
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
