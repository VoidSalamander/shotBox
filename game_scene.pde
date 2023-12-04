

class SceneGame extends Scene{
  
  float cooldown_counter = 0;
  
  int score = 0;
  int combo = 0;
  int combo_size = 0;
  int level = 0;
  
  ArrayList<Box> hitboxes = new ArrayList<Box>();
  ArrayList<Box> remove_boxes = new ArrayList<Box>();
  
  int game_manager = 0;
  SceneGame(){
    for(int i=0;i<8;i++){
      hitboxes.add(new Box(int(random(0,3))));
    }
  }
  
  void update(){
    display_board();
    display_boxes();
    display_score_text();
    display_remove_animation();
  
    switch(game_manager){
      case GameType.STANDARD:
        break;
      case GameType.COOLDOWN:
        cooldown_counter --;
        if(cooldown_counter == 0) game_manager = GameType.STANDARD;
        break;
    }
  }
  
  void keyPress(){
    if(game_manager == GameType.COOLDOWN) return;
    boolean is_hit = false;
    Box temp = hitboxes.get(0);
    if(key == 'z' || key == 'Z'){
      if(temp.row == 0) is_hit = true;
    }else if(key == 'x' || key == 'X'){
      if(temp.row == 1) is_hit = true;
    }else if(key == 'c' || key == 'C'){
      if(temp.row == 2) is_hit = true;
    }else{
      return;
    }
    if(is_hit) hit();
    else miss();
  }
  
  void mouseClick(){
    if(game_manager == GameType.COOLDOWN) return;
    boolean is_hit = false;
    Box temp = hitboxes.get(0);
    if(mouseX < width/3 && temp.row == 0){
      is_hit = true;
    }else if(mouseX < width*2/3 && mouseX >= width/3 && temp.row == 1){
      is_hit = true;
    }else if(mouseX >= width*2/3 && temp.row == 2){
      is_hit = true;
    }
    if(is_hit) hit();
    else miss();
  }

  void display_score_text(){
    //Score
    textSize(98);
    textAlign(CENTER, CENTER);
    fill(0, 55, 55, 55);
    text(score, 300, 930);
    //Combo
    textSize(98+combo_size);
    fill(235);
    text(combo, 100, 930);
    if(combo_size > 0) combo_size--;
    //Animation count
    textSize(98);
    fill(235);
    text(remove_boxes.size(), 500, 930);
  }

  void hit(){
    score++;
    combo++;
    combo_size = 10;
    
    remove_boxes.add(hitboxes.get(0));
    
    hitboxes.remove(0);
    hitboxes.add(new Box(int(random(0,3))));
  }
  
  void miss(){
    combo = 0;
    game_manager = GameType.COOLDOWN;
    cooldown_counter = 60;
  }

  void display_boxes(){
    Box temp;
    for (int i = hitboxes.size()-1; i > 0; i--) {
      temp = hitboxes.get(i);
      temp.update(i);
    }
    temp = hitboxes.get(0);
    if(game_manager == GameType.COOLDOWN){
      temp.vibration();
    }else{
      temp.update(0);
    }
  }

  void display_remove_animation(){
    Box temp_animation;
    for (int i = remove_boxes.size()-1; i >= 0; i--) {
      temp_animation = remove_boxes.get(i);
      temp_animation.animation_update();
      if(temp_animation.fall_out_check()){
        remove_boxes.remove(i);
      }
    }
  }
  
}
