public class Scene_104 extends BaseScene {
  public float hammerZAngle = 0;
  public Hammer hammer = new Hammer(200, 200);
  public HPBar hpBar = new HPBar(20, 20);
  public Rock1 rock1 = new Rock1(300, 340);
  public float rock1X = 300;
  public float rock1XDirection = 1;
  public float rock1ZAngle = 0;

  @Override
  public int getPreviousScene() { return 104; }

  @Override
  public int getNextScene() { return 105; }

  public void setup() {
    drawManager.addDrawable(hammer);
    hammer.d_rotate(hammerZAngle);
    drawManager.addDrawable(hpBar);
    drawManager.addDrawable(rock1);
    uiManager.dialogUi.set(uiManager.getDialogDataById("104001"));
  }
 
  public void draw() {
    var xBuffer = 5;
    if (rock1X + xBuffer > 600 || rock1X - xBuffer < 250) {
      rock1XDirection *= -1;
    }
    rock1ZAngle = rock1ZAngle + 1 % 360;
    rock1X = rock1X + xBuffer * rock1XDirection;
    rock1.setPosition(rock1X, rock1.getY());
    rock1.d_rotate(rock1ZAngle);
    pushStyle();
    if (keyPressed) {
      // test: up 키로 씬 넘어가기
      if (keyCode == 38) {
        println("space");
        loadNextScene();
      }


      boolean left = keyCode == 37;
      boolean right = keyCode == 39;
      if (left) {
        hammerZAngle = min(hammerZAngle + 5, 90);
      }
      if (right) {
        hammerZAngle = max(hammerZAngle = hammerZAngle - 10, 0);
        if (hammerZAngle == 0) {
          hpBar.hp = min(hpBar.hp + 10, 100);
        }
      }    
      hammer.d_rotate(hammerZAngle * -1);
    }

    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  
}
