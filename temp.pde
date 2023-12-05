static abstract class GameType{
  static final int START = 0;
  static final int STANDARD = 1;
  static final int COOLDOWN = 2;
  static final int PAUSE = 3;
}

class test extends Scene{

  ArrayList<mob> mob_list = new ArrayList<mob>();
  
  test(){
    for(int i=0;i<9;i++){
      mob_list.add(new Normal_mob(int(random(0,3)), i));
    }
  }
  
  void update(){
    display_mob();
  }
  
  void keyPress(){
    boolean is_hit = false;
    int hit_position = -1;
    
    if(key == 'z' || key == 'Z') hit_position = 0;
    else if(key == 'x' || key == 'X') hit_position = 1;
    else if(key == 'c' || key == 'C') hit_position = 2;
    else return;
    
    for (mob temp : mob_list) {
      is_hit = temp.is_hit(hit_position) || is_hit;
    }
    if(is_hit) hit();
  }


  void hit(){
    mob remove_mob = null;
    for (mob temp : mob_list) {
      if(temp.state_update()) remove_mob = temp;
    }
    mob_list.remove(remove_mob);
    if(random(0,1) > 0.5) mob_list.add(0, new righter(int(random(0,3)), 0));
    else mob_list.add(0, new lefter(int(random(0,3)), 0));
    
  }

  void display_mob(){
    for (mob temp : mob_list) {
      temp.update();
    }
  }
}
