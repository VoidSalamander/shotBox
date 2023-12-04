static abstract class GameType{
  static final int START = 0;
  static final int STANDARD = 1;
  static final int COOLDOWN = 2;
  static final int PAUSE = 3;
}

abstract class mob {
  int size = 160;
  int offset = 20;
  //(col->(0,1,2),row->x)
  PVector position;
  color index_color;
  boolean hitted = false;
  
  void init(int input_x, int input_y){
    index_color = color(random(0, 255), random(0, 255), random(0, 255));
    position = new PVector(input_x, input_y);
  }
  
  void update(){
    fill(index_color);
    rect(offset + position.x * (offset * 2 + size), position.y * (size-offset*3), size, size, 13);
  }
  
  boolean state_update(){
    if(hitted) return true;
    if(position.y < 7) position.y += 1;
    return false;
  }
  
  boolean is_hit(int input){
    if(position.y == 7 && position.x == input){
      hitted = true;
      return true;
    }
    return false;
  }
}

class Normal_mob extends mob{
  Normal_mob(int input_x, int input_y){
    init(input_x, input_y);
  }
  
}

class Two_life extends mob{
  int life = 1;
  Two_life(int input_x, int input_y){
    init(input_x, input_y);
  }
  boolean is_hit(int input){
    if(position.y == 7 && position.x == input){
      if(life == 1){
        life--;
        position.x += 1;
        if(position.x == 3) position.x = 0;
      }
      else{
        hitted = true;
        return true;
      }

    }
    return false;
  }
}

class shrinker extends mob{
  shrinker(int input_x, int input_y){
    init(input_x, input_y);
  }
  
  boolean state_update(){
    if(hitted) return true;
    if(position.y < 7) position.y += 1;
    size-=20;
    offset += 10;
    return false;
  }
  void update(){
    fill(index_color);
    rect(offset + position.x * (offset * 2 + size), +(110)*(position.y) , size, size, 13);
  }

}
