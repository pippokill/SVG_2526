PFont f;
String pl1="Player 1: ";
String pl2="Player 2: ";
int ps1=0; // Player 1 score
int ps2=0; // Player 2 score
float xb=320; // Coordinate palla
float yb=240;
int xd=1; // Incremento coordinate palla
int yd=1;
float xspeed = 4; // Velocità x della palla
float yspeed = 4; // Velocità y della pala
int ballSize=10; // Dimensione palla
int xoffp=20; // x offset per racchette
int p1LineY; // Coordinata y del Player 1
int p1size=40; // Dimensione racchetta Player 1
int p2LineY; // Coordinata y del Player 2
int p2size=40; // Dimensione racchetta Player 2

PImage backimg;

void setup() {
  size(800, 600);
  f = createFont("Arial", 22, true);
  ellipseMode(RADIUS);
  xb = width/2;
  yb = height/2;
  p1LineY = height/2-p1size/2;
  p2LineY = height/2-p2size/2;
  backimg=loadImage("vpw_background.jpg");
}

void updateField() {
  strokeWeight(4);
  stroke(255);
  line(0, 32, width, 32);
  line(0, height-10, width, height-10);
  textFont(f);
  fill(255);
  noStroke();
  text(pl1+ps1, 12, 22);
  text(pl2+ps2, width-240, 22);
}

void drawBall() {
  xb = xb + ( xspeed * xd);
  yb = yb + ( yspeed * yd);

  if (xb==ballSize+xoffp && yb-ballSize>=p1LineY && yb<=(p1LineY+p1size)) {
    ps1++;
    xspeed+=1.5;
    yspeed+=1.5;
    xd*=-1;
  }
  if (xb > width-ballSize || xb < ballSize) {
    xd *= -1;
    if (xb<ballSize)
      ps1--;
    if (xspeed>2)
      xspeed--;
  }
  if (yb > height-ballSize-10 || yb < ballSize+32) {
    yd *= -1;
    if (yspeed>2)
      yspeed--;
  }

  ellipse(xb, yb, ballSize, ballSize);
  println(xspeed+"\t"+yspeed);
}

void drawPlayers() {
  p1LineY=mouseY;
  if (p1LineY<=32)
    p1LineY=32;
  if (p1LineY>=height-10-p1size)
    p1LineY=height-10-p1size;
  strokeWeight(4);
  stroke(255);
  line(xoffp, p1LineY, xoffp, p1LineY+p1size);
  line(width-xoffp, p2LineY, width-xoffp, p2LineY+p2size);
  noStroke();
}

void draw() {
  background(backimg);
  updateField();
  drawBall();
  drawPlayers();
}
