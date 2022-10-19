class Flake{
  float xFlake,yFlake,zFlake;
  float xspeedFlake, yspeedFlake;
  
  Flake( float _x,float _y,float _z,float _xspeed, float _yspeed){
    xFlake = _x;
    yFlake = _y;
    zFlake = _z;
    xspeedFlake = _xspeed;
    yspeedFlake = _yspeed;
    
  }

  void movement(){
    yFlake=yFlake+xspeedFlake;
    xFlake=xFlake+yspeedFlake;
  }
  
  void display(){

  }
}
