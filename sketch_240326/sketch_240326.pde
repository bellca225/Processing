//import processing.sound.*;
// 모든 x, y는 해당 오브젝트의 센터를 기준으로 합니다.

class Poop { // 재석
  public int x, y, xDiam, yDiam, speed, click;
  Poop(int x, int y, int xDiam, int yDiam, int speed, int click) {
    this.x = x;
    this.y = y;
    this.xDiam = xDiam;
    this.yDiam = yDiam;
    this.speed = speed;
    this.click = click;
  }

  void draw() {
    pushStyle();
    if (click == 0) {
      image(smallPoop, x - xDiam / 2, y, xDiam, yDiam);
    } else {
      image(bigPoop, x - xDiam / 2, y, xDiam, yDiam);
    }
    popStyle();
  }

  void move() {
    y += speed;
  }

  void increaseSize() { // 똥 크기 조절
    xDiam += 5;
    yDiam += 5;
  }
}

void movePoops() {
  for (int i = poops.size() - 1; i >= 0; i--) {
    Poop p = poops.get(i);
    p.move();
    if (p.y > height) {
      count++;
      poops.remove(i);
    }
  }
}

void drawPoops() {
  for (int i = poops.size() - 1; i >= 0; i--) {
    Poop p = poops.get(i);
    p.draw();
  }
}

void mousePressed() {
  createNewPoop();
}

void createNewPoop() {
  int newSize = 100;
  poops.add(new Poop(mouseX, 130, newSize, newSize, 3, 1));
  //sound = new SoundFile(this, "bigPoop.mp3");
  //sound.play();
}

void addPoopPerSec() {
  if (frameCount % 60 == 0) {
    poops.add(new Poop(mouseX, 130, 50, 50, 3, 0));
    //sound = new SoundFile(this, "smallPoop.mp3");
    //sound.play();
  }
}


class Batchu { // 미선
  public int x = 0, y = 0, duration;
  Batchu(int _duration) {
    this.duration = _duration;
  }
  void move(int _x, int _y) {
    this.x = _x;
    this.y = _y;
  }
  // x와 y좌표를 참고해서 배추의 엉덩이를 그리세요.
  void draw() {

    noStroke();
    //발
    fill(#E38935);
    ellipse(x - 90, y - 60, 40, 50); // L_발
    ellipse(x + 20, y - 60, 40, 50); // R_발

    //발바닥_화이트
    fill(255);
    ellipse(x - 90, y - 60, 30, 40);// L_발바닥_화이트
    ellipse(x + 20, y - 60, 30, 40);// R_발바닥_화이트

    //발바닥_깜장
    fill(0);
    ellipse(x - 90, y - 58, 15, 15);// L_발바닥_깜장
    ellipse(x - 90, y - 45, 9, 9);
    ellipse(x - 80, y - 53, 9, 9);
    ellipse(x - 100, y - 53, 9, 9);
    ellipse(x + 20, y - 58, 15, 15);// R_발바닥_깜장
    ellipse(x + 20, y - 45, 9, 9);
    ellipse(x + 10, y - 53, 9, 9);
    ellipse(x + 30, y - 53, 9, 9);

    //엉덩이
    fill(#E38935);
    beginShape();
    vertex(x - 130, y - 120);
    bezierVertex(x - 130, y - 45, x - 30, y - 45, x - 30, y - 95);
    bezierVertex(x - 30, y - 50, x + 70, y - 45, x + 70, y - 120);
    bezierVertex(x + 70, y - 190, x - 30, y - 190, x - 30, y - 190);
    bezierVertex(x - 30, y - 190, x - 130, y - 190, x - 130, y - 120);
    endShape();

    //꼬리
    fill(255);
    ellipse(x - 30, y - 150, 50, 50);// L_발바닥_깜장
  }
}
class Person {
  // x좌표, y좌표, x지름, y지름, 속도
  public int x, y, xDiam, yDiam, speed;

  Person(int x, int y, int xDiam, int yDiam, int speed) {
    this.x = x;
    this.y = y;
    this.xDiam = xDiam;
    this.yDiam = yDiam;
    this.speed = speed;
  }
  // speed와 키보드의 방향에 따라 좌표를 조정하세요.
  void move(int x, int y) { // 재은
    this.x = x;
    this.y = y;
  }
  // 사람을 그리세요
  void draw() { // 재은
    pushStyle();
    fill(#000000);
    ellipse(x, y, 35, 35);
    stroke(#000000);
    line(x, y + 4, x, y + 70);
    line(x + 52, y + 47, x - 52, y + 47);
    line(x + 2, y + 67, x - 20, y + 115);
    line(x, y + 67, x + 30, y + 115);
    popStyle();
  }

  boolean checkIsTouchedPoops(Person person, ArrayList<Poop> poops) {  // 서현
    return true;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    person.move(person.x - person.speed, person.y);
  } else if (keyCode == RIGHT) {
    person.move(person.x + person.speed, person.y);
  } else if (keyCode == UP) {
    person.move(person.x, person.y - person.speed);
  } else if (keyCode == DOWN) {
    person.move(person.x, person.y + person.speed);
  }
}

int i = 0;
// 꿈을 펼쳐보세요
class WallPaper { // 나영
  // Constants
  private int Y_AXIS = 1;
  private int X_AXIS = 2;
  private color b1, b2;
  WallPaper() {
    this.b1 = color(189, 212, 255);
    this.b2 = color(255);
  }
  WallPaper(color b1, color b2) {
    this.b1 = b1;
    this.b2 = b2;
  }
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
    pushStyle();
    noFill();
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    } else if (axis == X_AXIS) {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
    popStyle();
  }
  void cloud(int x, int y, int size, int speed) {
    pushStyle();
    noStroke();
    int c1 = 30 + x + i;
    int c2 = 55 + x + i;
    int c3 = 20 + x + i;
    int c4 = 50 + x + i;
    int c5 = 75 + x + i;
    if (c5 > 2 * width) {
      fill(243, 247, 255);
      i = 0;
      c1 = 30 + i;
      c2 = 55 + i;
      c3 = 20 + i;
      c4 = 50 + i;
      c5 = 75 + i;
    }
    i += speed;
    fill(243, 247, 255);
    circle(c1, 20 + y, size + 5);
    circle(c2, 15 + y, size);
    circle(c3, 45 + y, size + 10);
    circle(c4, 50 + y, size + 20);
    circle(c5, 35 + y, size + 10);
    popStyle();
  }

  public void setWallPaper() {
    setGradient(0, 0, width, height, b1, b2, Y_AXIS);
    // grass
    pushStyle();
    noStroke();
    fill(#85DE6E);
    rect(0, height - 25, width, 25);
    popStyle();
    // sun
    pushStyle();
    noStroke();
    fill(#FF562C);
    circle(35, 30, 150);
    //sun mouse
    fill(#FFC6C4);
    triangle(20, 50, 80, 50, 50, 80);
    fill(#34A8FF);
    textSize(24);
    text("rainning batchu poops!", 80, 120);
    //sum eyess
    stroke(#740400);
    line(20, 35, 30, 10);
    line(30, 10, 40, 35);
    line(65, 35, 75, 10);
    line(75, 10, 85, 35);
    popStyle();
  }
}


Batchu batchu = new Batchu(3);
Person person;
WallPaper WallPaper = new WallPaper();
ArrayList<Poop> poops = new ArrayList<Poop>();
PImage smallPoop, bigPoop;
//SoundFile sound;
int count = 0;

void checkCollisions() {
  for (int i = poops.size() - 1; i >= 0; i--) {
    Poop p = poops.get(i);
    if (isCollision(p)) {
      gameOver();
    }
  }
}

boolean isCollision(Poop p) {
  return dist(person.x, person.y, p.x, p.y) < person.xDiam / 2 + p.xDiam / 2;
}

void gameOver() {
  background(150, 30, 30, 0.5);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Game Over", width/2, height/2);
  noLoop();
}

void setup() {
  size(1280, 720);
  smallPoop = loadImage("smallPoop.png");
  bigPoop = loadImage("bigPoop.png");
  person = new Person(width / 2, height - 100, 50, 100, 30);
}

// 똥이 화면의 아래를 넘어가면 1점씩 계산해요.
int calculateScore(ArrayList<Poop> poops) { // 서현
  return 0;
}

void drawScore(int score) { // 은지
  pushStyle();
  fill(0);
  textSize(32);
  text("Score: " + score, width - 200, 50);
  popStyle();
}

void draw() {
  WallPaper WallPaper = new WallPaper();
  WallPaper.setWallPaper();
  WallPaper.cloud(0, 20, 30, 1);
  WallPaper.cloud(-250, 80, 30, 1);
  WallPaper.cloud(-120, 180, 30, 1);
  WallPaper.cloud(-440, 140, 30, 1);
  WallPaper.cloud(-620, 0, 30, 1);
  WallPaper.cloud(-800, 180, 30, 1);
  WallPaper.cloud(-950, 60, 30, 1);
  //background(255); // 매 프레임마다 배경을 지워줍니다.
  batchu.move(mouseX, 200);
  batchu.draw();
  drawPoops();
  movePoops();
  addPoopPerSec();
  person.draw();
  checkCollisions();
}