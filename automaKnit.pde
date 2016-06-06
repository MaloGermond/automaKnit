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
  displayWork(150,-720);
  displayHist();
  displaySlider();
}



//======================================
//
// EVENT
//
//======================================

int selType = 0;

void mouseClicked() {
  for(Block el: hist){
    if(el.isSelected()){
      el.changeType(selType);
      genPattern();
    }
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