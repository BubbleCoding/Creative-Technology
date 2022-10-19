//final Assignment - Algorithms for CreaTe
//Rover Vos (s2161702) & Nathalie Kamp (s2185105)
//23.06.19
//a game that has a msd as a hazard, a flock of enemies, a bomb that explodes into particles and a hazard that moves with perlin noise
//the statemachine is based on the example by David Stritzl & Angelika Mader 


import java.util.*; //import libary for statemachine 

ScreenStateMachine stateMachine;
PVector location; //location of character is global cause it is used in every level
boolean testing=false, death=false; //gloabal booleans for testing mode and death of the character, used in every level
int isExploded=0; //has to be global because it is used in fakeWall and bomb and those dont communicate otherwise


void setup() {
  size(600, 500);
  location = new PVector(0, height-10);
  Map<ScreenState, Screen> screens = new HashMap<ScreenState, Screen>();

  // the following sets up the structure of the state machine in the game
  // first, it matches the names of the ScreenStates to the instances of the game phase
  // second, it defines the list of successor screens for each screen (game phase)
  screens.put(ScreenState.STATE_0, new Title(new ScreenState[] {ScreenState.STATE_1}));
  //level 1
  screens.put(ScreenState.STATE_1, new Level1(new ScreenState[] {ScreenState.STATE_1b, ScreenState.STATE_6, ScreenState.STATE_2, ScreenState.STATE_3, ScreenState.STATE_4, ScreenState.STATE_7})); //lvl 1 can lead to any lvl if testmode is active
  screens.put(ScreenState.STATE_1b, new Level1b(new ScreenState[] {ScreenState.STATE_1c, ScreenState.STATE_1, ScreenState.STATE_6}));
  screens.put(ScreenState.STATE_1c, new Level1c(new ScreenState[] { ScreenState.STATE_2, ScreenState.STATE_1b, ScreenState.STATE_6})); 
  //level 2
  screens.put(ScreenState.STATE_2, new Level2(new ScreenState[] {ScreenState.STATE_2b, ScreenState.STATE_2, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_2b, new Level2b(new ScreenState[] {ScreenState.STATE_2c, ScreenState.STATE_2, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_2c, new Level2c(new ScreenState[] {ScreenState.STATE_2d, ScreenState.STATE_2b, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_2d, new Level2d(new ScreenState[] {ScreenState.STATE_2e, ScreenState.STATE_2c, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_2e, new Level2e(new ScreenState[] {ScreenState.STATE_3, ScreenState.STATE_2d, ScreenState.STATE_6})); 
  //level 3
  screens.put(ScreenState.STATE_3, new Level3(new ScreenState[] {ScreenState.STATE_3b, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_3b, new Level3b(new ScreenState[] {ScreenState.STATE_3c, ScreenState.STATE_3, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_3c, new Level3c(new ScreenState[] {ScreenState.STATE_3e, ScreenState.STATE_3b, ScreenState.STATE_6, ScreenState.STATE_3d})); 
  screens.put(ScreenState.STATE_3d, new Level3d(new ScreenState[] {ScreenState.STATE_3c, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_3e, new Level3e(new ScreenState[] {ScreenState.STATE_4, ScreenState.STATE_3c, ScreenState.STATE_6})); 
  //level 4
  screens.put(ScreenState.STATE_4, new Level4(new ScreenState[] {ScreenState.STATE_4b, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_4b, new Level4b(new ScreenState[] {ScreenState.STATE_4c, ScreenState.STATE_4, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_4c, new Level4c(new ScreenState[] {ScreenState.STATE_4e, ScreenState.STATE_4b, ScreenState.STATE_6, ScreenState.STATE_4d})); 
  screens.put(ScreenState.STATE_4d, new Level4d(new ScreenState[] {ScreenState.STATE_4c, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_4e, new Level4e(new ScreenState[] {ScreenState.STATE_4f, ScreenState.STATE_4c, ScreenState.STATE_6})); 
  screens.put(ScreenState.STATE_4f, new Level4f(new ScreenState[] {ScreenState.STATE_7, ScreenState.STATE_4e, ScreenState.STATE_6})); 
  //win screen and fail screen
  screens.put(ScreenState.STATE_6, new Fail(new ScreenState[] {ScreenState.STATE_1})); //fail screen leads to level 1 
  screens.put(ScreenState.STATE_7, new Win(new ScreenState[] {ScreenState.STATE_1})); //win screen leads to level 1 

  stateMachine = new ScreenStateMachine(screens, ScreenState.STATE_0);
}

void draw() {
  stateMachine.doAvailableTransitions();
  stateMachine.drawScreen();
}

void keyPressed() {
  stateMachine.handleKeyPress();
}
void keyReleased() {
  stateMachine.handleKeyReleas();
}

void mousePressed() {
  stateMachine.handleMousePress();
}