class Oeuf {
  PVector position, vitesse, acceleration;
  PVector poid, verticale, hotizontale;
  int rayon;
  float circonference;
  float angle;
  PVector culbut;

  Oeuf(int _x, int _y, int _rayon) {
    rayon = _rayon;
    verticale = new PVector(0, -rayon);
    hotizontale = new PVector(1, 0);
    position = new PVector(_x, _y);
    vitesse = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    poid = new PVector(0, -rayon);
    culbut = new PVector(0, 0);
    circonference = 2 * PI * rayon;
    angle = 0;
  }

  void misAJour(PVector _force) {
    PVector force = new PVector(_force.x, _force.y);
    force.add(acceleration);
    force.add(PVector.mult(vitesse, -0.02)); // Frottements
    culbut.set(1, 0, 0);
    float theta = PVector.angleBetween(verticale, PVector.add(verticale, poid));
    if ((theta > PI / 2 - 0.1) && (theta < PI / 2 + 0.1)) {
      culbut.mult(0);
    } 
    else {
      culbut.mult(sin(theta) / 2);
    }
    if (poid.x < 0) {
      culbut.mult(-1);
    }
    force.add(culbut);
    vitesse.add(force);
    position.add(vitesse);
    acceleration.mult(0);
    float segment = position.x - circonference * floor(position.x / circonference);
    angle = segment / rayon ;
    poid.set(0, -rayon, 0);
    poid.rotate(angle);
  }

  void environnement() {
    if (position.y > 350) {
      position.y = 350;
    }
  }

  void affichage() {
    fill(255);
    ellipse(position.x, position.y, 2 * rayon, 2 * rayon);
    fill(0);
    ellipse(position.x + poid.x, position.y + poid.y, 10, 10);
  }

  void setAcceleration(int _x, int _y) {
    acceleration.set(_x, _y, 0.0);
  }
}

