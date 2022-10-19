class WaveTrap {
  PVector position;
  float pn, counter, amount, deviation;

  WaveTrap(PVector x, float a, float m) {
    pn=0;
    counter = 0.01;
    position =x;
    amount = a;
    deviation =m;
  }

  void display() {
    fill(20);
    for (int i =0; i<amount; i++) {//a hazard made with perlin noise
      ellipse(position.x+10*i, position.y+(deviation*noise(pn+(i*0.03))), 10, 10);
      if (dist(location.x, location.y, position.x+10*i, position.y+(deviation*noise(pn+(i*0.03))))<=10) {
        death=true;
      }
    }
    pn +=counter;
  }
}