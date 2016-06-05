float wSize= 3;

void displayWork(){
  rectMode(CORNER);
  
  for (int i=0; i<work.width; i++) {
     for (int j=0; j<work.height; j++){
       noStroke();
       fill(work.get(i,j));
       rect(i*wSize,j*wSize,wSize,wSize);
     }
  }
  
  /* debug position souris sur PImage work
  fill(255,0,0);
  rectMode(CENTER);
  rect(int(wMouseX()),int(wMouseY()),5,5);
  */
}

float wMouseX(){
  float value = mouseX/wSize;
  return value;
}

float wMouseY(){
  float value = mouseY/wSize;
  return value;
}