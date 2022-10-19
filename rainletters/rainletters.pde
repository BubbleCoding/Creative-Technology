Word[] rain = new Word[50];
PFont font;

void setup() {
  smooth(4);
  font = loadFont("Garamond-48.vlw");
  
  textFont(font,40);
  size(1000, 500, P3D);
  for (int i=0; i<rain.length; i++) {
    rain[i] = new Word();
    rain[i].set();
  }
}

void draw() {

  background(0);
  

  for (int i=0; i<rain.length; i++) {
    rain[i].fall();
    rain[i].display();
  }
}
