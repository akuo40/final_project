class Pipe {
  float x;
  float y;
  PImage upPipe;
  PImage downPipe;
  float speed;
  Pipe(PImage up, PImage down, int size, int startX, int startY) {
    speed = 2;
    x = startX;
    y = startY;
    upPipe = up;
    upPipe.resize(0, size);
    downPipe = down;
    downPipe.resize(0, size);
  }    
  
  void display() {
    imageMode(CENTER);
    image(upPipe, x, y + 345);
    image(downPipe, x, y - 345);
  }
  
   void update() {
    this.x -= speed;
    if(x < -70) {
      x = width + 70;
      y = random(height/2 - 200, height/2 + 200);
    }
  }
}
