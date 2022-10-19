// this class organizes the handling of the state transitions

class ScreenStateMachine {
  // this mapping allows to access the objects via the name of the ScreenState

  private final Map<ScreenState, Screen> screens;
  private Screen currentScreen;

  ScreenStateMachine(Map<ScreenState, Screen> screens, ScreenState initialState) {
    // create copy of screens map
    this.screens = new HashMap<ScreenState, Screen>(screens);
    switchScreen(initialState);
  }

  void doAvailableTransitions() {
    while (currentScreen.hasNextState()) {
      switchScreen(currentScreen.getNextState());
    }
  }

  void switchScreen(ScreenState nextState) {
    currentScreen = screens.get(nextState);
    currentScreen.enterState();
  }

  void drawScreen() {
    background(240,230,140);

    currentScreen.draw();
  }

  void handleKeyPress() {
    currentScreen.handleKeyPress();
  }

  void handleMousePress() {
    currentScreen.handleMousePress();
  }
  void handleKeyReleas() {
    currentScreen.handleKeyReleas();
  }
}
