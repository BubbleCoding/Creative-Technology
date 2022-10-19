
float M = random(.5,1.5);
float initX = random(100*M,height-100*M);
float initY = random(100*M,width-100*M);

void setup(){
size(500,500);
background(0);
smooth();
}

void draw(){
  shapeMode(CENTER);
  scale(2);
  translate(100,100);
  stroke(255);
  noFill();

    beginShape();
    vertex(60, 60);
    vertex(20, 20);
    vertex(20, 100);
    vertex(0, 120);
    vertex(100, 220);
    vertex(200, 120);
    vertex(180, 100);
    vertex(180, 20);
    vertex(140, 60);
    vertex(60, 60);
    vertex(20, 100);
    vertex(100, 220);
    vertex(180, 100);
    vertex(140,60);
    endShape();
}
