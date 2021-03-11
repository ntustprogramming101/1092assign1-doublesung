PImage bg;
PImage soil;
PImage groundHog;
PImage life1;
PImage life2;
PImage life3;
PImage robot;
PImage soldier;

int soldierX;
int soldierSpeed;

int robotLaser_headX;
int robotLaser_tailX;
int robotLaser_width;
int robotLaser_speed;
int robotLaser_endX;
int robotLaser_moveWidth;

void setup() {
  size(640, 480, P2D);
  
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  groundHog = loadImage("img/groundhog.png");
  life1 = loadImage("img/life.png");
  life2 = loadImage("img/life.png");
  life3 = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  soldierX = 200;
  soldierSpeed = 5;
  
  robotLaser_headX = 501;
  robotLaser_tailX = 505;
  robotLaser_speed = -2;
  robotLaser_width = 0;
  robotLaser_endX = 0;
  robotLaser_moveWidth = 160;
}

void draw() {
  image(bg, 0, 0);
  image(soil, 0, 160);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, 640, 15);
  
  //sun 
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(590, 50, 120, 120);
  
  image(groundHog, 280, 80);
  image(life1, 10, 10);
  image(life2, 80, 10);
  image(life3, 150, 10);
  image(robot, 480, 160);
  image(soldier, soldierX, 400);
  
  //soldier move
  soldierX += soldierSpeed;
  //soldier loop
  soldierX %= (80 + 640);
  
  //robotLaser
  stroke(255, 0, 0);
  strokeWeight(10);
  line(robotLaser_headX, 197, robotLaser_tailX, 197);
  
  //robotLaser's width
  robotLaser_width = robotLaser_tailX - robotLaser_headX;
  
  //robotLaser's width after move
  robotLaser_headX += robotLaser_speed;
  
  //when robotLaser's width equal 40px
  if(robotLaser_width == 40){
    //starting move
    robotLaser_tailX += robotLaser_speed;
  }
  
  //when robotLaser move 160px back to origin
  if(robotLaser_headX == 309){
    robotLaser_headX = 501;
    robotLaser_tailX = 505;
  }
}
