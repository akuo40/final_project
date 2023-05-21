Bird bird;
Background background;
Pipe doublePipe0;
Pipe doublePipe1;
Pipe doublePipe2;
Boolean isDead;

void setup(){
  size(1000, 750);
  imageMode(CENTER);
  PImage flappyBirdImage = loadImage("pngegg.png");
  PImage pipe2 = loadImage("pipe2.png");
  PImage pipe = loadImage("pipe.png");
  imageMode(CORNER);
  PImage backgroundImage = loadImage("background.png");
  doublePipe0 = new Pipe(pipe, pipe2, 500, (width), height / 2);
  doublePipe1 = new Pipe(pipe, pipe2, 500, width + (width + 140) /3 , (int) (random(height / 2 - 200, height / 2 + 200)));
  doublePipe2 = new Pipe(pipe, pipe2, 500, width +  (2 * (width + 140)) / 3, (     int) (random(height / 2 - 200, height / 2 + 200)));
  bird = new Bird(flappyBirdImage, 500, 375, 125);
  background = new Background(backgroundImage, 0, 0, 1000);
  background.display();     
  doublePipe0.display();
  doublePipe1.display();
  doublePipe2.display();
  bird.display(); 
  isDead = false;
}

void draw() {  
  background.update();
  background.display();
  doublePipe0.update();
  doublePipe0.display();
  doublePipe1.update();
  doublePipe1.display();
  doublePipe2.update();
  doublePipe2.display();
  bird.update();
  bird.display();
  isDead();
  if (keyPressed) {
    if (key == ' ') {   
      if (! bird.aboveMap() && (! isDead)){
        bird.verticalSpeed = -7;
      }
    }
  }
  if (isDead) {
    PImage gameOver = loadImage("gameOver.png");    
    gameOver.resize(600, 0);
    image(gameOver, width/2, height/2 - 125);
  }
}

void isDead() {
  if ((abs(bird.x - doublePipe0.x) < 105) && (abs(bird.y - doublePipe0.y) > 75))
    isDead = true;
  if ((abs(bird.x - doublePipe1.x) < 105) && (abs(bird.y - doublePipe1.y) > 75))
    isDead = true;
  if ((abs(bird.x - doublePipe2.x) < 105) && (abs(bird.y - doublePipe2.y) > 75))
    isDead = true;
  if (bird.y > height)
    isDead = true;
}
