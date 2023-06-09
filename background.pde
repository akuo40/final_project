class Background{
  int x;
  int y;
  int speed;
  PImage background;
  Background(PImage image, int tempX, int tempY, int size) {
    speed = 2;
    this.x = tempX;
    this.y = tempY;
    background = image;
    background.resize(size, 0);
  }
  
  void display() {
    imageMode(CORNER);
    image(background, x, y);
    image(background, 1000 + x, y);
  }
  
  void update() {
    this.x -= speed;
    if(x < -1000)
      x = 0;
  }
}
