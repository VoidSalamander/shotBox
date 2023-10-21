/* BOX SHOOTER
 * created for Learn to Code: Images, Animation, and Games A group team project
 * version 3.0
 * 
 * @VoidSalamander
 * 16 oct 2023
****/

boolean cooldown = false;
float cooldown_counter = 0;

int score = 0;
int combo = 0;
float combo_size = 0;

ArrayList<Box> hitboxes;
ArrayList<Throw_Out_Animation> hittedboxes;

void setup() {
  size(600, 1000);
  noStroke();
  
  hitboxes = new ArrayList<Box>();
  hittedboxes = new ArrayList<Throw_Out_Animation>();
  
  for(int i=0;i<8;i++){
    hitboxes.add(new Box(i, int(random(0,3))));
  }

}

void draw() {
  background(204);
  //hit();
  fill(154);
  rect(0, 0, width/3, height);
  fill(204);
  rect(width/3, 0, width/3, height);
  fill(154);
  rect(width*2/3, 0, width/3, height);
  Box temp;
  
  for (int i = hitboxes.size()-1; i > 0; i--) {
    temp = hitboxes.get(i);
    temp.update(i);
  }
  
  if(cooldown){
    temp = hitboxes.get(0);
    temp.vibration();
    cooldown_counter --;
    if(cooldown_counter == 0) cooldown = false;
  }else{
    temp = hitboxes.get(0);
    temp.update(0);
  }
  
  for (int i = hittedboxes.size()-1; i > 0; i--) {
    Throw_Out_Animation temp_animation = hittedboxes.get(i);
    temp_animation.update();
    if(temp_animation.fall_out_check()){
      hittedboxes.remove(i);
    }
  }
  
  textSize(98);
  textAlign(CENTER, CENTER);
  fill(0, 55, 55, 55);
  text(score, 300, 930);
  textSize(98+combo_size);
  fill(235);
  text(combo, 100, 930);
  textSize(98);
  fill(235);
  text(hittedboxes.size(), 500, 930);
  if(combo_size > 0) combo_size--;
}

void mouseClicked(){
  if(cooldown) return;
  boolean is_hit = false;
  Box temp = hitboxes.get(0);
  if(mouseX < width/3 && temp.row == 0){
    is_hit = true;
  }else if(mouseX < width*2/3 && mouseX >= width/3 && temp.row == 1){
    is_hit = true;
  }else if(mouseX >= width*2/3 && temp.row == 2){
    is_hit = true;
  }
  if(is_hit){
    hit();
  }else{
    miss();
  }
}

void keyPressed(){
  if(cooldown) return;
  boolean is_hit = false;
  Box temp = hitboxes.get(0);
  if(key == 'z' || key == 'Z'){
    if(temp.row == 0) is_hit = true;
  }else if(key == 'x' || key == 'X'){
    if(temp.row == 1) is_hit = true;
  }else if(key == 'c' || key == 'C'){
    if(temp.row == 2) is_hit = true;
  }
  if(is_hit){
    hit();
  }else{
    miss();
  }
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
