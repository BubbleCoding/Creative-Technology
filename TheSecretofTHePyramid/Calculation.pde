//class that calculates the mass spring damper
class Calculation {
  Slider slider;
  float velocity,friction,frictionConstant,position,springConstant,mass,m;
  boolean x;

  Calculation(float v, float posx) {
    velocity = -v;
    friction = 2;
    frictionConstant =0.25;
    springConstant = 100;
    mass = 15;
    x = true;
    position=posx;
    
  }

  void math() {
    velocity += -friction/mass;//calculate the velocity
    position += velocity;//calculate the location with respect to the velocity
    friction = position/springConstant + frictionConstant*velocity;//caluclate the friction
  }
}