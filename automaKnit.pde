PImage work;

void setup() {
  size(300, 800);
  work = createImage(30, 240, RGB);
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = color(255);
  }
  work.updatePixels();

  WHILE (20, 249);
  //WHILE (19, 249);
  for (int i=0; i< 10; i++) {
  }
}

void draw() {
  background(200);
  displayWork();
}



//======================================
//
// EVENT
//
//======================================

void mouseClicked() {
  IF(int(wMouseX()), int(wMouseY()), 3, 10);
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
  }
}