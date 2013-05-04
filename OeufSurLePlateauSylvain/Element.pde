class Element {
  PImage visuel;
  PVector position;
  int hauteur, largeur;
  int contourDroite, contourGauche, contourHaut, contourBas;
  boolean bing;

  Element(PImage _visuel, int _x, int _y) {
    visuel = _visuel;
    position = new PVector(_x, _y);
    hauteur = visuel.height;
    largeur = visuel.width;
    contourDroite = int(position.x + largeur / 2);
    contourGauche = int(position.x - largeur / 2);
    contourHaut = int(position.y - hauteur / 2);
    contourBas = int(position.y + hauteur / 2);
  }

  void affichage() {
    if (bing) {
      rect(contourGauche, contourHaut, largeur, hauteur);
    } 
    else {
      image(visuel, position.x, position.y);
    }
  }
}

