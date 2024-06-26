public class Scene_307 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 308; }
  public void setup() {

    // 나무 리소스 교체해야 할듯
    var tree = objectFactory.create("compressedRes/images/objects/the_base_of_a_tree.png");
    tree.setPosition(600, 400);
    drawManager.addDrawable(tree);

    var axe = new Axe(200, 200);
    axe.d_rotate(0);
    drawManager.addDrawable(axe);

    axe = new Axe(200, 200);
    axe.d_rotate(90);
    drawManager.addDrawable(axe);

    var oil = objectFactory.create("compressedRes/images/objects/oil.png");
    oil.setPosition(400, 400);
    drawManager.addDrawable(oil);



    uiManager.dialogUi.set(uiManager.getDialogDataById("307001"));
  }
 
  public void draw() {
    pushStyle();
    
    drawGradientBackground();
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
