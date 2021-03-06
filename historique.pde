//======================================
//
// HISTORIQUE
//
//======================================
// ici se trouve toutes les fonctions relative à l'historique.

class Block {
  int x, y;

  String type = "";
  int index = 0;
  float size;
  float p, angle = 0;


  Block(int _x, int _y, int _size) {
    x = _x;
    y = _y;
    size = _size;
  }

  void display() {
    rectMode(CORNER);

    switch(type) {
    case "rep":

      fill(#E85758);
      break;
    case "cond":
      fill(#509AC7);
      break;
    case "ope":
      fill(#72B760);
      break;
    default:
      fill(255);
      break;
    }

    stroke(0);
    rect(x, y, size, size);
    select();
  }

  void select() {
    if (mouseX>=x+1 && mouseX < x+size+1 && mouseY >= y+1 && mouseY < y+size+1) {
      fill(0, 100);
      rect(x, y, size, size);
    }
  }

  boolean isSelected() {
    if (mouseX>=x+1 && mouseX < x+size+1 && mouseY >= y+1 && mouseY < y+size+1) {
      return true;
    }
    return false;
  }

  void changeType(int _type, int num) {
    if (_type == 1) {
      type = "rep";
    } else if (_type == 2) {
      type = "cond";
    } else if (_type == 3) {
      type = "ope";
    } else {
      type = "";
    }

    index = num;
  }
}


ArrayList<Block> hist = new ArrayList<Block>();

void initHist(int x, int y, int h, int size) {
  for (int j=0; j<h; j++) {
    for (int i=0; i<work.width; i++) {
      hist.add(new Block(i*size+x, j*size+y, size));
    }
  }
}

void displayHist() {
  rectMode(CORNER);
  for (Block el : hist) {
    el.display();
  }
}

void genPattern() {
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = color(255);
  }

  drawing.clear();


  for (int i = hist.size() - 1; i >= 0; i--) {
    int _x = i%(work.width);
    int _y = (i/(work.width))+work.height-1;

    Block el = hist.get(i);
    if (el.type == "rep") {
      if (el.index == 0) {
        drawing.add(new Automate(_x, _y, 100));
      } else {
        drawing.add(new Automate(_x, _y, work.height));
      }
    }
  }
  
  
  for (int i = hist.size() - 1; i >= 0; i--) {
    int _x = i%(work.width);
    int _y = (i/(work.width))+work.height-1;

    Block el = hist.get(i);
    
    if (el.type == "cond"){
      for(Automate ro: drawing){
        println(_y);
        if(el.p > 0 && ro.pos.y == _y){
          if((ro.pos.x-_x) <= el.p && (ro.pos.x-_x) >= 1){
            ro.dir.rotate(el.angle);
          }
        }else {
          if((ro.pos.x-_x) >= el.p && (ro.pos.x-_x) <= -1){
            ro.dir.rotate(el.angle);
          }
        }
      }
  }
}

work.updatePixels();
}