class SceneMain extends Scene{
  rectButton enter_game, go_to_credits;
  
  Scene nextScene;
  
  int ScenePosition = 0;
  boolean is_enter_game = false;
  SceneMain() {
    enter_game = new rectButton(100,100,200,100,"遊戲開始");
    go_to_credits = new rectButton(100,400,200,100,"關於我們");
  }
  
  void update(){
    display_board();
    if(is_enter_game){
      ScenePosition+=20;
      if(ScenePosition > height){
        currentScene = nextScene;
      }
      enter_game.modify_position(100, 100+ScenePosition);
      go_to_credits.modify_position(100, 400+ScenePosition);
    }
    go_to_credits.update();
    enter_game.update();
  }
  
  void keyPress(){
    currentScene = new SceneGame();
  }
  
  void mouseClick(){
    if(enter_game.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new SceneGame();
    }
    if(go_to_credits.is_mouse_enter()){
      is_enter_game = true;
      nextScene = new SceneCredits();
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
