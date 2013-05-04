int largeurOeuf, d1, d2;
float d3;
PVector position, vitesse;
float rotation;
boolean mouvement;
float circonference, circ1, circ2, circ3;
PImage perso;

void setup() {
  size(800, 200);
  imageMode(CENTER); 

  largeurOeuf = 30;
  d1 = largeurOeuf;
  d2 = 2 * largeurOeuf;
  d3 = 2 * largeurOeuf - sqrt(8 * (largeurOeuf / 2) * (largeurOeuf / 2));
  circ1 = PI * (d1 / 4);
  circ2 = PI * (d2 / 8);
  circ3 = PI * (d3 / 4);
  circonference = 2 * circ1 + 2 * circ2 + circ3;
  println("Circonférence : " + circonference);
  position = new PVector(0, 150);
  vitesse = new PVector(0, 0);
  mouvement = false;
  rotation = 0;
  perso = loadImage("perso.png");
}

void draw() {
  background(255);
  fill(255);
  stroke(0);
  line(0, 150, width, 150);
  if (mouvement) {
    position.add(vitesse);
  }
  float posR = position.x - circonference * floor(position.x / circonference);
  if ((posR >= 0) && (posR < circ1)) {
    rotation = 2 * posR / d1  ; // arc = angle * rayon
    translate(position.x, position.y - d1 / 2);
    rotate(rotation);
  }
  else if ((posR >= circ1) && (posR < circ1 + circ2)) {
    rotation = 2 * (posR - circ1) / d2; // arc = angle * rayon
    translate(position.x, position.y - d2 / 2);
    rotate(HALF_PI + rotation);
    translate(d1 / 2, 0);
  }
  else if ((posR >= circ1 + circ2) && (posR < circ1 + circ2 + circ3)) {
    rotation = 2 * (posR - (circ1 + circ2)) / d3; // arc = angle * rayon
    translate(position.x, position.y - d3 / 2);
    rotate(3 * QUARTER_PI + rotation);
    translate(0, d1/2);
  }
  else if ((posR >= circ1 + circ2 + circ3) && (posR < circ1 + 2 * circ2 + circ3)) {
    rotation = 2 * (posR - (circ1 + circ2 + circ3)) / d2; 
    translate(position.x, position.y - d2 / 2);
    rotate(rotation - (3 * QUARTER_PI));
    translate(-d1 / 2, 0);
  }
  else if ((posR >= circ1 + 2 * circ2 + circ3) && (posR < circonference)) {
    rotation = 2 * (posR - (circ1 + 2 * circ2 + circ3)) / d1; // arc = angle * rayon
    translate(position.x, position.y - d1 / 2);
    rotate(rotation - HALF_PI);
  }
//  arc(0, 0, d1, d1, 0, PI );
//  arc(-largeurOeuf / 2, 0, d2, d2, -QUARTER_PI, 0);
//  arc(largeurOeuf / 2, 0, d2, d2, PI, PI + QUARTER_PI);
//  arc(0, -largeurOeuf / 2, d3, d3, PI + QUARTER_PI, 2 * PI - QUARTER_PI);
  image(perso, 0, -4);
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
}

