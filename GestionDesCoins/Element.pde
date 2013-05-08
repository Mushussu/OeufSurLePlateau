class Element {
  PVector coinNO, coinSE, coinNE, coinSO;

  Element(PVector _coinNO, PVector _coinSE) {
    coinNO = _coinNO;
    coinSE = _coinSE;
    coinNE = new PVector(coinSE.x, coinNO.y);
    coinSO = new PVector(coinNO.x, coinSE.y);
  }  

  void affichage() {
    fill(0);
    rect(coinNO.x, coinNO.y, coinSE.x, coinSE.y);
  }

  PVector misAJour(PVector objet, int tailleObjet) {
    // Paroi Est
    if ((objet.x - tailleObjet < coinSE.x) && (objet.y >= coinNO.y) && (objet.y <= coinSE.y) && (objet.x > coinNO.x)) {
      objet.x = coinSE.x + tailleObjet;
    }
    // Paroi Ouest
    if ((objet.x + tailleObjet > coinNO.x) && (objet.y >= coinNO.y) && (objet.y <= coinSE.y) && (objet.x < coinSE.x)) {
      objet.x = coinNO.x - tailleObjet;
    }
    // Paroi Sud
    if ((objet.y - tailleObjet < coinSE.y)  && (objet.x >= coinNO.x) && (objet.x <= coinSE.x) && (objet.y > coinNO.y)) {
      objet.y = coinSE.y + tailleObjet;
    }
    // Paroi Nord
    if ((objet.y + tailleObjet > coinNO.y)  && (objet.x >= coinNO.x) && (objet.x <= coinSE.x) && (objet.y < coinSE.y)) {
      objet.y = coinNO.y - tailleObjet;
    }
    // Coin Nord-Ouest
    if ((objet.x < coinNO.x) && (objet.y < coinNO.y) && (PVector.dist(objet, coinNO) < tailleObjet)) {
      PVector direction = PVector.sub(objet, coinNO);
      direction.normalize();
      direction.mult(tailleObjet);
      objet = PVector.add(coinNO, direction);
    }
    // Coin Nord-Est
    if ((objet.x > coinNE.x) && (objet.y < coinNE.y) && (PVector.dist(objet, coinNE) < tailleObjet)) {
      PVector direction = PVector.sub(objet, coinNE);
      direction.normalize();
      direction.mult(tailleObjet);
      objet = PVector.add(coinNE, direction);
    }
    // Coin Sud-Est
    if ((objet.x > coinSE.x) && (objet.y > coinSE.y) && (PVector.dist(objet, coinSE) < tailleObjet)) {
      PVector direction = PVector.sub(objet, coinSE);
      direction.normalize();
      direction.mult(tailleObjet);
      objet = PVector.add(coinSE, direction);
    }
    // Coin Sud-Oest
    if ((objet.x < coinSO.x) && (objet.y > coinSO.y) && (PVector.dist(objet, coinSO) < tailleObjet)) {
      PVector direction = PVector.sub(objet, coinSO);
      direction.normalize();
      direction.mult(tailleObjet);
      objet = PVector.add(coinSO, direction);
    }
    return objet;
  }
}
