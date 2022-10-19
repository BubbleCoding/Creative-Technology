float r, g, b;
PImage dragon;


void setup() {
  smooth(4);
  size(900, 900);
  dragon = loadImage("drunksAndDragons.png");
}

void draw() {
  image(dragon, 0, 0);

  loadPixels();
  dragon.loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int loc = x+y*width;
      r= red(dragon.pixels[loc]);
      g= green(dragon.pixels[loc]);
      b= blue(dragon.pixels[loc]);
      float factor;
      factor = mouseX/width;

      pixels[loc] = color(r*factor, g, b);
    }
  }
  updatePixels();
}
