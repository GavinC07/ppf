class Laser {
  //member variables
  int x, y, w, h, speed;


  //constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 2;
    h = 10;
    speed = 3;
  }

  void display () {
    fill(#FFD700);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move () {
    y = y - speed;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
}
