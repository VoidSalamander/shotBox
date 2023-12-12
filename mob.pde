static abstract class MobType{
  static final int STANDARD = 0;
  static final int ATTACKING = 1;
  static final int HITTED = 2;
  static final int DELETED = 3;
}

abstract class mob {
  int size = 160;
  int offset = 20;
  //(col->(0,1,2),row->x)
  PVector position;
  PVector previous;
  
  color index_color;
  boolean delete = false;
  
  int current_type = MobType.STANDARD;
  
  int framerate = 20;
  int current_frame = 0;
  
  float gravity = 0.6;
  PVector acceleration = new PVector(random(-15, 15), random(-15, 0));
  
  void init(int input_x, int input_y){
    index_color = color(random(0, 255), random(0, 255), random(0, 255));
    position = new PVector(input_x, input_y);
    previous = new PVector(input_x, input_y-1);
  }
  
  void update(){
    fill(index_color);
    switch(current_type){
      case MobType.STANDARD:
        rect(offset + map(current_frame, 0, framerate, previous.x, position.x) * (offset * 2 + size), map(current_frame, 0, framerate, previous.y, position.y) *(size-offset*3) -size, size, size, 13);
        if(current_frame != framerate) current_frame++;
        break;
      case MobType.HITTED:
        rect(position.x, position.y, size, size, 13);
        hitted_update();
        if(fall_out_check()) current_type = MobType.DELETED;
        break;
    }
  }
  
  boolean state_update(){
    if(current_type == MobType.DELETED) return true;
    previous.y = position.y;
    if(position.y <= 8) position.y += 1;
    current_frame = 0;
    return false;
  }
  
  boolean is_hit(int input){
    if(position.y == 8 && position.x == input){
      current_type = MobType.HITTED;
      position.set(offset + map(current_frame, 0, framerate, previous.x, position.x) * (offset * 2 + size), map(current_frame, 0, framerate, previous.y, position.y) *(size-offset*3) -size);
      return true;
    }
    return false;
  }
  
  void hitted_update(){
    position.x += acceleration.x;
    position.y += acceleration.y;
    acceleration.y += gravity;
  }
  
  boolean fall_out_check(){
    if(position.x > width+160 || position.x < -160 || position.y > height+160) return true;
    return false;
  }
  
  void vibration(){
    fill(index_color);
    rect(offset + map(current_frame, 0, framerate, previous.x, position.x) * (offset * 2 + size) + random(15), map(current_frame, 0, framerate, previous.y, position.y) *(size-offset*3) -size + random(15), size, size, 13);
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
    if(position.y == 8 && position.x == input){
      if(life == 1){
        life = 0;
        position.x = int(random(0,3));
      }
      else{
        current_type = MobType.HITTED;
      }
      return true;
    }
    return false;
  }
}

class shrinker extends mob{
  shrinker(int input_x, int input_y){
    init(input_x, input_y);
  }

  boolean state_update(){
    if(current_type == MobType.DELETED) return true;
    previous.y = position.y;
    if(position.y <= 8) position.y += 1;
    current_frame = 0;
    size-=16;
    offset += 8;
    return false;
  }

  void update(){
    fill(index_color);
    
    switch(current_type){
      case MobType.STANDARD:
        rect(offset + map(current_frame, 0, framerate, previous.x, position.x) * (offset * 2 + size), map(current_frame, 0, framerate, previous.y, position.y) *(110) -size, size, size, 13);
        if(current_frame != framerate) current_frame++;
        break;
      case MobType.HITTED:
        rect(position.x, position.y, size, size, 13);
        hitted_update();
        if(fall_out_check()) current_type = MobType.DELETED;
        break;
    }
  }
  
  void vibration(){
    fill(index_color);
    rect(offset + map(current_frame, 0, framerate, previous.x, position.x) * (offset * 2 + size) + random(15), map(current_frame, 0, framerate, previous.y, position.y) *(110) -size + random(15), size, size, 13);
  }
}

class lefter extends mob{
  PVector animation_position;
  PVector animation_previous = new PVector(-1,-1);
  
  lefter(int input_x, int input_y){
    init(input_x, input_y);
    animation_position = new PVector(input_x, input_y);
    animation_previous.y = input_y;
  }
  boolean state_update(){
    if(current_type == MobType.DELETED) return true;
    previous = position.copy();
    animation_previous.y = position.y;
    if(position.y <= 8) position.y += 1;
    position.x += 1;
    animation_position = position.copy();
    if(position.x == 3) position.x = 0;
    current_frame = 0;
    return false;
  }
  
  void update(){
    fill(index_color);
    switch(current_type){
      case MobType.STANDARD:
        rect(offset + map(current_frame, 0, framerate, previous.x, animation_position.x)*(offset * 2 + size), map(current_frame, 0, framerate, previous.y, animation_position.y)*(size-offset*3) -size, size, size, 13);
        if(animation_position.x == 3) rect(offset + map(current_frame, 0, framerate, animation_previous.x, position.x)*(offset * 2 + size), map(current_frame, 0, framerate, animation_previous.y, position.y)*(size-offset*3) -size, size, size, 13);
        if(current_frame != framerate) current_frame++;
        break;
      case MobType.HITTED:
        rect(position.x, position.y, size, size, 13);
        hitted_update();
        if(fall_out_check()) current_type = MobType.DELETED;
        break;
    }    
  }
}

class righter extends mob{
  PVector animation_position;
  PVector animation_previous = new PVector(3,-1);
  
  righter(int input_x, int input_y){
    init(input_x, input_y);
    animation_position = new PVector(input_x, input_y);
    animation_previous.y = input_y;
  }
  
  boolean state_update(){
    if(current_type == MobType.DELETED) return true;
    previous = position.copy();
    animation_previous.y = position.y;
    if(position.y <= 8) position.y += 1;
    position.x -= 1;
    animation_position = position.copy();
    if(position.x == -1) position.x = 2;
    current_frame = 0;
    return false;
  }
  
  void update(){
    fill(index_color);
    switch(current_type){
      case MobType.STANDARD:
        rect(offset + map(current_frame, 0, framerate, previous.x, animation_position.x)*(offset * 2 + size), map(current_frame, 0, framerate, previous.y, animation_position.y)*(size-offset*3) -size, size, size, 13);
        if(animation_position.x == -1) rect(offset + map(current_frame, 0, framerate, animation_previous.x, position.x)*(offset * 2 + size), map(current_frame, 0, framerate, animation_previous.y, position.y)*(size-offset*3) -size, size, size, 13);
        if(current_frame != framerate) current_frame++;
        break;
      case MobType.HITTED:
        rect(position.x, position.y, size, size, 13);
        hitted_update();
        if(fall_out_check()) current_type = MobType.DELETED;
        break;
    }    
  }
}
