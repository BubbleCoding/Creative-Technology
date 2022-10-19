//superclass that is called in every level
abstract class Screen {
  //make all the variables
  int size;
  PFont arcadeFont;
  PImage hole;
  ArrayList<hazard> traps;
  ArrayList<obstacle> obstacles;
  ArrayList<enemy> enemies;
  ArrayList<FakeWall> fakeWall;
  ArrayList<WaveTrap> waveTrap;
  PVector bombPos; //Wouter

  
  //call all the functions that are needed
  character Char;
  Border bord;
  Bullet shot;
  
  protected final ScreenState[] nextStates;

  private ScreenState nextState;

  Screen(ScreenState[] nextStates) {
    this.nextStates = nextStates;
    //initilize arraylists and classes
    traps = new ArrayList<hazard>();
    obstacles = new ArrayList<obstacle>();
    enemies = new ArrayList<enemy>();
    fakeWall= new ArrayList<FakeWall>();
    waveTrap= new ArrayList<WaveTrap>();
    Char = new character(200);
    bord = new Border();
    shot = new Bullet(new PVector(-1000, -1000), new PVector(-1000, -1000));
    bombPos=new PVector(0,0); //wouter

    //bombPos.set(Char.bomb.pos);//wouter
    //add visuals
    arcadeFont=createFont("ARCADECLASSIC", 15);
    textFont(arcadeFont);
    hole=loadImage("hole.png");
    size=50;

    this.reset();
  } 
  public boolean hasNextState() {
    return nextState != null;
  }

  public ScreenState getNextState() {
    return nextState;
  }

  public void enterState() {
    this.nextState = null;
    this.reset();
  }

  protected abstract void draw();

  protected void handleKeyPress() {
  }

  protected void handleMousePress() {
  }

  protected void handleKeyReleas() {
  }

  protected void reset() {
  }

  protected void goToState(ScreenState nextState) {
    this.nextState = nextState;
  }
  
  void bombUpdate(){
    bombPos.set(Char.bomb.pos);//wouter
  }
    
}
