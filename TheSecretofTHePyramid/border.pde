//class that creates the border around the levels

class Border {
  boolean borderL, borderR, borderU, borderD;
  float widthBorder=30;
  float characterSize = 10;

  void border() {//this code generates a border for all the stages
    pushMatrix();
    stroke(#DAA520);
    strokeWeight(3);  
    fill(#FFD700);
    if (borderR) {//visable border right side
      rect(width-widthBorder, 0, widthBorder, height);
       line(width-widthBorder/2,0,width-widthBorder/2,height);
       for(int i=1; i<13;i++){
      line(width,i*50,width-widthBorder/2,i*50);
      line(width-widthBorder/2,i*50-25,width-widthBorder,i*50-25);
      }
    }
    if (borderL) {//visable border left side
      rect(0, 0, widthBorder, height);
       line(widthBorder/2,0,widthBorder/2,height);
       for(int i=1; i<13;i++){
      line(0,i*50,widthBorder/2,i*50);
      line(widthBorder/2,i*50-25,widthBorder,i*50-25);
      }
    }
    if (borderU) {//visable border top side
      rect(0, 0, width, widthBorder);
      line(0,widthBorder/2,width,widthBorder/2);
      for(int i=1; i<13;i++){
      line(i*50,0,i*50,widthBorder/2);
      line(i*50-25,widthBorder/2,i*50-25,widthBorder);
      }
    }
    if (borderD) {//visable border bottom side
    
      rect(0, height-widthBorder, width, widthBorder);
      
      line(0,height-widthBorder/2,width,height-widthBorder/2);
      for(int i=1; i<13;i++){
      line(i*50,height,i*50,height-widthBorder/2);
      line(i*50-25,height-widthBorder/2,i*50-25,height-widthBorder);
      }
    }
    noStroke();
    popMatrix();
    if (location.x > width-(characterSize+widthBorder) && borderR ) {//if the player is near this border and the active stage has a border in place there dont move over the border
      location.x = width-(characterSize+widthBorder);
    }
    if (location.x < (characterSize+widthBorder) && borderL) {//if the player is near this border and the active stage has a border in place there dont move over the border
      location.x = (characterSize+widthBorder);
    }
    if (location.y > height-(characterSize+widthBorder) && borderD) {//if the player is near this border and the active stage has a border in place there dont move over the border
      location.y = height-(characterSize+widthBorder);
    }
    if (location.y < (characterSize+widthBorder) && borderU) {//if the player is near this border and the active stage has a border in place there dont move over the border
      location.y = (characterSize+widthBorder);
    }
  }
}
