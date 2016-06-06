//======================================
//
// Interface graphique
//
//======================================

SliderBar repetition, condition, operation;


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0) {
    e = 1;
  } else if (e<0) {
    e = -1;
  }

  if (repetition.select(mouseX, mouseY)) {
    repetition.setIndex(int(e));
  }

  if (condition.select(mouseX, mouseY)) {
    condition.setIndex(int(e));
  }

  if (operation.select(mouseX, mouseY)) {
    operation.setIndex(int(e));
  }
}


void initSlider(int x, int y) {
  repetition = new SliderBar("rep", 2);
  repetition.setPos(x, y);

  condition = new SliderBar("cond", 2);
  condition.setPos(x+120, y);

  operation = new SliderBar("ope", 2);
  operation.setPos(x+240, y);
}

void displaySlider() {
  repetition.display();
  condition.display();
  operation.display();
}

class SliderBar {
  PVector pos;
  int index = 0;
  PImage[] icones;

  SliderBar(String name, int q) {
    icones = new PImage[q];
    for (int i = 0; i<q; i++) {
      icones[i] = loadImage(name+"_"+i+".png");
    }
  }

  void setPos(float x, float y) {
    pos = new PVector(x, y);
  }

  void setIndex(int value) {
    index += value;

    if (index > icones.length -1) {
      index = icones.length -1;
    } else if (index < 0) {
      index = 0;
    }
  }

  boolean select(float x, float y) {
    if (x > pos.x && x < pos.x+100 &&
      y > pos.y && y < pos.y+30) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(icones[index], pos.x, pos.y, 100, 30);
  }
}