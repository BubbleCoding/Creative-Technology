//class that create a bullet and takes care of the shooting

class Bullet {

  ArrayList<Bullet> bullets; 
  PVector position, direction, velocity, location2;
  float drawX, drawY, directionY, directionX, distance, drawLengthX, drawLengthY, timer=0, speed, lifespan;
  boolean isDead;

  Bullet(PVector l, PVector s) {//constructor of the bullets
    //initilize values
    velocity = s;
    location2 = l;
    lifespan = 240;
    bullets = new ArrayList<Bullet>();
    speed = 10;
  }

  void run() {
    update();
    display();
  }
  void update() {
    lifespan -=8;//"ages" the partciles

    for (int i =0; i < bullets.size(); i++) { //loop through bullets array
      Bullet b = bullets.get(i);
      b.update();
      b.display();

      if (b.isDead()==true) {
        bullets.remove(i);
        i--;
      }
    }
  }

  boolean isDead() {//boolean that will return true if a bullet is "dead" and false if it is stil "alive"
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    pushMatrix();
    fill(#2148CE, lifespan);
    location2.sub(velocity);//change the location of the particles
    ellipse(location2.x, location2.y, lifespan/20, lifespan/20);
    popMatrix();
  }

  void handleMousePress() { //called from mousePressed() in main
    if (timer+1000<millis()) {
      position = new PVector(location.x, location.y);
      drawLengthX= mouseX;
      drawLengthY= mouseY;
      drawX= location.x;
      drawY = location.y;
      directionX = drawX-drawLengthX;
      directionY = drawY-drawLengthY;
      direction = new PVector(directionX, directionY);
      direction.normalize();
      direction.mult(speed);
      bullets.add(new Bullet(position, direction));//create a bullet
      timer=millis();
    }
  }
}
