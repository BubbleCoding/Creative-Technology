//class for the lanterns 
class Lantern {

  //attributes
  float widthOn=105;
  float heightOn=107;
  float x;
  float y;
  PImage lantern;
  PImage lanternOff;
  boolean on;


  //constructor
  Lantern(float lanternX, float lanternY, float widthLantern, float heightLantern) {
    this(lanternX, lanternY); //calling the default constructor 

    widthOn=widthLantern;
    heightOn=heightLantern;
  }
  //constructor default
  Lantern(float lanternX, float lanternY) {
    x=lanternX;
    y=lanternY;


    //loading images for the lanterns 
    lanternOff = loadImage("lanternOff.png");
    lantern = loadImage("Lantern.png");
  }

  void display() {
//handeling the displaying of the lanterns regarding to if they are on or off
//displaying the lantern as on is default, else the image is changed
    if (on) {

      image(lantern, x, y, widthOn, heightOn);
    } else {
      image(lanternOff, x, y, widthOn, heightOn);
    }
  }
//tell if the lanterns are on or off ??
  void turnOn() {
    on=true;
  }
}
