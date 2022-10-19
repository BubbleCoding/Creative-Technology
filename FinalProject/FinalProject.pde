
//Programming for WCI
//final project
//Rover Vos & Nathalie Kamp
//Updated version for the Resit
//06.11.2018

//libaries 
import processing.sound.*;
import gifAnimation.*;

//create arrays
Ghosts[] ghosts = new Ghosts[30]; //array for ghosts in the back
Lantern[] lanterns= new Lantern[8]; //array for the lanterns 
Bat[] bat = new Bat[20]; //array for bats
Cloud[] clouds = new Cloud[3]; //array for the clouds 

//global variables
//background artwork
PImage background; 
PImage tower1;
PImage tower2;
PImage buildingLeft;
PImage bigTower;
PImage backgroundGhosts;
PImage curtains;

PImage moonImage;

//booleans for the bell interaction
boolean allLanternsOn;
boolean Fix = true; //making sure the bell sounds nice

//call functions
SoundFile bell;
SoundFile witchLaugh;
Ghost mainGhost;
Screen screen;
Gif screenImage;
Witch witch;

void setup() {
  smooth(4);
  size(1310, 941);

  //loading all the needed images from the artwork
  background = loadImage("paintingFinalProject.png");

 backgroundGhosts = loadImage("BackgroundGhosts.png");
  tower1 = loadImage("tower1.png");
  tower2 = loadImage("tower2.png");
  bigTower = loadImage("bigTower.png");
  buildingLeft = loadImage("BuildingLeft.png");
  curtains = loadImage("curtains.png");

  moonImage = loadImage("moon.png");

  //loading all the used sound files
  // loading sound file for the church bell
  bell = new SoundFile(this, "bell.wav");

  //loading sound file for witch laugh
  witchLaugh = new SoundFile(this, "witchLaugh.wav");

  //array of clouds
  clouds[0] = new Cloud(600, 100);  
  clouds[1] = new Cloud(60, 80); 
  clouds[2] = new Cloud(300, 60);



  // array of lanterns
  lanterns[0]= new Lantern( 240, 635); //the first lantern on the road 
  lanterns[1]= new Lantern( 460, 690, 68, 70);//the smaller one on the left 
  lanterns[2]= new Lantern(495, 690, 68, 70);//the smaller one on the right
  lanterns[3]= new Lantern( 470, 410); // the one on the top of the middle tower 
  lanterns[4]= new Lantern( 193, 738); // second lantern on the road 
  lanterns[5]= new Lantern(290, 780); // third lantern on the road 
  lanterns[6]= new Lantern( 790, 500); //first lantern on the bigtower on the right 
  lanterns[7]= new Lantern( 927, 490); //second lantern on the bigtower on the right



  //loading gif file for the screen
  screenImage = new Gif(this, "ghost.gif");

  //constructor main ghost
  mainGhost =new Ghost(80, 650);

  //constructor witch
  witch = new Witch();

  //constructor many Ghosts
  for (int i = 0; i <ghosts.length; i++) {
    ghosts[i] = new Ghosts();
  }

  //constructor bats
  for (int i = 0; i <bat.length; i++) {
    bat[i] = new Bat();
  }

  //constructor screen
  screen = new Screen(screenImage);
}
void draw() {
  //draw background 
  image(background, 0, 0, width, height);
  image(moonImage, 690, 90);
  for (int i = 0; i <clouds.length; i++) {
    clouds[i].display();
    clouds[i].moveClouds();
  }

  allLanternsOn=areAllTurnedOn(lanterns);

  //plays a bell one time if allLantersOn is true
  if (allLanternsOn&&Fix) {
    bell.play();
    Fix = false;
  }
  //Ghosts apear in the back and move from left to right if allLanternsOn is true
  if (allLanternsOn) {
    for (int i = 0; i <ghosts.length; i++) {
      ghosts[i].show();
      ghosts[i].move();
    }
  }

  //draws the ghost in perspectiv
  image(backgroundGhosts, 0, 0, width, height);

  //draw the screen
  screen.display();

  //draw the lanterns and check if the ghost is near them, if yes turn on
  for (int i = 0; i <lanterns.length; i++) {

    Lantern l = lanterns[i];
    float centerX=l.x + l.widthOn/2; //moving point for distance to the center
    float centerY=l.y+l.heightOn/2;
    if (dist(mainGhost.ghostX, mainGhost.ghostY, centerX, centerY) <=50) {
      l.turnOn();
    }
    l.display();
  }


  //draw the main ghost
  mainGhost.display();



  for (int i = 0; i <bat.length; i++) {
    bat[i].display();
    bat[i].move();
  }

    //draw the witch
  witch.display();
  //move the witch
  witch.move();
  
  //draws some needed images for depth
  image(tower1, 361, 644);
  image(tower2, 566, 653);
  image(buildingLeft, 0, 580, 248, 363);

  image(curtains, 0, 0, width, height);
}



//play gif if screen is clicked
void mouseClicked() {
  witch.sound(); //witch laugh if witch is clicked
  screen.isOver(mouseX, mouseY); //mouse coordinates have to be over the screen
  
}

//move the ghost through the arrow keys
void keyPressed() {
  mainGhost.getMoved(keyCode);
}

//check if all lanterns are turned on and return true if so
boolean areAllTurnedOn(Lantern[] lanterns) {
  for (int i = 0; i <lanterns.length; i++) {
    if (!lanterns[i].on) {
      return false;
    }
  }
  return true;
}
