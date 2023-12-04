class test extends Scene{

  ArrayList<mob> mob_list = new ArrayList<mob>();
  
  test(){
    for(int i=0;i<8;i++){
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
    mob_list.add(new shrinker(int(random(0,3)), 0));
  }

  void display_mob(){
    for (mob temp : mob_list) {
      temp.update();
    }
  }
  
}
