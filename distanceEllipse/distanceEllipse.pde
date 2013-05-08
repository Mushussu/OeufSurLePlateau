float rotation, distance;
PVector centre, souris;
int hauteur, largeur;

void setup() {
  size(400, 400);
  rotation = 0;
  centre = new PVector(width / 2, height / 2);
  souris = new PVector(0, 0);
  hauteur = 200;
  largeur = 100;
  noFill();
}

void draw() {
  background(255);
  souris.set(mouseX, mouseY, 0);
  rotation = -HALF_PI + PVector.sub(souris, centre).heading();
  distance = (hauteur / 2 ) * (largeur / 2) / sqrt(sq((hauteur / 2 ) * sin(rotation)) + sq((largeur / 2) * cos(rotation)));
  translate(centre.x, centre.y);
  ellipse(0, 0, 4, 4);
  line(0, 0, 0, distance);
  rotate(rotation);
  ellipse(0, 0, largeur, hauteur);
}

