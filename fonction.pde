//======================================
//
// FONCTION
//
//======================================

void FOR (int x, int y, int s) {
  work.loadPixels();
  for (int k = 0; k<s; k++) {
    work.set(x, y-k, color(0));
  }
  work.updatePixels();
}

void WHILE(int x, int y) {
  work.loadPixels();

  while (y>0) {
    work.set(x, y, color(0));
    y--;
  }

  work.updatePixels();
}

void IF(int x, int y, float d, int p ) {
  // Cette fonction est incorecte
  // Je doit pouvoir appliquer le décalage à la racine du while
  // et non efface le while et le décaler.
  
  // x et y correspondent à la position sur l'image work
  // d est le decalage que va subir la courbe
  // p sont le perimettre touché par la fonction

  work.loadPixels();
  int dx = 0; // dx correspond au decalage en x des points sur work 
  int dy = y;

  while (dy>0 && x>0 && x<work.width) {
    dy--;
    for (int i = abs(p); i>-p; i--) {
      // i = a la position des courbes à décaler
      if (work.get(x+i, y) == color(0)) {
        if (i>0) {
          dx = -int(((y-dy)/d));
          work.set(x+i, dy, color(255));
          work.set(x+i+dx, dy, color(0));
        } else {
          dx = int((y-dy)/d);
          work.set(x+i, dy, color(255));
          work.set(x+i+dx, dy, color(0));
        }
      }
    }
  }

  work.updatePixels();
}