int Two_life = 0;
int shrinker = 1;
int lefter = 1;
int righter = 1;

mob get_random_mob(float rand, int i){
  int num_count = 0;
  num_count += Two_life;
  if(num_count < rand) return new Normal_mob(int(random(0,3)), i);
  num_count += shrinker;
  if(num_count < rand) return new shrinker(int(random(0,3)), i);
  num_count += lefter;
  if(num_count < rand) return new lefter(int(random(0,3)), i);
  num_count += righter;
  if(num_count < rand) return new righter(int(random(0,3)), i);
  
  return new Normal_mob(int(random(0,3)), i);
}
