//======================================
//
// Automate
//
//======================================
ArrayList<Automate> drawing = new ArrayList<Automate>();

class Automate {
  int t;
  PVector pos;
  PVector dir;

  Automate(int x, int y, int _t) {
    pos = new PVector(x, y);
    dir = new PVector(0, -1);
    t = _t;
  }

  void draw() {
    work.set(int(pos.x), int(pos.y), color(0));
  }

  void move() {
    pos.add(dir);
    t--;
  }
}

void preloadRobot() {
  for (int i = drawing.size() - 1; i >= 0; i--) {
    drawing.remove(i);
  }
  for (int i=0; i<10; i++) {
    drawing.add(new Automate(int(random(work.width)), work.height, int(random(100, work.height))));
  }
}

void drawAutomate() {
  //println(drawing.size());
  work.loadPixels();
  for (Automate el : drawing) {
    el.draw();
    el.move();
  }
  work.updatePixels();

  for (int i = drawing.size() - 1; i >= 0; i--) {
    Automate part = drawing.get(i);
    if (part.t < 0 || 
      part.pos.x < 0 || part.pos.x > work.width ||
      part.pos.y < 0 || part.pos.y > work.height) {
      drawing.remove(i);
    }
  }
}