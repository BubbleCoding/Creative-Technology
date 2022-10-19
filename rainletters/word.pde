class Word {
  float timer;
  float r,g,b;
  float x=random(width);
  float y=random(-height, 0);
  float z=random(-100, 500);
  float yspeed=3;
  String text [] =  loadStrings("text.txt");
  String sentence = join(text, " ");
  String words [] = splitTokens(sentence, " ,?.!&");
  float randomWord= random(words.length);
  
  void set(){
  //printArray(words);
      
  }   


  void fall() {
    y =  y +yspeed;
  }

  void display() {
    
    //for (int i=0; i<1; i++) {
      
    //}
    fill(r, g, b);
    text(words[int(randomWord)], x, y, z);
    if(millis()-timer>1000){
    r= random(255);
    g= random(255);
    b= random(255);
    timer=millis();
    }
    
    if (y>height) {
      y=random(-100, 0);
      z=random(0, 100);
      x=random(width);
      yspeed=random(2,5);
      randomWord= random(words.length);
    }
    
  }
}
