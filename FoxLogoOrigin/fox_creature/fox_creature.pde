void setup() {
 size(200,200);
 
  
}

void draw() {
  
  background(255);
  
  //horizontal line
  line(60,40,140,40);
  
  //diamond side 1 left
  line(60,40,20,80);
  //diamond side 2 left
  line(20,80,100,200);
  //diamond side 1 right
  line(140,40,180,80);
  //diamond side 2 right
  line(180,80,100,200);
  
  //left ear
  //vertical line
  line(20,80,20,0);
  //diagnal line
  line(20,0,60,40);
  
  //right ear
  //verical line
  line(180,80,180,0);
  //diagnal line
  line(180,0,140,40);
  
  //left cheek
  line(20,80,0,100);
  line(0,100,100,200);
  
  //right cheek
  line(180,80,200,100);
  line(200,100,100,200);
  

  
  if (keyPressed == true){
      //left eye
      noFill();
      arc(60,80,25,35,0,1.3*PI, CHORD);
      
      //right eye
      noFill();
      arc(140,80,25,35,-.3*PI,PI,CHORD);
      
  }
  else if(keyPressed == false){
        //sleep left eye
        noFill();
        arc(60,80,25,35,.25*PI,PI);
        
        //sleep right eye
        noFill();
        arc(140,80,25,35,0,.75*PI);
  }
  
}
