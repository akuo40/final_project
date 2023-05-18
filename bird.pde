class Bird{
  float x;
  float y;
  float verticalSpeed;
  PImage birdImage;
  
  Bird(PImage image, float tempX, float tempY, int size) {
    this.x = tempX;
    this.y = tempY;
    birdImage = image;
    birdImage.resize(size, 0);
    verticalSpeed = 0;
  }
  
  void display() {
    imageMode(CENTER);
    image(birdImage, x, y);
  }
  
  void update() {
    this.y += verticalSpeed;
    this.verticalSpeed += 1;
  }  
  
  boolean aboveMap() {
    if (this.y < 0) {
      return true;
    }
    return false;
  }
}
