class Rain {
  int x = (int) random(width);
  int y = (int) random(-1000, 0);
  int speed = (int) random(5,7);
  
  void update() {
    y = y + speed;
    
    if (y > height){
      y = (int) random(-1000, 0);
    }
  }
  
  void display() {
    fill(30,144,255);
    rect(x, y, 5, 25);
  }
}
