/* BOX SHOOTER
 * created for Learn to Code: Images, Animation, and Games A group team project
 * version 3.0
 * 
 * @VoidSalamander
 * 16 oct 2023
****/

static abstract class GameType{
  static final int START = 0;
  static final int STANDARD = 1;
  static final int COOLDOWN = 2;
  static final int PAUSE = 3;
}

float cooldown_counter = 0;

int score = 0;
int combo = 0;
int combo_size = 0;

ArrayList<Box> hitboxes;
ArrayList<Throw_Out_Animation> hittedboxes;

int game_manager = 0;

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
  
  /*display*/
  display_board();
  display_boxes();
  display_score_text();
  
  
  for (int i = hittedboxes.size()-1; i > 0; i--) {
    Throw_Out_Animation temp_animation = hittedboxes.get(i);
    temp_animation.update();
    if(temp_animation.fall_out_check()){
      hittedboxes.remove(i);
    }
  }
  
  switch(game_manager){
    case GameType.STANDARD:
      break;
    case GameType.COOLDOWN:
      cooldown_counter --;
      if(cooldown_counter == 0) game_manager = GameType.STANDARD;
      break;
  }
}

void mouseClicked(){
  if(game_manager == GameType.COOLDOWN) return;
  boolean is_hit = false;
  Box temp = hitboxes.get(0);
  if(mouseX < width/3 && temp.row == 0){
    is_hit = true;
  }else if(mouseX < width*2/3 && mouseX >= width/3 && temp.row == 1){
    is_hit = true;
  }else if(mouseX >= width*2/3 && temp.row == 2){
    is_hit = true;
  }
  if(is_hit) hit();
  else miss();
}

void keyPressed(){
  if(game_manager == GameType.COOLDOWN) return;
  boolean is_hit = false;
  Box temp = hitboxes.get(0);
  if(key == 'z' || key == 'Z'){
    if(temp.row == 0) is_hit = true;
  }else if(key == 'x' || key == 'X'){
    if(temp.row == 1) is_hit = true;
  }else if(key == 'c' || key == 'C'){
    if(temp.row == 2) is_hit = true;
  }else{
    return;
  }
  if(is_hit) hit();
  else miss();
}
