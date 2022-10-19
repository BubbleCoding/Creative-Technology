colorFox ColorFox = new colorFox();

float M;
float maxOffsetX = width - 110*M;
float maxOffsetY = height - 120*M;
float minOffsetX = 110*M;
float minOffsetY = 110*M;
float beginX=random(minOffsetX, maxOffsetX) - 40*M;
float beginY=random(minOffsetY, maxOffsetY) - 40*M;



int timer = millis();

class Fox {

  void display() { 
    ColorFox.colorDisplay();
    strokeWeight(5*M);
    float coord1x = beginX; float coord2x = beginX-M*40; float coord3x = beginX-M*40; float coord4x = beginX-M*60; float coord5x = beginX+M*40; float coord6x = beginX+M*140; float coord7x = beginX+M*120; float coord8x = beginX+M*120; float coord9x = beginX+M*80;
    float coord1y = beginY; float coord2y = beginY-M*40; float coord3y = beginY+M*40; float coord4y = beginY+M*60; float coord5y = beginY+M*160; float coord6y = beginY+M*60; float coord7y = beginY+M*40; float coord8y = beginY-M*40; float coord9y = beginY;
    
    noFill();
    beginShape();
    vertex(coord1x, coord1y);
    vertex(coord2x, coord2y);
    vertex(coord3x, coord3y);
    vertex(coord4x, coord4y);
    vertex(coord5x, coord5y);
    vertex(coord6x, coord6y);
    vertex(coord7x, coord7y);
    vertex(coord8x, coord8y);
    vertex(coord9x, coord9y);
    vertex(coord1x, coord1y);
    vertex(coord3x, coord3y);
    vertex(coord5x, coord5y);
    vertex(coord7x, coord7y);
    vertex(coord9x, coord9y);
    endShape();
    
  }
}
