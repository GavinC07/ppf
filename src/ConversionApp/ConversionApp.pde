//Gavin Chard | Conversion App | Sept, 23, 2024

void setup() {
  size(400, 200);
}

void draw () {
  background(127);
  line (0, 150, width, 150);
  for (int i=0; i<width; i+= 25) {
    line (i, 145, i, 155);
    fill(93, 168, 138);
    textAlign(CENTER);
    text(i-200, i, 135);
  }
  fill(173, 247, 200);
  ellipse(mouseX, 150, 6, 6);
  text(mouseX-200, mouseX, 170);
  
  fill(204, 255, 239);
  text("Cel: " + farToCel (mouseX), width/2, 100);
}

float farToCel(float tempFar) {
  tempFar = (tempFar - 32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = (tempCel + 32) * (9.0/5.0);
  return tempCel;   
}
