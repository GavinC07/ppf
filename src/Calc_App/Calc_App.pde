// Gavin Chard | Calc App | Sept 30 24
Button[] buttons = new Button[22];
String dVal = "^-^" ;
char op;
float l, r, result;
boolean left;

void setup() {
  size(65, 120);
  background(50);
  left = true;
  op = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(23, 110, 30, 10, color(#625C52), color(#36322D), "0", true);
  buttons[1] = new Button(51, 110, 10, 10, color(#625C52), color(#36322D), ".", true);
  buttons[2] = new Button(13, 95, 10, 10, color(#625C52), color(#36322D), "1", true);
  buttons[3] = new Button(28, 95, 10, 10, color(#625C52), color(#36322D), "2", true);
  buttons[4] = new Button(43, 95, 10, 10, color(#625C52), color(#36322D), "3", true);
  buttons[5] = new Button(13, 80, 10, 10, color(#625C52), color(#36322D), "4", true);
  buttons[6] = new Button(28, 80, 10, 10, color(#625C52), color(#36322D), "5", true);
  buttons[7] = new Button(43, 80, 10, 10, color(#625C52), color(#36322D), "6", true);
  buttons[8] = new Button(13, 65, 10, 10, color(#625C52), color(#36322D), "7", true);
  buttons[9] = new Button(28, 65, 10, 10, color(#625C52), color(#36322D), "8", true);
  buttons[10] = new Button(43, 65, 10, 10, color(#625C52), color(#36322D), "9", true);
  buttons[11] = new Button(13, 50, 15, 10, color(#CB4242), color(#8E0909), "±", false);
  buttons[12] = new Button(33, 50, 25, 10, color(#CB4242), color(#8E0909), "←", false);
  buttons[13] = new Button(53, 50, 15, 10, color(#CB4242), color(#8E0909), "=", false);
  buttons[14] = new Button (55, 65, 5, 10, color(#CB4242), color(#8E0909), "x", false);
  buttons[15] = new Button (55, 75, 5, 10, color(#CB4242), color(#8E0909), "+", false);
  buttons[16] = new Button (55, 85, 5, 10, color(#CB4242), color(#8E0909), "-", false);
  buttons[17] = new Button (55, 95, 5, 10, color(#CB4242), color(#8E0909), "÷", false);
  buttons[18] = new Button (55, 10, 10, 10, color(#CB4242), color(#8E0909), "√", false);
  buttons[19] = new Button (25, 10, 10, 10, color(#CB4242), color(#8E0909), "C", false);
  buttons[20] = new Button (10, 10, 15, 10, color(#CB4242), color(#8E0909), "^", false);
  //changed this from CE to CR
  buttons[21] = new Button (60, 30, 5, 20, color(#CB4242), color(#8E0909), "ø", false);
  //turns the calculator on and off
}

void draw() {
  background(50);
  println("Left:" + l + " Op:" + op + "Right:" + r + " Result" + result );
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect(width/2, 30, 50, 20);
  fill(#000000);
  if (dVal.length()<10) {
    textSize(10);
  } else if (dVal.length() < 13) {
    textSize(8);
  }
  textAlign(RIGHT);
  text(dVal, width-10, 35);
}

void mousePressed() {
  for (int i= 0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 12) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 12) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      handleEvent("x", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      handleEvent("÷", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      op = 'C';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      left = true;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("ø")) {
      exit();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^")) {
      if (left) {
        dVal = str(sq(l));
        l = float(dVal);
      } else {
        dVal = str(sq(r));
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("←")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        dVal = str(sqrt(l));
        l = float(dVal);
      } else {
        dVal = str(sqrt(r));
        r = float(dVal);
      }
    }
  }
}


void preformCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
  dVal = str(result);
}


void handleEvent(String keyVal, boolean isNum) {
  //for (int i= 0; i<buttons.length; i++) {
  if (left && dVal.length() < 12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length () < 12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("x") && !isNum) {
    left = false;
    dVal = "0";
    op = '*';
  } else if ((keyVal.equals("÷")|| keyVal.equals("/")) && !isNum) {
    left = false;
    dVal = "0";
    op = '/';
  } else if (keyVal.equals("=") && !isNum) {
    preformCalc();
  }
}

void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode == 96) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '/'|| keyCode == 111 || keyCode == 47) {/////
    handleEvent("/", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("x", false);
  }
}
