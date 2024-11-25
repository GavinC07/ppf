class Spaceship {
  //member variables
  int x, y, w, health, laserCount, turretCount;
  PImage ship;

  //constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 200;
    turretCount = 1;
    ship = loadImage("SS.png");
  }

  void display () {
    //line(x+20, y-10, x+20, y+5);
    //line(x-20, y-10, x-20, y+5);
    //fill(#AA4203);
    //ellipse(x, y+35, 20, 60);
    //fill(#ffcc00);
    //ellipse(x, y+35, 10, 50);
    //fill(#6d6c6f);
    //triangle(x, y-40, x+35, y+40, x-35, y+40);
    //fill(#c0cbcd);
    //triangle(x, y-30, x+8, y-12, x-8, y-12);
    //fill(#575759);
    //ellipse(x, y+25, 20, 60);
    //ellipse(x+25, y+40, 20, 40);
    //ellipse(x-25, y+40, 20, 40);
    //stroke(#929390);
    imageMode(CENTER);
    image(ship, mouseX, mouseY);
  }

  void move (int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire () {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
