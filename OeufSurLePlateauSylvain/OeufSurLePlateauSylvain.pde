// Base de développement pour jeux de plateformes/shoot'em up
// Copyright 2013 Olivier Baudu pour le Labomedia
// Code mis à disposition sous license GPL v3.0
// Les images ont été topées en vrac sur le Net.
// Il vous faut donc les changer pour vos projets.

ArrayList decor;
ArrayList zoneAffichage;

PImage perso, rocks, rocksBas, pieux, fenetre, herbe, ciel;
String[] niveau;
int jeuLargeurTotale, posX, posY, tailleElem;
int decorsLargeurTotale, cheminParcouru;
PVector vitesse, gravite;
Oeuf personnage;
Boolean mouvement;

void setup() {

  size(400, 400);
  imageMode(CENTER); 
  niveau = loadStrings("niveau-0.txt");
  cheminParcouru = 0;

  // Éléments graphiques
  perso=loadImage("perso.png");
  rocks=loadImage("rocks.jpg");
  rocksBas=loadImage("rocksBas.png");
  pieux=loadImage("pieux.png");
  fenetre=loadImage("fenetre.png");
  herbe=loadImage("herbe.png");
  ciel=loadImage("ciel.jpg");

  tailleElem = rocks.width;

  //dimensions en élément
  decorsLargeurTotale = niveau[0].length(); // 135

  //dimensions en pixel
  jeuLargeurTotale = decorsLargeurTotale*tailleElem;
  
  gravite = new PVector(0, 0.05);
  personnage = new Oeuf(200, 140, jeuLargeurTotale - 210);
  mouvement = false;
  decor = new ArrayList();
  zoneAffichage = new ArrayList();
  for (int j = 0; j < niveau.length; j++) {
    for (int i = 0; i < decorsLargeurTotale; i++) {
      char caract = niveau[j].charAt(i);
      switch (caract) {
      case '#' : 
        decor.add(new Element(rocks, i * tailleElem + tailleElem / 2, j * tailleElem  + tailleElem / 2));
        break;
      case '|' :
        decor.add(new Element(pieux, i * tailleElem + tailleElem / 2, j * tailleElem  + tailleElem / 2));
        break;
      case 'O' :
        decor.add(new Element(fenetre, i * tailleElem + tailleElem / 2, j * tailleElem  + tailleElem / 2));
        break;
      }
    }
  }
}

void draw() {
  image(ciel, ciel.width/2-cheminParcouru%(ciel.width-width), height/2);
  cheminParcouru = int(personnage.position.x) - 200;
  personnage.misAJour(gravite);
  translate(-cheminParcouru, 0);
  zoneAffichage.clear();

  // Affichage décor
  for (int i = 0; i < decor.size(); i++) {
    Element tempElement = (Element) decor.get(i);
    if ((tempElement.position.x > cheminParcouru - tailleElem) && (tempElement.position.x < cheminParcouru + width + tailleElem)) {
      zoneAffichage.add(tempElement);
      tempElement.affichage();
    }
  }
  if (!mouvement) {
    personnage.stop(zoneAffichage);
  }
  personnage.environnement(zoneAffichage);
  personnage.affichage();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      personnage.vitesse.y = -2.5;
    }
    if (keyCode == LEFT) {
      personnage.vitesse.x = -1.5; 
      mouvement = true;
    }
    if (keyCode == RIGHT) {
      personnage.vitesse.x = 1.5;
      mouvement = true;
    }
  }
  if (key == ' ') {
    noLoop();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      mouvement = false;
    }
    if (keyCode == RIGHT) {
      mouvement = false;
    }
  }
  if (key == ' ') {
    loop();
  }
}

