// Gavin Chard | Data Types and Variables | Sept, 11, 2024

float grade;
void setup () {

  size(850, 150);
  background(123, 133, 131);
}

void draw () {

  background(123, 133, 131);
  textSize(35);
  textAlign(CENTER);
  fill(50, 74, 69);
  text("Grades by Gavin Chard", width/2, 30);
  //text

  line(0, 75, width, 75);
  //middle line

  for (int i=0; i<width; i+=80) {
    line(i, 70, i, 80);
    textSize(8);
    fill(166, 222, 197);
    text(i/200.0, i, 90);
  }
  //line(50, 95, 50, 105);
  //textSize(15);
  //text("50", 50, 90);
  //notches on the line

  fill(115, 191, 148);
  ellipse(mouseX, 75, 5, 5);
  //ellipse that follows the mouse locked on the line

  fill(166, 222, 197);
  textSize(16);
  //text that shows the grade ur mouse is on


  text((float)mouseX/width*4, mouseX, 60);
  assignGrade((float)mouseX/width*4);
}

void assignGrade (float tgrade) {
  if (tgrade >= 3.51) {
    text ("Assign letter grade A", width/2, 125);
  } else if (tgrade >= 3.00) {
    text("Assign letter grade A-", width/2, 125);
  } else if (tgrade >= 2.84) {
    text("Assign letter grade B+", width/2, 125);
  } else if (tgrade >= 2.67) {
    text("Assign letter grade B", width/2, 125);
  } else if (tgrade >= 2.50) {
    text("Assign letter grade B-", width/2, 125);
  } else if (tgrade >= 2.34) {
    text("Assign letter grade C+", width/2, 125);
  } else if (tgrade >= 2.17) {
    text("Assign letter grade C", width/2, 125);
  } else if (tgrade >= 2.00) {
    text("Assign letter grade C-", width/2, 125);
  } else if (tgrade >= 1.66) {
    text("Assign letter grade D+", width/2, 125);
  } else if (tgrade >= 1.33) {
    text("Assign letter grade D", width/2, 125);
  } else if (tgrade >= 1.00) {
    text("Assign letter grade D-", width/2, 125);
  } else {  //leave blank so it says if its under any of these values to assign F
    text("Assign letter grade F", width/2, 125);
  }
}
