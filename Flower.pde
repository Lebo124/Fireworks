class Flower {
  PVector pos, velocity, newpos;
  float d, e;
  int c;
  int[] rood={205, 92, 92, 255, 0, 0, 238, 0, 0, 205, 0, 0, 139, 0, 0, 178, 34, 34, 255, 48, 48, 238, 44, 44, 205, 38, 38, 
    139, 26, 26, 205, 92, 92, 255, 106, 106, 238, 99, 99, 205, 85, 85, 139, 58, 58, 240, 128, 128, 255, 69, 0, 238, 64, 0, 
    205, 55, 0, 139, 37, 0, 255, 99, 71, 238, 92, 66, 205, 79, 52, 139, 54, 38};
  int[] paars={138, 43, 226, 160, 32, 240, 155, 48, 255, 145, 44, 238, 125, 38, 205, 85, 26, 139, 147, 112, 219, 171, 130, 255, 159, 121, 238, 137, 
    104, 205, 93, 71, 139, 152, 50, 204, 91, 62, 255, 178, 58, 238, 154, 50, 205, 104, 34, 139, 186, 85, 211, 224, 102, 255, 209, 95, 238, 180, 82, 205, 
    122, 55, 139, 218, 112, 214, 255, 131, 250238, 122, 233, 205, 105, 201};
  int[] blauw={135, 206, 250, 176, 226, 255, 135, 206, 250, 176, 226, 255, 0, 154, 205, 92, 172, 238, 79, 148, 205, 54, 100, 139, 30, 144, 255, 28, 134, 238, 24, 116, 205, 16, 78, 
    139, 0, 0, 205, 0, 0, 255, 0, 0, 238, 0, 0, 205, 0, 0, 139, 0, 0, 128, 25, 25, 112, 72, 118, 255, 67, 110, 238, 58, 95, 205, 39, 64, 139, 65, 105, 225};
  int[] kleur;



  Flower(PVector pos_, PVector newpos_, float d_, int c_, float e_) {
    this.pos = pos_.get();
    this.newpos = newpos_.get();
    this.e = e_;
    this.d= d_;
    this.c= c_;
    this.velocity=new PVector(0,-7);
    if (counter>=0) {
      kleur= rood;
    }
    if (counter>=500) {
      kleur= paars;
    }
    if (counter>=1000) {
      kleur= blauw;
    }
    if (counter>=1500) {
      counter=0;
    }
  }


  void display() {
    if (pos.y<210) {
      pushMatrix();
      noStroke();
      translate(this.pos.x + this.newpos.x, this.pos.y+ this.newpos.y);
      for (int i=0; i<37; i++) {
        fill(this.kleur[this.c*3], this.kleur[this.c*3+1], this.kleur[this.c*3+2]);
        bezier(0, 0, 100/d, 100/d, 70/d, 30/d, 0, 0);
        //fill(rood[this.c*3], rood[this.c*3+1], rood[this.c*3+2]);
        //ellipse(0, 0, 20/d, 20/d);
        rotate(degrees(10));
      }
      popMatrix();
    } else {
      stroke(255);
      ellipse(this.pos.x+this.newpos.x, this.pos.y+ this.newpos.y-7, 2, 2);
    }
  }




  void update() {
    if (this.pos.y<210) {
      if (this.d>0.8) {
        this.d += this.e;
      } else {
        d=0.01;
      }
    }
    if (this.pos.y>200) {
      this.pos.add(this.velocity);
    }
  }

  boolean finish() {
    if (d==0.01) { 
      return true;
    } else {
      return false;
    }
  }
}