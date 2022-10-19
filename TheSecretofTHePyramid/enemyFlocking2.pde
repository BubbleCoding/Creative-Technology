//class that takes care of the flocking if the enemies

class Flock {
  ArrayList<Bird> birds;

  Flock() {
    birds = new ArrayList<Bird>();
  }

  void run() {

    for (Bird b : birds) {//rune class Bird for every boid
      b.run(birds);
    }
  }
  void addBird(Bird b) {//fuction that increase the size of the ArrayList birds
    birds.add(b);
  }
}
