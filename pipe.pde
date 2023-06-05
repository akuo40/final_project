class Pipe {
  int x;
  int y;
  PImage upPipe;
  PImage downPipe;
  int speed;
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
      y = (int) random(height/2 - 200, height/2 + 200);
    }
  }
}
