/* BOX SHOOTER
 * created for Learn to Code: Images, Animation, and Games A group team project
 * version 3.0
 * 
 * @VoidSalamander
 * 16 oct 2023
****/
abstract class Scene {
  void update() {}
  void keyPress(){}
  void mouseClick(){}
}

PFont font;

Scene currentScene;

void setup() {
  size(600, 1000);
  noStroke();
  font = createFont("Cubic_11_1.013_R.ttf", 42);
  currentScene = new test();
}

void draw() {
  display_board();
  currentScene.update();
}

void mouseClicked(){
  currentScene.mouseClick();
}

void keyPressed(){
  currentScene.keyPress();
}

void display_board(){
  fill(gray);
  rect(0, 0, width/3, height);
  fill(white);
  rect(width/3, 0, width/3, height);
  fill(gray);
  rect(width*2/3, 0, width/3, height);
}
