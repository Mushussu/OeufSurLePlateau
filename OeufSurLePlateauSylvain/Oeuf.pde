class Oeuf {
  PVector position, vitesse, acceleration;
  PImage perso;
  int largeurNiveau, cheminParcouru;
  int contourDroite, contourGauche, contourHaut, contourBas;
  int largeurOeuf, hauteurOeuf;
  float circonference, rotation, largeurRelative, hauteurRelative;

  Oeuf(int _x, int _y, int _largeurNiveau) {
    position = new PVector(_x, _y);
    vitesse = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    largeurNiveau = _largeurNiveau;
    cheminParcouru = 0;
    perso = loadImage("perso.png");
    largeurOeuf = 30;
    hauteurOeuf = 40;
    circonference = PI * (hauteurOeuf / 2 + largeurOeuf / 2);
  }

  void misAJour(PVector force) {
    //acceleration.add(force);
    vitesse.add(force);
    position.add(vitesse);
    if (position.x < 0) {
      position.x = 0;
    }
    if (position.x > largeurNiveau) {
      position.x = largeurNiveau;
    }
    float segment = position.x - circonference * floor(position.x / circonference);
    rotation = 2 * segment / (hauteurOeuf / 2 + largeurOeuf / 2);
    largeurRelative = sqrt(sq(hauteurOeuf / 2) * sq(sin(rotation)) + sq(largeurOeuf / 2) * sq(cos(rotation)));
    hauteurRelative = 2 * sqrt(sq(hauteurOeuf / 2) * sq(cos(rotation)) + sq(largeurOeuf / 2) * sq(sin(rotation)));
    contour();
  }

  void contour() {
    contourDroite = int(position.x + largeurRelative);
    contourGauche = int(position.x - largeurRelative);
    contourHaut = int(position.y - hauteurRelative);
    contourBas = int(position.y);
  }

  void affichage() {
    line(contourGauche, position.y - 100 - hauteurRelative / 2, contourGauche, position.y + 100 - hauteurRelative / 2);
    line(contourDroite, position.y - 100 - hauteurRelative / 2, contourDroite, position.y + 100 - hauteurRelative / 2);
    line(position.x - 100, contourHaut, position.x + 100, contourHaut);
    line(position.x - 100, contourBas, position.x + 100, contourBas);
    translate(position.x, position.y - hauteurRelative / 2);
    rotate(rotation); 
    //ellipse(0, 0, largeur, hauteur);
    image(perso, 0, 0);
  }

  void environnement(ArrayList decor) {
    for (int i = 0; i < decor.size(); i++) {
      Element tempElement = (Element)decor.get(i);
      // Test Bas
      if ((contourBas >= tempElement.contourHaut) && (contourBas < tempElement.contourBas) 
        && (position.x >= tempElement.contourGauche) && (position.x < tempElement.contourDroite)) {
        println("3");
        position.y =  tempElement.contourHaut;
        vitesse.y = 0;
        contour();
      }
      // Test Haut
      else if ((contourHaut < tempElement.contourBas) && (contourHaut > tempElement.contourHaut) 
        && (position.x >= tempElement.contourGauche) && (position.x < tempElement.contourDroite)) {
        position.y = tempElement.contourBas + hauteurRelative;
        vitesse.y = 0;
        contour();
        println("4");
      }
      // Test droit
      if ((contourDroite > tempElement.contourGauche) && (contourDroite < tempElement.contourDroite) 
        && (((contourBas > tempElement.contourHaut) && (contourBas <= tempElement.contourBas))
        || ((contourHaut > tempElement.contourHaut) && (contourHaut < tempElement.contourBas)))
        ) {
        position.x = tempElement.contourGauche - largeurRelative;
        vitesse.x = 0;
        tempElement.bing = true;

        println("1");
      } 
      // Test Gauche
      else if ((contourGauche > tempElement.contourGauche) && (contourGauche < tempElement.contourDroite) 
        && (((contourBas > tempElement.contourHaut) && (contourBas <= tempElement.contourBas))
        || ((contourHaut > tempElement.contourHaut) && (contourHaut < tempElement.contourBas)))
        ) {
        position.x = tempElement.contourDroite + largeurRelative;
        vitesse.x = 0;
        tempElement.bing = true;
        println("2");
      } 
      else {
        tempElement.bing = false;
      }
    }
  }

  void stop(ArrayList decor) {
    for (int i = 0; i < decor.size(); i++) {
      Element tempElement = (Element)decor.get(i);
      if ((contourBas == tempElement.contourHaut) && (position.x >= tempElement.contourGauche) && (position.x < tempElement.contourDroite)) {
        vitesse.x = 0;
      }
    }
  }
}

