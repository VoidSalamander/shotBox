int Two_life = 0;
int shrinker = 1;
int lefter = 1;
int righter = 1;

mob get_random_mob(float rand, int i){
  if(random(0,1) < 0.3) return new lefter(int(random(0,3)), i);
  if(random(0,1) < 0.6) return new lefter(int(random(0,3)), i);
  return new shrinker(int(random(0,3)), i);
}
