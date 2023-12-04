class Box{
  PVector point = new PVector(0, 0);
  color box_color;
  float offset = 20;
  float size = 160;
  int row;
  
  float gravity = 0.6;
  PVector speed;
  
  Box(int input_row){
    row = input_row;
    box_color = color(random(0, 255), random(0, 255), random(0, 255));
    speed = new PVector(random(-15, 15), random(-15, 0));
  }
  
  void update(int list_pos){
    fill(box_color);
    point.y = (7 - list_pos) * (size-offset*3);
    point.x = offset + row * (offset * 2 + size);
    rect(point.x, point.y, size, size, 13);
  }
  
  //animation
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
