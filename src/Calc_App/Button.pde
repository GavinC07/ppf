class Button {
  //member variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;
  char type;

  //contructor
  Button(int x, int y, int w, int h, color c1, color c2, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    this.val = val;
    this.type = type;
    on=false;
    this.isNum = isNum;
  }

  //member methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(#4D4B49);
    textAlign(CENTER, CENTER);
    textSize(10);
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
