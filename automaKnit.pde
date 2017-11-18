color cFont, cFond, cPattern;

void setup() {
  //size(displayWidth, displayHeight);
  size(1920, 1080);
  //size(800,600);
  //noCursor();

  cFont = color(0);
  //cFond = color(random(255),random(255),random(255));
  //cPattern = color(random(255),random(255),random(255));
  cFond = color(255);
  cPattern = color(0);

  initWork(51, 300);

  posWork = new PVector(width/2-(work.width*wSize/2), -work.height*wSize);
  initGUI();
}

int sizePeigne = 1;

void draw() {
  background(200);
  
  if (keyPressed == true){
    if(keyCode == 16){
      mouseY = pmouseY;
    }
  }
  
  if(posWork.y % wSize != -3){
    posWork.y ++;
  }
  
  if (posWork.y < -work.height*wSize+(height-100)) {
    posWork.y =  -work.height*wSize+(height-100);
  }
  if (posWork.y > 100) {
    posWork.y =  100;
  }
  mPressed();
  displayWork(posWork.x, posWork.y);
  displayHist();
  drawRobot();
  lineWork();
  previewWork();
  displaySlider();
  //println(drawing.size());
  //messageAccueil();
  
  //saveFrame("logi-######.png");
}

void mPressed(){
  if(mousePressed){
  int posX = round((mouseX-posWork.x-(wSize/2))/wSize);
  int posY = round((mouseY-posWork.y-(wSize/2)-0.5)/wSize);
  

  if (mouseButton == LEFT) { 
    for (int i= hist.size()-1; i>= 0; i--) {
      Block el = hist.get(i);
      if (el.isSelected(posX, posY)) {
        hist.remove(i);
      }
    }
    if (posX < 0 || posX >= work.width
      || posY < 0 || posY <= work.height-1) {
      hist.add(new Block(posX, posY, selType));
    } else if (mouseButton == RIGHT) {
    for (int i= hist.size()-1; i>= 0; i--) {
      Block el =hist.get(i);
      if (el.isSelected(posX, posY)) {
        hist.remove(i);
      }
    }
  }
    //refreshWork();
  }
  }
}

void mouseReleased() {
  int posX = round((mouseX-posWork.x-(wSize/2))/wSize);
  int posY = round((mouseY-posWork.y-(wSize/2)-0.5)/wSize);
  

  if (mouseButton == LEFT) { 
    for(int j=0; j<sizePeigne; j+=2){
      for (int i= hist.size()-1; i>= 0; i--) {
        Block el = hist.get(i);
        if (el.isSelected(posX+j, posY)) {
          hist.remove(i);
        }
      }
      if (posX+j < 0 || posX >= work.width
        || posY+j < 0 || posY <= work.height-1) {
        hist.add(new Block(posX+j, posY, selType));
      }
      refreshWork();
    }
  } else if (mouseButton == RIGHT) {
    for (int i= hist.size()-1; i>= 0; i--) {
      Block el =hist.get(i);
      if (el.isSelected(posX, posY)) {
        hist.remove(i);
      }
    }
 
  }
  
  refreshWork();
  //println(work.height-posY-10);
}



void keyReleased() {
  //println("oui");
  if ( key == 'c') {
    //exportHist(50);
    work.loadPixels();
    for (int i=0; i<work.pixels.length; i++) {
      work.pixels[i] = cFond;
    }
    work.updatePixels();
    drawing.clear();
    hist.clear();
  } else if (key == 'g') {
    for (int i = 0; i <= 20; i++) {
      hist.add(new Block(int(random(work.width)), int(random(work.height)), int(random(2, 8))));
      putValue(random(0,width));
    }
    exectHist();
  } else if (key == 'f') {
    for (int i = 0; i <= 5; i++) {
      hist.add(new Block(int(random(work.width)), int(random(work.height-30, work.height)), 1));
    }
    exectHist();
  } else if (key == 'h') {
    if (showHist) {
      showHist = false;
    } else {
      showHist = true;
    }
  } else if (key == 'r') {
    refreshWork();
  } else if (key == ' ') {
    putValue(mouseX);
    refreshWork();
  }else if (key == 'o') {
    if(sizePeigne > 1)sizePeigne --;
    println(sizePeigne);
  }else if(key == 'p'){
    sizePeigne ++;
    println(sizePeigne);
  }

  if (keyCode == 48 || keyCode == 192)selType = 0;
  if (keyCode == 49)selType = 1;
  if (keyCode == 50)selType = 2;
  if (keyCode == 51)selType = 3;
  if (keyCode == 52)selType = 4;
  if (keyCode == 53)selType = 5;
  if (keyCode == 54)selType = 6;
  if (keyCode == 55)selType = 7;
  if (key == 'e') {
    exportHist(25);
    exportHist(25,false  );
    exportPng();
  }
  if (key == 'l') {
    cFond = color(random(255), random(255), random(255));
    refreshWork();
  }
  if (key == 'm') {
    cPattern = color(random(255), random(255), random(255));
    refreshWork();
  }
  //println(keyCode);
}

void debugMouse() {
  rectMode(CENTER);
  ellipseMode(CENTER);
  int posX = int(map(mouseX, 0, width, 0, work.width*wSize));
  int posY = int(map(mouseY, 0, height, 0, work.height*wSize));
  noStroke();
  fill(200, 0, 0);
  rect(posX, posY, 2, 2);
  /*
  noFill();
   stroke(255, 0, 0);
   ellipse(posX+200, posY-110, 100, 100);*/
}