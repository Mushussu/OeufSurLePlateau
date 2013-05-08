Element mur;
Balle balle;

void setup() {
  size(200, 200);
  rectMode(CORNERS);
  mur = new Element(new PVector(width / 2 - 30, height / 2 - 30), new PVector(width / 2 + 30, height / 2 + 30)); 
  balle = new Balle(new PVector(0, 0), 40);
  noStroke();
}

void draw() {
  background(255);
  PVector pos = mur.misAJour(balle.accesseurPosition(), balle.accesseurDiametre() / 2);
  mur.affichage();
  balle.misAJourPosition(pos);
  balle.affichage();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      balle.deplacementX(-4);
    }
    if (keyCode == RIGHT) {
      balle.deplacementX(4);
    }
    if (keyCode == UP) {
      balle.deplacementY(-4);
    }
    if (keyCode == DOWN) {
      balle.deplacementY(4);
    }
  }
}


