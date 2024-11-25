class Powerup {
  //member variables
  int x, y, diam, speed;
  char type;
  PImage pu1;

  //constructor
  Powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(45, 50));
    speed = int(random(1, 5));
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
      pu1 = loadImage("Powerup1.png");
    } else if (rand == 1) {
      type = 'a';
      pu1 = loadImage("Powerup2.png");
    } else if (rand == 2) {
      type = 's';
      pu1 = loadImage("Powerup3.png");
    }
  }
  void display () {

    pu1.resize(diam, diam);
    image(pu1, x, y);
  }

  void move () {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist (x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
