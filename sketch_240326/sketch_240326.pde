// 모든 x, y는 해당 오브젝트의 센터를 기준으로 합니다.

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
  }
  Poop makePoop() {
    // duration(초단위) 간격으로 Poop을 만들어 리턴하세요.
    // 만약 마우스가 클릭 상태라면, duration을 초기화하고 큰 Poop을 만들어 리턴하세요.
    this.duration++;
    if (this.duration % 2 == 0) {
      return new Poop(50, 100, 30, 50, 3);
    } else {
      return null;
    }
  }
}

class Poop { // 재석
  // x좌표, y좌표, x지름, y지름, 속도
  public int x, y, xDiam, yDiam, speed;

  Poop(int x, int y, int xDiam, int yDiam, int speed) {
    this.x = x;
    this.y = y;
    this.xDiam = xDiam;
    this.yDiam = yDiam;
    this.speed = speed;
  }
  // speed에 따라 좌표를 조정하세요.
  // 아래로 똥을 움직이세요. 스피드에 따라 속도가 달라져요.
  void move() {
  }
  // x좌표, y좌표, x지름, y지름을 참고해서 똥을 그리세요.
  void draw() {
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
  void move() { // 재은
  }
  // 사람을 그리세요
  void draw() { // 재은
  }
  boolean checkIsTouchedPoops(Person person, ArrayList<Poop> poops) {  // 서현
    return true;
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
Person person = new Person(100, 100, 50, 100, 3);

ArrayList<Poop> poops = new ArrayList<Poop>();
void setup() {
  size(1280, 720);
  background(0);
  WallPaper WallPaper = new WallPaper();
  WallPaper.setWallPaper();
  poops.add(new Poop(50, 100, 30, 50, 3));
}

// 똥이 화면의 아래를 넘어가면 1점씩 계산해요.
int calculateScore(ArrayList<Poop> poops) { // 서현
  return 0;
}

void drawScore(int score) { // 은지
}

void draw() {
  batchu.draw();
  batchu.move(mouseX, 30);
  Poop newPoop = batchu.makePoop();
  if (newPoop != null) {
    poops.add(newPoop);
  }
  WallPaper WallPaper = new WallPaper();
  WallPaper.setWallPaper();
  WallPaper.cloud(0, 20, 30, 1);
  WallPaper.cloud(-250, 80, 30, 1);
  WallPaper.cloud(-120, 180, 30, 1);
  WallPaper.cloud(-440, 140, 30, 1);
  WallPaper.cloud(-620, 0, 30, 1);
  WallPaper.cloud(-800, 180, 30, 1);
  WallPaper.cloud(-950, 60, 30, 1);
  for (int i = 0; i < poops.size(); i++) {
    Poop poop = poops.get(i);
    poop.draw();
    poop.move();
  }

  person.draw();
  person.move();
}
