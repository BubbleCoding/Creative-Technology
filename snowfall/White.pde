class White extends Flake {
float x;
float y;
float z;
float yspeed;
float xspeed;

  White(float x, float y, float z, float xspeed, float yspeed) {
    super(x, y, z, xspeed, yspeed);
    x=random(width);
    y=random(-height, 0);
    z = random(0, 200);
    yspeed = 5;
    xspeed = 2;
  }

  void display() {
    stroke(255);
    ellipse(x, y, 5, 5);

    if (y>height) {
      x=random(width);
      y=random(-100, 0);
      z=random(0, 100);
      xspeed=random(2, 5);
      yspeed=random(2, 5);
    }
  }
}
