public class Scene_108 extends BaseScene {
  @Override
  public int getPreviousScene() { return 108; }

  @Override
  public int getNextScene() { return 109; }
  public void setup() {
    println("Scene_108 : setup");
    uiManager.dialogUi.enqueue(uiManager.getDialogDataById("108001"));
    uiManager.dialogUi.enqueue(uiManager.getDialogDataById("108002"));

    uiManager.dialogUi.next();
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
