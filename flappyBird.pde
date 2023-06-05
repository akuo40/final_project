Bird bird;
Background background;
Pipe doublePipe0;
Pipe doublePipe1;
Pipe doublePipe2;
Boolean isDead;
Boolean startScreen;
int score;
int highScore;
PImage gameOver;
PImage scoreBoard;
PImage playAgain;
PImage startImage;
Rain[] rain;

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
  doublePipe2 = new Pipe(pipe, pipe2, 500, width +  (2 * (width + 140)) / 3, (int) (random(height / 2 - 200, height / 2 + 200)));
  bird = new Bird(flappyBirdImage, 500, 1500, 125);
  background = new Background(backgroundImage, 0, 0, 1000);
  background.display();     
  doublePipe0.display();
  doublePipe1.display();
  doublePipe2.display();
  bird.display(); 
  isDead = false;
  startScreen = true;
  score = 0;
  gameOver = loadImage("gameOver.png");    
  scoreBoard = loadImage("scoreBoard.png");
  playAgain = loadImage("playAgain.png");
  gameOver.resize(600, 0);     
  scoreBoard.resize(500, 0);
  playAgain.resize(150, 0);
  startImage = loadImage("flapBird.png");
  startImage.resize(2000, 0);
  rain = new Rain[1200];
  for (int i = 0; i < rain.length; i++) {
    rain[i] = new Rain();
  }
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
  if (score >= 5) {
    for (int i = 0; i < rain.length; i++) {
      rain[i].display();
      rain[i].update();
    }
  }
  if (keyPressed) {
    if (key == ' ') {   
      if (! bird.aboveMap() && (! isDead)){
        bird.verticalSpeed = -7;
      }
    }
  }
  if (score > highScore) {
    highScore = score;
  }
  if (isDead) {
    if (! startScreen) {
      image(gameOver, width/2, height/2 - 250);
      imageMode(CENTER);
      image(scoreBoard, width/2, height/2);
      fill(255);
      textSize(100);
      text(score, width/2 - 127, height/2 + 50);
      text(highScore, width/2 + 60, height/2 + 50);
    }
    imageMode(CENTER);
    image(playAgain, width/2, height/2 + 200);
    if (mousePressed == true) {
      if (mouseX > width/2 - 75 && mouseX < width/2 + 75 && mouseY > height/2 + 160 && mouseY < height/2 + 230) {
        reset();
        if (startScreen) {
          startScreen = false;
        }
      }
    }
    if (startScreen) {
      imageMode(CENTER);
      image(startImage, width/2 + 20, height/2 - 200);
    }
  } else {
    fill(255, 165, 0);   
    rect(width - 235, 25, 205, 80);
    fill(255);
    textSize(50);
    text("Score: " + score, width - 215, 80);
    if (bird.x == doublePipe0.x + 30 || bird.x == doublePipe1.x + 30 || bird.x == doublePipe2.x + 30){
    score++;
  }
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

void reset() {
  bird.y = height/2;
  bird.verticalSpeed = 0;
  doublePipe0.x = width;
  doublePipe1.x = width + (width + 140) /3;
  doublePipe2.x = width +  (2 * (width + 140)) / 3;
  isDead = false;
  score = 0;
}
