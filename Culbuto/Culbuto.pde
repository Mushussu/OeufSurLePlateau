PVector gravite;
Oeuf test;
boolean mouvement;

void setup() {
  size(1000, 600);
  gravite = new PVector(0, 0.1);
  test = new Oeuf(100, 500, 50);
  mouvement = false;
}

void draw() {
  background(255);
  line(0, 400, width, 400);
  test.misAJour(gravite);
  test.environnement();
  test.affichage();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      test.setAcceleration(-5, 0); 
      mouvement = true;
    }
    if (keyCode == RIGHT) {
      test.setAcceleration(5, 0); 
      mouvement = true;
    }
    if (keyCode == UP) {
      test.setAcceleration(0, -10);  
      mouvement = true;
    }
    if (keyCode == DOWN) {
      test.setAcceleration(0, 2); 
      mouvement = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
       test.setAcceleration(0, 0); 
      mouvement = false;
    }
    if (keyCode == RIGHT) {
      test.setAcceleration(0, 0);
      mouvement = false;
    }
    if (keyCode == UP) {
      test.setAcceleration(0, 0);
      mouvement = false;
    }
    if (keyCode == DOWN) {
      test.setAcceleration(0, 0);
      mouvement = false;
    }
  }
}

