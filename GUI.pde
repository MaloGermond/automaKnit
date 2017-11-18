PFont tabular;
String[] selName = new String [12];

void initGUI() {
  selName[0] = "for";
  selName[1] = "while";
  selName[2] = "split";
  selName[3] = "else if";
  selName[4] = "else if +45";
  selName[5] = "else if -45";
  selName[6] = "if";
  selName[7] = "break";
  selName[8] = "inf";
  selName[9] = "sup";
  selName[10] = "add";
  selName[11] = "del";


  tabular = createFont("Tabular-Black", 24);
  textFont(tabular);
  initSlider(50, 100);
}

//======================================
//
// Interface graphique
//
//======================================

SliderBar type;

void initSlider(int x, int y) {
  type = new SliderBar("type", 12);
  type.setPos(x, y);
}

void displaySlider() {
  type.display();
}

class SliderBar {
  PVector pos;
  int index = 0;
  PImage[] icones;

  SliderBar(String name, int q) {
    icones = new PImage[q];
    for (int i = 1; i<=q; i++) {
      icones[i-1] = loadImage(name+"_"+i+".png");
    }
  }

  void setPos(float x, float y) {
    pos = new PVector(x, y);
  }

  void setIndex(int value) {
    index += value;

    if (index > icones.length -1) {
      index = icones.length -1;
    } else if (index < 0) {
      index = 0;
    }
  }

  boolean select(float x, float y) {
    if (x > pos.x && x < pos.x+100 &&
      y > pos.y && y < pos.y+(30*icones.length)) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    textSize(24);

    for (int i = 0; i<icones.length; i++) {
      if (selType == i) {
        image(icones[i], pos.x, pos.y+i*30, 100, 30);
        fill(0);
        text(selName[i], pos.x+105, pos.y+i*30+29);
      } else {
        fill(150);
        stroke(150);
        line(pos.x, pos.y+i*30, pos.x, pos.y+30+i*30);
        line(pos.x, pos.y+20+i*30, pos.x+10, pos.y+20+i*30);
        text(selName[i], pos.x+10, pos.y+i*30+22);
      }
    }
    //image(icones[index], pos.x, pos.y, 100, 30);
  }
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) {
    e = 1;
  } else if (e<0) {
    e = -1;
  }

  if (type.select(mouseX, mouseY)) {
    type.setIndex(int(e));
    selType = type.index;
  } else {
    e = -event.getCount()*3;
    posWork.add(0, e);
  }
}


//======================================
//
// LineWork
//
//======================================

void lineWork() {
  stroke(0);
  noFill();
  strokeWeight(2);

  line(200, height-100, width-200, height-100);

  for (int i = 0; i<=work.width; i++) {
    line(i*wSize+posWork.x, height-100, i*wSize+posWork.x, height-100-(wSize/2));
  } 

  strokeWeight(1);
}

//======================================
//
// prewiewWork
//
//======================================

void previewWork() {
  image(work, width-work.width-50, 20);
  rectMode(CORNER);
  noFill();
  stroke(255, 0, 0);
  rect(width-work.width-50, 
    20-(posWork.y/wSize), 
    work.width, 
    height/wSize);
}

//======================================
//
// export
//
//======================================

PGraphics exportPng;

void exportPng() {
  exportPng = createGraphics(work.width, work.height);
  exportPng.beginDraw();
  exportPng.image(work, 0, 0);
  exportPng.endDraw();
  exportPng.save("export"+day()+"_"+month()+"_"+year()+"___"+hour()+"_"+minute()+"_"+second()+".png");
}

PGraphics exportHist;

void exportHist(int size, boolean description){
 
     exportHist = createGraphics(work.width*size, work.height*size);
  exportHist.beginDraw();
  exportHist.rectMode(CORNER);
  for (int i=0; i<work.width; i++) {
    for (int j=0; j<work.height; j++) {
      exportHist.noStroke();
      exportHist.fill(work.get(i, j));
      exportHist.rect(i*size, j*size, size, size);
    }
  }

  for (Block el : hist) {
    el.export(size,description);
  }

  exportHist.endDraw();
  exportHist.save("exportHist_noDes"+day()+"_"+month()+"_"+year()+"___"+hour()+"_"+minute()+"_"+second()+".jpg");

  }


void exportHist(int size) {
  exportHist = createGraphics(work.width*size, work.height*size);
  exportHist.beginDraw();
  exportHist.rectMode(CORNER);
  for (int i=0; i<work.width; i++) {
    for (int j=0; j<work.height; j++) {
      exportHist.noStroke();
      exportHist.fill(work.get(i, j));
      exportHist.rect(i*size, j*size, size, size);
    }
  }

  for (Block el : hist) {
    el.export(size,true);
  }

  exportHist.endDraw();
  exportHist.save("exportHist"+day()+"_"+month()+"_"+year()+"___"+hour()+"_"+minute()+"_"+second()+".jpg");
}

int timerMouse, vMouseX, vMouseY;
void messageAccueil(){
  
  if(vMouseX != mouseX || vMouseY != mouseY){
    vMouseX = mouseX;
    vMouseY = mouseY;
    timerMouse = frameCount+100; 
  }
  
  if(frameCount > timerMouse){
    fill(0);
    rect(width/2-110, height/2-110, 220, 220, 10);
    fill(255);
    textSize(12);
    text("Bonjour,\nje suis un outils\nqui permet de dessiner\ndes motifs.\nViens m'essayer\non est bien !\nEt si tu ne comprend pas\n...\ndemande super Malo !", 
    width/2-100, height/2-100, 200,200);
  }
}