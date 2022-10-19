void setup(){
size(600,600,P3D);
background(0);


}

void draw(){
stroke(255);
noFill();
beginShape();
vertex(100,100,0);
vertex(100,100,-100);
vertex(100,100,0);

vertex(100,150,0);
vertex(100,150,-100);
vertex(100,150,0);

vertex(150,150,0);
vertex(150,150,-100);
vertex(150,150,0);

vertex(150,100,0);
vertex(150,100,-100);
vertex(150,100,0);

vertex(100,100,0);
vertex(100,100,-100);
vertex(100,150,-100);
vertex(150,150,-100);
vertex(150,100,-100);
vertex(100,100,-100);
endShape();

beginShape();
vertex(-100, -100, -100);
vertex( 100, -100, -100);
vertex(   0,    0,  100);

vertex( 100, -100, -100);
vertex( 100,  100, -100);
vertex(   0,    0,  100);

vertex( 100, 100, -100);
vertex(-100, 100, -100);
vertex(   0,   0,  100);

vertex(-100,  100, -100);
vertex(-100, -100, -100);
vertex(   0,    0,  100);
endShape();


}
