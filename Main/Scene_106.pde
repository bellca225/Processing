public class Scene_106 extends BaseScene {
  @Override
  public int getPreviousScene() { return 106; }

  @Override
  public int getNextScene() { return 107; }
  public void setup() {
    println("Scene_106 : setup");

    uiManager.dialogUi.push(uiManager.getDialogDataById("106001"));
    uiManager.dialogUi.push(uiManager.getDialogDataById("106002"));
  }
 
  public void draw() {
    pushStyle();
    
    
    drawManager.drawing();
    uiManager.drawing();
    
    popStyle();
  }
  
  public void mousePressed() {
    loadNextScene();
  }
}
