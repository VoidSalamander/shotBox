static abstract class GameType{
  static final int START = 0;
  static final int STANDARD = 1;
  static final int COOLDOWN = 2;
  static final int PAUSE = 3;
}

abstract class mob {
  //(col->(0,1,2),row->x)
  PVector position;
  color index_color;
  void init(color input_color, int input_x, int input_y){
    index_color = input_color;
    position = new PVector(input_x, input_y);
  }
  
  void update(){}
  
  boolean is_hit(int input){
    if(position.y == 0 && position.x == input) return true;
    return false;
  }
}

class Normal_mob extends mob{
  Normal_mob(){
    init(red, 0, 0);
  }
}
