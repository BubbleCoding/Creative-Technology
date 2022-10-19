//class that creates the individual enemy of the flock

class Bird {
  float drawX, drawY, directionY, directionX, distance, drawLengthX, drawLengthY, maxSpeed, r;
  PVector speed, position, direction, v1, v2, v3, v4, v5;
  boolean collide=false;

  Bird(float x, float y) { //constructor
  //initilize values
    speed =  PVector.random2D();
    position= new PVector(x, y);
    r=.5;
    maxSpeed = 0.3;
  }

  void run(ArrayList<Bird> birds) {
    flock(birds);
    borders();
    display();
  }

  void flock(ArrayList<Bird> birds) {

    if (position.dist(location)<100) {
      v1 = rule1(birds);//rule that makes the boids fly towards the same perceived location
      v4= new PVector(0, 0);
    } else {
      v4 = rule4(birds);
      v1= new PVector(0, 0);
    }

    v2 = rule2(birds);//rule that makes the boids stay away from eachother a small amount
    v3 = rule3(birds);//rule that makes the speed of all the boids somewhat the same


    //weigths of the rules
    v1.mult(1);
    v2.mult(3);
    v3.mult(1);
    v4.mult(1);

    //add all the rules to the speed and limit the speed so that they wont move with the speed of light
    speed.add(v1);
    speed.add(v2);
    speed.add(v3);
    speed.add(v4);
    speed.limit(maxSpeed);
    position.add(speed);
  }

  void display() {
    float theta = speed.heading() + radians(90);

    //form of the boids
    fill(200, 100);
    stroke(255);
    pushMatrix();
    shapeMode(CENTER);
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(5*r, -30*r);
    vertex(0, -10*r);
    vertex(4*r, -10*r);
    vertex(4*r, -8*r);
    vertex(2*r, -8*r);
    vertex(2*r, 0);
    vertex(5*r, 0);
    vertex(5*r, -30*r);
    endShape();
    noStroke();
    popMatrix();

    if (dist(location.x, location.y, position.x, position.y)<=2*r) {
      death=true;
    }
  }

  //bounce the boids of the borders
  void borders() {
    if (position.x < 30) speed.x = speed.x*-1;
    if (position.y <30) speed.y = speed.y*-1;
    if (position.x > width-30) speed.x = speed.x*-1;
    if (position.y > height-30) speed.y = speed.y*-1;
  }



  //rule that makes the boids fly towards the character if the character is in the area
  //this rule returns a vector that is the perceived center of nearby boids of a specific boid using there speed not location. This is used to generate the direction the boids are heading
  PVector rule1(ArrayList<Bird>birds) {

    drawLengthX= position.x;
    drawLengthY= position.y;
    drawX= location.x;
    drawY = location.y;
    directionX = drawX-drawLengthX;
    directionY = drawY-drawLengthY;
    direction = new PVector(directionX, directionY);
    direction.normalize();
    direction.mult(2);
    position.add(direction);
    return direction;
  }



  //rule that makes the boids stay away from eachother a small amount
  //this returns a vector that is in the opposite direct of other boids in a certain area around a specific boid
  PVector rule2(ArrayList<Bird> birds) {
    PVector c = new PVector(0, 0, 0);
    float desiredDistance=25;
    float distance=0;
    for (Bird b : birds) {
      distance = PVector.dist(position, b.position);//distance between two boids
      if (distance >0 && distance<desiredDistance) {//if boid is nearby other boids subtract boid of other boid and add that to vector c
        PVector k = PVector.sub(position, b.position);
        k.div(distance);
        k.normalize();
        k.div(10);
        c.add(k);
      }
    }
    return c;
  }

  //rule that makes the speed of all the boids somewhat the same
  //this rule return a vector that is a fraction of the avarage velocity of other boids in a certain area around a specific boid
  PVector rule3(ArrayList<Bird>birds) {
    PVector perceivedSpeed = new PVector(0, 0);
    float desiredDistance=50;
    float distance=0;
    float counter=0;
    for (Bird b : birds) {
      distance = PVector.dist(position, b.position);//distance between two boids
      if (distance >0 && distance<desiredDistance) {//if boid is nearby other boids add speed of other boid to perceivedSpeed and counter +1 for every other boid
        perceivedSpeed.add(b.speed);
        counter++;
      }
    }
    if (counter>0) {//if the counter is higher then 0 take the avarge of the perceivedSpeed and return a fraction of the perceivedSpeed
      perceivedSpeed.div(counter);
      perceivedSpeed.div(4);
      return perceivedSpeed;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector rule4(ArrayList<Bird>birds) {
    float desiredDistance = 150;
    int counter=0;
    PVector perceivedCenter = new PVector(0, 0);
    for (Bird b : birds) {
      float distance = PVector.dist(location, b.position);//distance between two boids
      if (distance >0 && distance<desiredDistance) {//if boid is nearby other boids add speed to perceivedCenter of other boids and counter + 1 per other boid
        perceivedCenter.add(b.speed);
        counter++;
      }
    }
    if (counter>0) {
      perceivedCenter.div(counter);
      perceivedCenter.div(1000);
      return perceivedCenter;
    } else {
      return new PVector(0, 0);
    }
  }
}