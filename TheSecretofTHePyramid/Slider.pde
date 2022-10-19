//class that creates a mass spring damper hazard
class Slider {
  Calculation calc;
  PVector slider;

  Slider(float s, PVector pos) {//constructor
  //initilize PVectors
    calc = new Calculation(s, pos.x);
    slider=new PVector(0, 0);
    slider.set(pos);
  }

  void display() {
    calc.math(); //call calculation function
    fill(#FFBD33);
    ellipse(calc.position+slider.x, slider.y, 50, 50);//draw the linear MSDS sphere    
    if (dist(calc.position+slider.x, slider.y, location.x, location.y)<=50) { //check if character is touched by the hazard
      death=true;
    }
  }
}