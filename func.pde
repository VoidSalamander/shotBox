void display_board(){
  fill(154);
  rect(0, 0, width/3, height);
  fill(204);
  rect(width/3, 0, width/3, height);
  fill(154);
  rect(width*2/3, 0, width/3, height);
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
<<<<<<< Updated upstream
  remove_boxes.add(hitboxes.get(0));
=======
  
  Box temp;
  for (int i = hitboxes.size()-1; i >= 4; i--) {
    temp = hitboxes.get(i);
    temp.jump_row();
  }
  
  if(GameSetting.IS_USE_PLUS_REMOVE_ANIMATION){
    
    for(int i=0;i<4;i++){
      Box Ori_box, temp_animation;
      Ori_box = hitboxes.get(0);
      temp_animation = new Box(0, 0);
      temp_animation.size = Ori_box.size/2;
      temp_animation.point = Ori_box.point;
      temp_animation.speed = new PVector(10, 0);
      remove_boxes.add(temp_animation);
    }
  }else{
    remove_boxes.add(hitboxes.get(0));
  }
>>>>>>> Stashed changes
  hitboxes.remove(0);
  hitboxes.add(new Box(hitboxes.size(), int(random(0,3))));
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

void display_remove_animation_plus(){
  Box temp_animation;
  for (int i = remove_boxes.size()-1; i >= 0; i--) {
    temp_animation = remove_boxes.get(i);
    temp_animation.animation_update();
    if(temp_animation.fall_out_check()){
      remove_boxes.remove(i);
    }
  }
}
