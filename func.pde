void draw_board(){
  fill(154);
  rect(0, 0, width/3, height);
  fill(204);
  rect(width/3, 0, width/3, height);
  fill(154);
  rect(width*2/3, 0, width/3, height);
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
