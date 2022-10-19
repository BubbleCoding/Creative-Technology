//class for the bats flying over the screen
class Bat{
float timer;
float timer2;
PImage batUp;
PImage batDown;
PImage bat;
float batX = random(200,800);
float batY = random(100,800);
float speedBatX;
float speedBatY;
float batFlapSpeed = 100; //millis between flap

  //constructor
  Bat(){
    batUp = loadImage("batUp.png");
    batDown = loadImage("batDown.png");
    bat = loadImage("bat.png");
      }

void display(){
  //makes the wings of the bat flap
  if(millis() - timer < batFlapSpeed){
    image(batUp,batX,batY,50,50);
  } else if(millis() - timer < batFlapSpeed*2){
    image(bat,batX,batY,50,50);
  }else if(millis() - timer < batFlapSpeed*3){
    image(batDown,batX,batY,50,50);
  }else if(millis() - timer < batFlapSpeed*4){
    image(bat,batX,batY,50,50);
  }else{
  timer = millis();
  }
  }
  
void move(){
  //keeps the bat from flying off the screen too far
  if(batX < -100){
  batX = batX - speedBatX;
  }
  if(batX > width){
  batX = batX - speedBatX;
  }
  if(batY < -100){
  batY = batY - speedBatY;
  }
  if(batY > height){
  batY = batY - speedBatY;
  }

  //movement of the bat
  if(millis()-timer2>=500){
  if(batX < 200){
    speedBatX = speedBatX +random(2);
    speedBatY = speedBatY +random(-1,1);
    timer2 = millis();
  }else if(batX > 1100){
    speedBatX = speedBatX +random(-2,0);
    speedBatY = speedBatY +random(-1,1);
    timer2 = millis();
  }else if(batY < 150){
    speedBatX = speedBatX +random(-1,1);
    speedBatY = speedBatY +random(2);
    timer2 = millis();
  } else if(batY > 700){
    speedBatX = speedBatX +random(-1,1);
    speedBatY = speedBatY +random(-2,0);
    timer2 = millis();
  } else {
    speedBatX = speedBatX +random(-1,1);
    speedBatY = speedBatY +random(-1,1);
    timer2 = millis();
  }
  }
  batX=batX+speedBatX;
  batY=batY+speedBatY;

 }
}
