public class Scene_310 extends BaseScene {
  @Override
  public int getPreviousScene() { return -1; }

  @Override
  public int getNextScene() { return 311; }
  public void setup() {
    uiManager.dialogUi.set(uiManager.getDialogDataById("310001"));

    var boy = objectFactory.create(CharacterType.boy, CharacterPoseType.pray);
    boy.setPosition(400, 500);
    boy.setScale(0.7, 0.7);
    drawManager.addDrawable(boy);

    var girl = objectFactory.create(CharacterType.girl, CharacterPoseType.pray);
    girl.setPosition(600, 500);
    girl.setScale(0.7, 0.7);
    drawManager.addDrawable(girl);

    // 오누이 눈물 이펙트?

    // 구름 추가 필요
    
    // 나무 추가 필요
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
