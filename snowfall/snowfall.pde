
Flake[] flakes = new Flake[500];

void setup(){
size(1000,500,P3D);
  for(int i=0;i<flakes.length;i++){
  flakes[i] = new Flake(1,1,1,1,1);
  }
}

void draw(){
  background(0);
  for(int i=0;i<flakes.length;i++){
  flakes[i].display();
  flakes[i].movement();
  }
  
}
