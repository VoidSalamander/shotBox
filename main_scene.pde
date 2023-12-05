class SceneMain extends Scene{
  rectButton enter_game, go_to_credits, go_to_tutorial, go_to_setting, exit;
  
  Scene nextScene;
  
  int ScenePosition = 0;
  boolean is_enter_game = false;
  SceneMain() {
    enter_game = new rectButton(width/2-100,100,200,100,"遊戲開始");
    go_to_credits = new rectButton(width/2-100,300,200,100,"關於我們");
    go_to_tutorial = new rectButton(width/2-100,500,200,100,"遊戲教學");
    go_to_setting = new rectButton(width/2-100,700,200,100,"遊戲設定");
    exit = new rectButton(width/2-100,900,200,100,"離開遊戲");
  }
  
  void update(){
    if(is_enter_game){
      ScenePosition+=20;
      if(ScenePosition > height){
        currentScene = nextScene;
      }
      enter_game.modify_position(width/2-100, 100+ScenePosition);
      go_to_credits.modify_position(width/2-100, 300+ScenePosition);
      go_to_tutorial.modify_position(width/2-100, 500+ScenePosition);
      go_to_setting.modify_position(width/2-100, 700+ScenePosition);
      exit.modify_position(width/2-100, 700+ScenePosition);
    }
    go_to_credits.update();
    enter_game.update();
    go_to_setting.update();
    go_to_tutorial.update();
    exit.update();
  }
  
  void keyPress(){
    currentScene = new test();
  }
  
  void mouseClick(){
    if(enter_game.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new test();
    }
    if(go_to_credits.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new SceneCredits();
    }
    if(go_to_tutorial.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new SceneTutorial();
    }
    if(go_to_setting.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new SceneSetting();
    }
    if(exit.is_mouse_enter()){
      exit();
    }
  }
}

class rectButton{
  PVector position, size;
  String text;
  rectButton(int input_x, int input_y, int input_w, int input_h, String input_text){
    position = new PVector(input_x, input_y);
    size = new PVector(input_w, input_h);
    text = input_text;
  }
  
  void update(){
    fill(blue);
    if(is_mouse_enter()){
      rect(position.x-10, position.y-10, size.x+20, size.y+20, 13);
    }else{
      rect(position.x, position.y, size.x, size.y, 13);
    }
    display_text();
  }
  void display_text(){
    fill(yellow);
    textFont(font);
    textAlign(CENTER, CENTER);
    text(text, position.x + size.x/2, position.y + size.y/2);
  }
  
  void modify_position(int input_x, int input_y){
    position.x =  input_x;
    position.y =  input_y;
  }
  
  boolean is_mouse_enter(){
    if(mouseX > position.x && mouseX < position.x+size.x && mouseY > position.y && mouseY < position.y+size.y){
      return true;
    } 
    return false;
  }
}
