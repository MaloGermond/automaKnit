ArrayList<Robot> drawing = new ArrayList<Robot>();

class Robot {
  int t;
  PVector pos;
  PVector dir;

  Robot(int x, int y, int _t) {
    pos = new PVector(x, y);
    dir = new PVector(0, -1);
    t= _t;
  }

  void draw() {
    work.set(round(pos.x), round(pos.y), cPattern);
  }

  void move() {
    pos.add(dir);
    if(t>0)t--;
  }
}

void preloadRobot() {
  for (int i = drawing.size() - 1; i >= 0; i--) {
    drawing.remove(i);
  }
  for (int i=0; i<10; i++) {
    drawing.add(new Robot(round(random(work.width)), work.height, work.height));
  }
}

void drawRobot() {
  work.loadPixels();
  
  for (Robot el : drawing) {
    el.draw();
    el.move();
  }
  work.updatePixels();

  //debugRobot();

  for (int i = drawing.size() - 1; i >= 0; i--) {
    Robot part = drawing.get(i);
    if (part.t == 0 || 
      part.pos.x <= -1 || part.pos.x > work.width ||
      part.pos.y < 0 || part.pos.y > work.height) {
      drawing.remove(i);
    }
  }
}

void debugRobot(){
  for (Robot el : drawing) {
    println(el.t+"  "+round(el.pos.x)+"  "+el.pos.x);
  }
}