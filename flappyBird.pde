Bird bird;
Background background;

void setup(){
  size(1000, 750);
  imageMode(CENTER);
  PImage flappyBirdImage = loadImage("pngegg.png");
  PImage upPipe = loadImage("pipe2");
  PImage downPipe = loadImage("pipe");
  imageMode(CORNER);
  PImage backgroundImage = loadImage("background.png");
  bird = new Bird(flappyBirdImage, 500, 375, 100);
  background = new Background(backgroundImage, 0, 0, 1000);
  background.display();
  bird.display();
}

void draw() {
  background.update();
  background.display();
  bird.update();
  bird.display();
  if (keyPressed) {
    if (key == ' ') {   
      if (! bird.aboveMap()){
        bird.verticalSpeed = -7;
      }
    }
  }
}
