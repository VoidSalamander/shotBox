class SceneCredits extends Scene{
  rectButton back_to_main;
  SceneCredits(){
    back_to_main = new rectButton(width/2-100,800,200,100,"回到遊戲");
  }
  
  void update(){
    textAlign(CENTER);
    fill(dark);
    textFont(font);
    textSize(40);
    text("目前空無一物", width/2, height/2);
    back_to_main.update();
  }
  
  void mouseClick(){
    if(back_to_main.is_mouse_enter()){
      currentScene = new SceneMain();
    }
  }
}

class SceneTutorial extends Scene{
  rectButton back_to_main;
  SceneTutorial(){
    back_to_main = new rectButton(width/2-100,800,200,100,"回到遊戲");
  }
  
  void update(){
    textAlign(CENTER);
    fill(dark);
    textFont(font);
    textSize(40);
    text("目前空無一物", width/2, height/2);
    back_to_main.update();
  }
  
  void mouseClick(){
    if(back_to_main.is_mouse_enter()){
      currentScene = new SceneMain();
    }
  }
}

class SceneSetting extends Scene{
  rectButton back_to_main;
  SceneSetting(){
    back_to_main = new rectButton(width/2-100,800,200,100,"回到遊戲");
  }
  
  void update(){
    textAlign(CENTER);
    fill(dark);
    textFont(font);
    textSize(40);
    text("目前空無一物", width/2, height/2);
    back_to_main.update();
  }
  
  void mouseClick(){
    if(back_to_main.is_mouse_enter()){
      currentScene = new SceneMain();
    }
  }
}
