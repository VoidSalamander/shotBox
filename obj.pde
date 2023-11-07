class Box{
  PVector point = new PVector(0, 0);
  color box_color;
  float offset = 20;
  float size = 160;
  int row;
  
  float gravity = 0.6;
  PVector speed;
  
  Box(int list_pos, int input_row){
    point.x = offset + input_row * (offset * 2 + size);
    row = input_row;
    point.y = (7 - list_pos) * (size-offset);
    box_color = color(random(0, 255), random(0, 255), random(0, 255));
    speed = new PVector(random(-15, 15), random(-15, 0));
  }
  
  void update(int list_pos){
    point.y = (7 - list_pos) * (size-offset*3);
    fill(box_color);
<<<<<<< Updated upstream
    rect(point.x, point.y, 160, 160, 13);
=======
    point.x = offset + row * (offset * 2 + size);
    rect(point.x, point.y, size, size, 13);
>>>>>>> Stashed changes
  }
  
  void vibration(){
    fill(box_color);
    rect(point.x+random(15), point.y+random(15), 160, 160, 13);
  }
  
  void animation_update(){
    point.x += speed.x;
    point.y += speed.y;
    speed.y += gravity;
    fill(box_color);
    rect(point.x, point.y, size, size, 13);
  }
  
  boolean fall_out_check(){
    if(point.x > width+160 || point.x < -160 || point.y > height+160) return true;
    return false;
  }
}

class Level{
  int this_level;
  ArrayList<level_node> node;
  
  Level(int input_level){
    this_level = input_level;
  }
}

class level_node{
  int proportion;
  int box_type;
  level_node(int input_proportion, int input_box_type){
    proportion = input_proportion;
    box_type = input_box_type;
  }
}
