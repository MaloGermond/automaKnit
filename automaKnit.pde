PImage work;

void setup() {
  size(500, 800);
  work = createImage(30, 240, RGB);
  initHist(80,730,5,12);
  initSlider(80,20);
  
  
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = color(255);
  }
  work.updatePixels();

  
}

void draw() {
  background(255);
  drawAutomate();
  displayWork(150,-720);
  displayHist();
  displaySlider();
}



//======================================
//
// EVENT
//
//======================================

int selType = 1, selIndex = 0;

void mouseClicked() {
  for(Block el: hist){
    if(el.isSelected()){
      if(mouseButton == RIGHT){
        el.changeType(0, selIndex);
      }else{
      el.changeType(selType, selIndex);
      if(selType == 2){
        el.p = -2;
        el.angle = PI/4;
      }
      }
      genPattern();
    }
  }
  
  if (repetition.select(mouseX, mouseY)) {
    selType = 1;
    selIndex = repetition.index;
  }

  if (condition.select(mouseX, mouseY)) {
    selType = 2;
    selIndex = condition.index;
  }

  if (operation.select(mouseX, mouseY)) {
    selType = 3;
    selIndex = operation.index;
  }
  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) {
    e = 1;
  } else if (e<0) {
    e = -1;
  }

  if (repetition.select(mouseX, mouseY)) {
    repetition.setIndex(int(e));
    selType = 1;
    selIndex = repetition.index;
  }

  if (condition.select(mouseX, mouseY)) {
    condition.setIndex(int(e));
    selType = 2;
    selIndex = condition.index;
  }

  if (operation.select(mouseX, mouseY)) {
    operation.setIndex(int(e));
    selType = 3;
    selIndex = operation.index;
  }
}

void keyReleased() {
  if (key == 'r') {
    
  }else if(key == ' '){
    genPattern();
  }else if(key =='&'){
    selType = 0;
  }else if(key =='é'){
    selType = 1;
  }else if(keyCode == 51){
    selType = 2;
  }else if(keyCode == 52){
    selType = 3;
  }
}