static abstract class GameType{
  static final int START = 0;
  static final int STANDARD = 1;
  static final int COOLDOWN = 2;
  static final int PAUSE = 3;
}

class test extends Scene{

  ArrayList<mob> mob_list = new ArrayList<mob>();
  
  int current_type = GameType.START;
  int start_time, cooldown_time;
  
  test(){
    start_time = millis();
    for(int i=0;i<9;i++){
      mob_list.add(get_random_mob(random(0,5),i));
    }
  }
  
  void update(){
    switch(current_type){
      case GameType.STANDARD:
        display_mob();
        break;
      case GameType.COOLDOWN:
        if(millis() > cooldown_time + 1000) current_type = GameType.STANDARD;
        for (mob temp : mob_list) {
          if(temp.current_type == MobType.STANDARD) temp.vibration();
          else temp.update();
        }
        break;
      case GameType.START:
        textAlign(CENTER);
        fill(dark);
        textFont(font);
        textSize(180);
        text(str(3-(millis()-start_time)/1000), width/2, height/2);
        if(millis() > start_time + 2950) current_type = GameType.STANDARD;
        break;
      case GameType.PAUSE:
        textAlign(CENTER);
        fill(dark);
        textFont(font);
        textSize(180);
        text("PAUSE", width/2, height/2);
        break;
    }
  }
  
  void keyPress(){
    if(current_type == GameType.COOLDOWN) return;
    
    boolean is_hit = false;
    int hit_position = -1;
    
    if(key == 'p' || key == 'P'){
      if(current_type != GameType.PAUSE) current_type = GameType.PAUSE;
      else{
        start_time = millis();
        current_type = GameType.START;
      }
      return;
    }
    
    if(key == 'z' || key == 'Z') hit_position = 0;
    else if(key == 'x' || key == 'X') hit_position = 1;
    else if(key == 'c' || key == 'C') hit_position = 2;
    else return;
    
    for (mob temp : mob_list) {
      is_hit = temp.is_hit(hit_position) || is_hit;
    }
    if(is_hit) hit();
    else miss();
  }
  
  void miss(){
    current_type = GameType.COOLDOWN;
    cooldown_time = millis();
  }


  void hit(){
    mob remove_mob = null;
    for (mob temp : mob_list) {
      if(temp.state_update()) remove_mob = temp;
    }
    mob_list.remove(remove_mob);
    mob_list.add(get_random_mob(random(0,5),0));
  }

  void display_mob(){
    for (mob temp : mob_list) {
      temp.update();
    }
  }
}
