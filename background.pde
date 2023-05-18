class Background{
  float x;
  float y;
  PImage background;
  Background(PImage image, float tempX, float tempY, int size) {
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
    this.x -= 1;
    if(x < -1000)
      x = 0;
  }
}
