//Gavin Chard | SpaceGame | Nov 2nd 2024
import processing.sound.*;
//Animation animation1, animation2;
//float xpos;
//float ypos;
//float drag = 30.0;
SoundFile laser1, hitship, hitrock, powerups, die, levelup, end;
int score, level, rockTime, backY,Animation;
boolean play;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList <Powerup>();
ArrayList<Star> stars = new ArrayList <Star>();
Timer rTime, puTime;
PImage bg;

void setup () {
  size(500, 500);
  backY = -2500;
  //frameRate(60);
  //animation1 = new Animation("Hurt.gif", 38);
  laser1 = new SoundFile(this, "LASERGN.wav");
  hitship = new SoundFile(this, "metal1.wav");
  hitrock = new SoundFile(this, "break.wav");
  powerups = new SoundFile(this, "BELL.mp3");
  die = new SoundFile(this, "die.wav");
  end = new SoundFile(this, "gameend.mp3");
  levelup = new SoundFile(this, "level.wav");
  s1 = new Spaceship();
  rockTime = 1000;
  rTime = new Timer(rockTime);
  rTime.start();
  puTime = new Timer(15000);
  bg = loadImage("background11.png");
  noCursor();
  level = 1;
  play = false;
}

void draw () {

  if (!play) {
    startScreen();
  } else {
    if (frameCount % 1500 == 0) {
      level = level + 1;
      rockTime-=75;
      levelup.play();
    }

    background(0);
    imageMode(CORNER);
    image(bg,0, backY);
    backY += 1;
    if(backY == 0){
      backY = -1500;
    }
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    //  if (keyPressed && key == ' ') {
    //    lasers.add(new Laser(s1.x, s1.y));
    //  }

    //for (int i = 0; i < lasers.size(); i++) {
    //  Laser laser = lasers.get(i);
    //  laser.display();
    //  laser.move();
    //  if (laser.reachedTop()) {
    //    lasers.remove(laser);
    //  }
    //}


    s1.display();
    s1.move(mouseX, mouseY);
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        hitship.play();
        s1.health -= rock.diam/2;
        rocks.remove(rock);
        score += rock.diam*2;
        //loadImage("Hurt.gif");
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }

    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        powerups.play();
        // Power up list
        // 1. health
        if (pu.type == 'h') {
          s1.health += 75;
          powups.remove(pu);
        } else if (pu.type == 'a') {
          s1.laserCount += 50;
          powups.remove(pu);
        } else if (pu.type == 's') {
          score *= 2;
          powups.remove(pu);
          // 2. ammo
          // 3. sheild
          // 4. increase turrent count
          // 5. freeze / slow rocks
          // 6. 2x points
        }
        if (pu.reachedBottom()) {
          powups.remove(pu);
        }
      }
    }


    for (int i =0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r=rocks.get (j);
        if (laser.intersect(r)) {
          hitrock.play();
          rocks.remove(r);
          score += r.diam;
          lasers.remove(laser);
          r.diam-=2;
          if (r.diam<5) {
            rocks.remove(r);
          }
        }
      }

      laser.display();
      laser.move();
    }
    infoPanel();
    if (s1.health < 1) {
      die.play();
      gameOver();
      noLoop();
    }
  }
}





void keyPressed() {
  if (key == ' ' && s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount --;
  }
}

void mousePressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount --;
  }
}

void infoPanel () {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  textSize(20);
  fill(#FFD700);
  text("Score:" + score, 20, 30);
  fill(255);
  text("Level:" + level, 160, 30);
  fill(#780606);
  text("Health:" + s1.health, 260, 30);
  fill(#93b3e6);
  text("Ammo:" + s1.laserCount, 400, 30);
}

void startScreen () {
  background(0);
  fill(255);
  textSize(20);
  text("START GAME", 205, 300);
  text("click the screen to start", 160, 450);
  text("HI-SCORE", 215, 100);
  text(" " + score, 250, 125);
  if (mousePressed) {
    play = true;
  }
}

void gameOver () {
  end.play();
  background(0);
  fill(255);
  text("GAME END", 205, 300);
}

void ticker () {
}
