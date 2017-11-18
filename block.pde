ArrayList<Block> hist = new ArrayList<Block>();
int selType = 0;

class Block {
  PVector pos;
  int type = 0;
  color c = color(255, 0, 0);

  float strenght;


  Block(int _x, int _y, int _type) {
    pos = new PVector(_x, _y);
    type = _type;
    init();

    strenght = int(random(10, work.height));
  }


  void init() {
    switch (type) {
    case 0:
    case 1:
      c = color(#E85657);
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      c = color(#4F9BC8);
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      c= color(#72B75F);
      break;
    }
  }

  void display() {
    rectMode(CORNER);
    noFill();
    stroke(c);
    rect((pos.x*wSize)+posWork.x, (pos.y*wSize)+posWork.y, wSize, wSize);
  }

  void export(int size,boolean dName) {
    exportHist.rectMode(CORNER);
    exportHist.noFill();
    exportHist.strokeWeight(4);
    exportHist.stroke(c);
    exportHist.rect(pos.x*size+2, pos.y*size+2, size-4, size-4);
    //exportHist.strokeWeight(1);

    if(dName == true){
    String name ="";

    name = selName[type];

    exportHist.textFont(tabular);
    exportHist.fill(c);
    exportHist.textSize(size);
    exportHist.text(name, pos.x*size+size+2, pos.y*size+size);
    }
  }

  void rep() {
    if (type == 0)FOR();
    if (type == 1)WHILE();
  }

  void cond() {

    if (type == 2)SPLIT();
    if (type == 3)ELSE();

    if (type == 4) {
      ELSE();
      strenght = 45;
    }
    if (type == 5) {
      ELSE();
      strenght = -45;
    }
    if (type == 6)IF();
    if (type == 7)BREAK();

    if (type == 8)INF();
    if (type == 9)SUP();
    if (type == 10)ADD();
    if (type == 11)DEL();
  }

  void exect() {
    rep();
  }

  void FOR() {
    drawing.add(new Robot(int(pos.x), int(pos.y), round(strenght)));
  }

  void WHILE() {
    drawing.add(new Robot(int(pos.x), int(pos.y), -1));
  }

  void SPLIT() {

    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      if (round(el.pos.x) == round(pos.x) && round(el.pos.y) == round(pos.y)) {
        //println("touch");
        drawing.add(new Robot(round(el.pos.x+1), round(el.pos.y), el.t));
        drawing.add(new Robot(round(el.pos.x-1), round(el.pos.y), el.t));
        //el.dir.rotate(PI/20);
        drawing.remove(i);
      }
    }
  }

  void IF() {
    //println(strenght);
    float angle = map(strenght, 0, width, -1, 1);
   // println(angle);


    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      if (dist(el.pos.x, el.pos.y, pos.x, pos.y) < 50) {
        if (el.pos.x-pos.x < 0 ) {
          el.dir.set(el.dir.rotate(radians(angle)));
        } else {
          el.dir.set(el.dir.rotate(radians(-angle)));
        }
      }
    }
  }

  void ELSE() {

    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      if (int(el.pos.x) == int(pos.x) && int(el.pos.y) == int(pos.y)) {
        el.dir.rotate(radians(strenght));
      }
    }
  }

  void BREAK() {
    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      if (round(el.pos.x) == round(pos.x) && round(el.pos.y) == round(pos.y)) {
        drawing.remove(i);
      }
    }
  }

  void INF() {
    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      if (round(el.pos.x) == round(pos.x) && round(el.pos.y) < round(pos.y)) {        
        el.dir.x *= -1;
        el.pos.x = round(pos.x); 
        el.pos.y = round(el.pos.y);
      }
    }
  }

  void SUP() {
    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      /*if (int(el.pos.x) < int(pos.x) && int(el.pos.y) < int(pos.y)) {
       el.dir.x *= -1;
       el.pos.x = round(el.pos.x);
       el.pos.y = int(el.pos.y);
       }*/
      if (round(el.pos.x) == round(pos.x) && round(el.pos.y) < round(pos.y)) {
        el.dir.x *= -1;
        el.pos.x = round(pos.x); 
        el.pos.y = round(el.pos.y);
      }
    }
  }

  void ADD() {
    //println("add");
    for (int i = drawing.size() - 1; i >= 0; i--) {
      Robot el = drawing.get(i);
      int idInf, idSup; 
      float vInf = 20, vSup = 20;
      if (pos.x-el.pos.x>0 && pos.x-el.pos.x<vInf) {
        idInf = i;
        vInf = pos.x-el.pos.x;
      }
      if (pos.x-el.pos.x>0 && pos.x-el.pos.x<vInf) {
        idSup = i;
        vSup = pos.x-el.pos.x;
      }
    }
    /*
      if (round(el.pos.y) == round(pos.y)) {
     if (pos.x-el.pos.x>0) {
     println(">");
     for (int j = round(el.pos.x); j <= round(pos.x); j++) {
     work.set(j, round(pos.y), cPattern);
     }
     }else{
     for (int j = round(pos.x); j <= round(el.pos.x); j++) {
     work.set(j, round(pos.y), cPattern);
     }
     }
     }
     }*/
  }

  void DEL() {
  }

  boolean isSelected(int x, int y) {
    if (pos.x == x && pos.y == y) {
      //println("selected");
      return true;
    } else {
      return false;
    }
  }
}

boolean showHist = true;

void displayHist() {
  rectMode(CORNER);
  limiteHist();
  if (hist.size() != 0) {
    for (Block el : hist) {
      if (showHist)el.display();
      el.cond();
    }
  }
}

void exectHist() {
  if (hist.size() != 0) {
    for (Block el : hist) {
      el.exect();
    }
  }
}

void putValue(float value) {
  Block el = hist.get(hist.size()-1);
  if (el.type == 0) {
    el.strenght = int(map(round(value), 0, width, 0, work.height));
  } else if (el.type == 3) {
    el.strenght = map(round(value), 0, width, -90, 90);
  } else if  (el.type == 6) {
    el.strenght = value;
  }
}

void limiteHist() {
  for (int i = hist.size() - 1; i >= 0; i--) {
    Block el = hist.get(i);
    if (el.pos.x < 0 || el.pos.x >= work.width
      || round(el.pos.y) < 0 || round(el.pos.y) >= work.height) {
      hist.remove(i);
    }
  }
}