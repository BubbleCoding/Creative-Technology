class Hexagon {
  float numberH, numberW, size, startX, startY, currentX, currentY, lastX, lastY, beginX, beginY, rest, buildFromTop, buildFromBot, centerX, centerY;
  float red, blue, green, angle, angleRed, angleBlue, angleGreen;
  int counter;


  Hexagon(float x, float y, float z, float startx, float starty) {
    numberH = x;
    numberW = y;
    centerX = startx;
    centerY = starty;
    size = z;
    rest = numberH%2;
    buildFromTop = (numberH+rest)/2;
    buildFromBot = (numberH-rest)/2;
    startX = startx-(sin(PI/3)*2*size*(y/2));
    startY = starty-((x/2)*size)-buildFromBot*(size*sin(PI/6));
  }


  void update() {
    control();
  }


  void shape() {

    beginShape();
    currentY = beginY+size;
    currentX = beginX;
    colorHex();
    fill(red, green, blue);
    stroke(0);
    vertex(beginX, beginY);
    vertex(currentX, currentY);
    lastX = currentX;
    lastY = currentY;
    currentX = currentX + size*cos(PI/6);
    currentY = currentY + size*sin(PI/6);
    vertex(currentX, currentY);
    lastX = currentX;
    lastY = currentY;
    currentX = currentX + size*cos(PI/6);
    currentY = currentY - size*sin(PI/6);
    vertex(currentX, currentY);
    lastX = currentX;
    lastY = currentY;
    currentY=currentY-size;
    vertex(currentX, currentY);
    lastX = currentX;
    lastY = currentY;
    currentX = currentX - size*cos(PI/6);
    currentY = currentY - size*sin(PI/6);
    vertex(currentX, currentY);
    lastX = currentX;
    lastY = currentY;
    currentX = currentX - size*cos(PI/6);
    currentY = currentY + size*sin(PI/6);
    vertex(currentX, currentY);
    endShape(CLOSE);
    beginX=beginX+(sin(PI/3)*2*size);
  }


  void control() {
    if (numberH>counter) {
      beginX = startX;
      beginY = startY;
      for (int i =0; i<numberW; i++) {
        shape();
      }
      counter++;
      if (buildFromTop>counter) {
        startX = startX-size*cos(PI/6);
        startY = startY+size+size*sin(PI/6);
        numberW++;
      } else if (numberH>counter) {
        startX = startX+size*cos(PI/6);
        startY = startY+size+size*sin(PI/6);
        numberW--;
      }
    }
  }
  void colorHex() {
    if (centerX<currentX && centerY>currentY) {//Q1
      angle = (atan(((centerY-currentY)/(currentX-centerX)))*(180/PI));
    } else if (centerX>currentX && centerY>currentY) {//Q2
      angle = 90-(atan(((centerY-currentY)/(centerX-currentX)))*(180/PI))+90;
    } else if (centerX>currentX && centerY<currentY) {//Q3
      angle = 90-(atan(((centerX-currentX)/(currentY-centerY)))*(180/PI))+180;
    } else if (centerX<currentX && centerY<currentY) {//Q4
      angle = (atan(((currentX-centerX)/(currentY-centerY)))*(180/PI))+270;
    }
    //red
    if (angle<=150 && angle >=30) {
      red = map(angle, 30, 150, 255, 0);
    } else if (angle <= 30) {
      red = map(angle, 0, 30, 191.25, 255 );
    } else if (angle >=270 ) {
      red = map(angle, 270, 360, 0, 191.25);
    } else {
      red=0;
    }
    //green
    if (angle>=30 && angle <= 150) {
      green = map(angle, 30, 150, 0, 255);
    } else if (angle>=150 && angle <= 270) {
      green = map(angle, 150, 180, 255, 191.25);
    } else {
      green =0;
    }
    //blue
    if (angle>=120 && angle <= 240) {
      blue = map(angle, 120, 240, 0, 255);
    } else if (angle>=240 && angle <= 360) {
      blue = map(angle, 240, 360, 255, 0);
    } else {
      blue =0;
    }
  }
}
