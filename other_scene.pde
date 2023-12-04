
class SceneCredits extends Scene{
  rectButton back_to_main;
  SceneCredits(){
    back_to_main = new rectButton(100,100,200,100,"回到遊戲");
  }
  
  void update(){
    back_to_main.update();
  }
  
  void mouseClick(){
    if(back_to_main.is_mouse_enter()){
      currentScene = new SceneMain();
    }
  }
  
}
