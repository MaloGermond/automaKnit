PImage work;
PVector posWork;
float wSize= 12;

void initWork(int _x, int _y){
  work = createImage(_x, _y, RGB);
  clearWork();
}


void displayWork(float x, float y) {
  rectMode(CORNER);
  for (int i=0; i<work.width; i++) {
    for (int j=0; j<work.height; j++) {
      noStroke();
      fill(work.get(i, j));
      rect(i*wSize+x, j*wSize+y, wSize, wSize);
    }
  }
}

void clearWork(){
  work.loadPixels();
  for (int i=0; i<work.pixels.length; i++) {
    work.pixels[i] = cFond;
  }
  work.updatePixels();
}


void refreshWork(){
   work.loadPixels();
    for (int i=0; i<work.pixels.length; i++) {
      work.pixels[i] = cFond;
    }
    work.updatePixels();
    drawing.clear();
    exectHist();
}

int wPosX(float x) {
  return int(map(x, 0, width, 0, work.width));
}

int wPosY(float y) {
  return int(map(y, 0, height, 0, work.height));
}