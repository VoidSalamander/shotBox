class Box{
  PVector point = new PVector(0, 0);
  color box_color;
  float offset = 20;
  float size = 160;
  int row;
  
  Box(int list_pos, int input_row){
    point.x = offset + input_row * (offset * 2 + size);
    row = input_row;
    point.y = (7 - list_pos) * (size-offset*2.5);
    box_color = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void update(int list_pos){
    point.y = (7 - list_pos) * (size-offset*3);
    fill(box_color);
    rect(point.x, point.y, 160, 160, 13);
  }
  
  void vibration(){
    fill(box_color);
    rect(point.x+random(15), point.y+random(15), 160, 160, 13);
  }
}

class Throw_Out_Animation{
  PVector speed;
  PVector point;
  color box_color;
  float gravity = 0.6;
  Throw_Out_Animation(Box input_box){
    point = input_box.point;
    box_color = input_box.box_color;
    speed = new PVector(random(-15, 15), random(-15, 0));
  }
  
  void update(){
    point.x += speed.x;
    point.y += speed.y;
    speed.y += gravity;
    fill(box_color);
    rect(point.x, point.y, 160, 160, 13);
  }
  
  boolean fall_out_check(){
    if(point.x > width+160 || point.x < -160 || point.y > height+160) return true;
    return false;
  }
}
