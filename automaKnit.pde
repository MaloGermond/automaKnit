PImage work;

void setup() {
  size(350, 800);
  work = createImage(30, 240, RGB);
  initHist(20,730,5,10);
  
  
  
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = color(255);
  }
  work.updatePixels();

  
}

void draw() {
  background(200);
  displayWork();
  displayHist();
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
    }
   
  }
}


void keyReleased() {
  if (key == 'r') {
    work.loadPixels();
    for (int i=0; i<work.pixels.length; i++) {
      work.pixels[i] = color(255);
    }
    work.updatePixels();

    //WHILE (int(random(work.width)), 249);

    for (int i=0; i< 10; i++) {
      WHILE (int(random(work.width)), 249);
    }
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