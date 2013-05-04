PVector position, vitesse;
boolean mouvement;
float circonference, rotation, largeurRelative, hauteurRelative;
PImage perso;
int contourDroite, contourGauche, contourHaut, contourBas;
int largeurOeuf, hauteurOeuf;



void setup() {
  size(800, 400);
  position = new PVector(0, 150);
  vitesse = new PVector(0, 0);
  mouvement = false;
  rotation = 0;
  ellipseMode(CENTER);
  imageMode(CENTER);
  hauteurOeuf = 100;
  largeurOeuf = 60;
  circonference = PI * (hauteurOeuf / 2 + largeurOeuf / 2);
  perso = loadImage("perso.png");
  noFill();
}

void draw() {
  background(255);
  //line(0, 150, width, 150);
  if (mouvement) {
    position.add(vitesse);
  }
  float segment = position.x - circonference * floor(position.x / circonference);
  rotation = 2 * segment / (hauteurOeuf / 2 + largeurOeuf / 2);
  largeurRelative = sqrt(sq(hauteurOeuf / 2) * sq(sin(rotation)) + sq(largeurOeuf / 2) * sq(cos(rotation)));
  hauteurRelative = 2 * sqrt(sq(hauteurOeuf / 2) * sq(cos(rotation)) + sq(largeurOeuf / 2) * sq(sin(rotation)));
  contourDroite = int(position.x + largeurRelative);
  contourGauche = int(position.x - largeurRelative);
  contourHaut = int(position.y - hauteurRelative);
  contourBas = int(position.y);
  line(contourGauche, position.y - 100 - hauteurRelative / 2, contourGauche, position.y + 100 - hauteurRelative / 2);
  line(contourDroite, position.y - 100 - hauteurRelative / 2, contourDroite, position.y + 100 - hauteurRelative / 2);
  line(position.x - 100, contourHaut, position.x + 100, contourHaut);
  line(position.x - 100, contourBas, position.x + 100, contourBas);
  fill(0);

  text(position.y + " : " + contourHaut, 100, 50);
  fill(255);

  translate(position.x, position.y - hauteurRelative / 2);
  rotate(rotation); // 2 * segment = angle * (Ra + Rb)
  ellipse(0, 0, largeurOeuf, hauteurOeuf);

  //image(perso, 0, 0);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      vitesse.x = -2; 
      mouvement = true;
    }
    if (keyCode == RIGHT) {
      vitesse.x = 2;
      mouvement = true;
    }
        if (keyCode == UP) {
      vitesse.y = -2; 
      mouvement = true;
    }
    if (keyCode == DOWN) {
      vitesse.y = 2;
      mouvement = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      vitesse.x = 0;
      mouvement = false;
    }
    if (keyCode == RIGHT) {
      vitesse.x = 0;
      mouvement = false;
    }
        if (keyCode == UP) {
          vitesse.y = 0;
      mouvement = false;
    }
    if (keyCode == DOWN) {
      vitesse.y = 0;
      mouvement = false;
    }
  }
}

