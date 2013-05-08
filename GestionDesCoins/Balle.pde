class Balle {
  PVector position;
  int diametre;

  Balle(PVector _position, int _diametre) {
    position = _position;
    diametre = _diametre;
  }

  void affichage() {
    fill(255, 0, 0);
    ellipse(position.x, position.y, diametre, diametre);
  }
  
  void misAJourPosition(PVector nouvellePosition) {
    position = nouvellePosition;
  }
  
  void deplacementX(int x) {
    position.x += x;
  }
  
  void deplacementY(int y) {
    position.y += y;
  }
  
  PVector accesseurPosition() {
    return position;
  }
  
  int accesseurDiametre() {
    return diametre;
  }
}
