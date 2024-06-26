public class Scene_107 extends BaseScene {
  @Override
  public int getPreviousScene() { return 107; }

  @Override
  public int getNextScene() { return 108; }
  public void setup() {
    println("Scene_107 : setup");
    uiManager.dialogUi.enqueue(uiManager.getDialogDataById("107001"));
    uiManager.dialogUi.enqueue(uiManager.getDialogDataById("107002"));

    uiManager.dialogUi.next();

    var storyboard = objectFactory.create("compressedRes/images/storyboard/107.png");
    storyboard.setPosition(width / 2, height / 2);
    drawManager.addDrawable(storyboard);
  }
 
  public void draw() {
    pushStyle();
    
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    if (uiManager.dialogUi.next()) {
      return;
    }
    loadNextScene();
  }
}
