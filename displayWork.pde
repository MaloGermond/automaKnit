float wSize= 6;

void createWork() {
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = color(255);
  }
  work.updatePixels();
}

void displayWork(int x, int y) {
  rectMode(CORNER);
  
  for (int i=0; i<work.width; i++) {
    for (int j=0; j<work.height; j++) {
      noStroke();
      fill(work.get(i, j));
      rect(i*wSize+x, j*wSize+y, wSize, wSize);
    }
  }
  
  noFill();
  stroke(0);
  line(x,0,x,work.height*wSize+y);
  line(x+work.width*wSize,0,x+work.width*wSize,work.height*wSize+y);

  /* debug position souris sur PImage work
   fill(255,0,0);
   rectMode(CENTER);
   rect(int(wMouseX()),int(wMouseY()),5,5);
   */
}

float wMouseX() {
  float value = mouseX/wSize;
  return value;
}

float wMouseY() {
  float value = mouseY/wSize;
  return value;
}