ArrayList<Field> field = new ArrayList<Field>(); //<>//
Field fld;
PVector pos;
PVector vel;
float e;
int counter=0;
void setup() {
  size(800, 800);
  noStroke();
  pos = new PVector(random(100,700), 800);
  vel = new PVector(0, random(30, 70));
  e = random(-0.12, -0.08);
  fld= new Field(floor(random(10, 20)), pos, e);
  field.add(fld);
  
}



void draw() {
  background(0, 0, 150);
  counter++;
  
  if(floor(random(0,50))==40){
    pos = new PVector(random(100,700), 800);
    vel = new PVector(0, random(-3,-7));
    e = random(-0.12, -0.08);
    fld= new Field(floor(random(5, 15)), pos, e);
    field.add(fld);
  }
    for (int i=0; i<field.size(); i++) {
      fld=field.get(i);
      fld.update();
      fld.display();
      if(fld.finish()){
      field.remove(i);
      }
    
  }
}