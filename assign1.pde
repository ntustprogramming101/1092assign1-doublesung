final float OFFSET_X = 80;
final float OFFSET_Y = 80;

final float ROBOT_OFFSET_X = 25;
final float ROBOT_OFFSET_Y = 37;

final float LASER_OFFSET_Y = 80;
final float LASER_MAX_W = 40;
final float LASER_MIN_W = 4;
final float LASER_MOVE_W = 160;

PImage bg, soil, groundHog, 
       life1, life2, life3, robot, soldier;

float soldierX, soldierY, soldierSpeed, soldierWidth;

float robotX, robotY;

float laserHeadX;
float laserTailX;
float laserY;
float laserWidth;
float laserSpeed;

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
  
  soldierX = 0;
  soldierY = (OFFSET_Y*2 + floor(random(4)) * OFFSET_Y);
  soldierWidth = 80;
  soldierSpeed = 5;
  
  robotX = (OFFSET_X*2 + floor(random(6)) * OFFSET_X);
  robotY = (OFFSET_Y*2 + floor(random(4)) * OFFSET_Y);
  
  laserHeadX = robotX + ROBOT_OFFSET_X - LASER_MIN_W;
  laserTailX = robotX + ROBOT_OFFSET_X;
  laserY = robotY + ROBOT_OFFSET_Y;  
  laserSpeed = -2;
}

void draw() {
  background(bg);
  
  image(soil, 0, OFFSET_Y*2, width, 320);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, OFFSET_Y*2 - 15, width, 15);
  
  //sun 
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(width - 50, 50, 120, 120);
  
  image(groundHog, 280, 80, 80, 80);
  
  image(life1, 10, 10, 50, 51);
  image(life2, 80, 10, 50, 51);
  image(life3, 150, 10, 50, 51);
  
  image(robot, robotX, robotY, 80, 80);
  
  image(soldier, soldierX - OFFSET_X, soldierY, soldierWidth, 80);
  //soldier move
  soldierX += soldierSpeed;
  //soldier loop
  soldierX %= (soldierWidth + width);
  
  //laser
  stroke(255, 0, 0);
  strokeWeight(10);
  line(laserHeadX, laserY, laserTailX, laserY);
  
  //laser width
  laserWidth = laserTailX - laserHeadX;
  
  //laser width, move
  laserHeadX += laserSpeed;
  
  //laser width equal 40px starting move
  if(laserWidth >= LASER_MAX_W){
    laserTailX += laserSpeed;
  }
  
  //when laser move 160px back to origin
  if(laserHeadX <= robotX - LASER_MOVE_W){
    laserHeadX = robotX + ROBOT_OFFSET_X - LASER_MIN_W; 
    laserTailX = robotX + ROBOT_OFFSET_X;
  }
}
