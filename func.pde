void draw_board(){
  fill(154);
  rect(0, 0, width/3, height);
  fill(204);
  rect(width/3, 0, width/3, height);
  fill(154);
  rect(width*2/3, 0, width/3, height);
}

void draw_score_text(){
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
  text(hittedboxes.size(), 500, 930);
}

void hit(){
  score++;
  combo++;
  combo_size = 10;
  hittedboxes.add(new Throw_Out_Animation(hitboxes.get(0)));
  hitboxes.remove(0);
  hitboxes.add(new Box(hitboxes.size(), int(random(0,3))));
}

void miss(){
  combo = 0;
  cooldown = true;
  cooldown_counter = 60;
}
