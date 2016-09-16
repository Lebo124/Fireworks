class Field {
  int number, c;
  PVector pos;
  PVector newpos;
  float d, e;
  
  int x, y; 
  float size;
  ArrayList<Flower> flowers;
  Flower flw;

  Field(int number_, PVector pos_, float e_) {
   
    this.number = number_;
    this.e= e_;
    flowers = new ArrayList<Flower>(number);

    for (int i=0; i<this.number; i++) {
      this.pos = pos_.get();
      x = floor(random(-40, 40));
      y = floor(random(-40, 40));  
      newpos = new PVector(x, y);

      size = random(3, 8);
      c=floor(random(0, 23));
      flowers.add(new Flower(this.pos, this.newpos, this.size, this.c, this.e));
    }
  }

  void display() {

    for (int i=0; i<flowers.size(); i++) {
      flw = flowers.get(i);
      flw.display();
      if(flw.finish()){
      flowers.remove(i);
      }
    }
  }

  void update() {
    for (int i=0; i<flowers.size(); i++) {
      flw = flowers.get(i);
      flw.update();
    }
  }
  
  boolean finish() {
    if (flowers.size()==1) { 
      return true;
    } else {
      return false;
    }
  }
}