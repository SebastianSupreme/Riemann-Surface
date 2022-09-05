//Riemann Surface of w = sin(z)

class sine {

  public sine() {
  }

  void renderSine() {

    ArrayList<P4Vector> al1 = new ArrayList<P4Vector>();
    ArrayList<P4Vector> al2 = new ArrayList<P4Vector>();

    for (float x = xMin; x < xMax; x += 0.05) {
      beginShape();
      al1 = new ArrayList<P4Vector>();
      for (float y = yMin; y < yMax; y += 0.05) {

        z = new ComplexNumber(x, y);

        w = calculateSine(z);
        stroke(map(w.imaginary, vMin, vMax, 0, 240), 360, 360);
        vertex(z.real, z.imaginary, w.real);

        al1.add(new P4Vector(z.real, z.imaginary, w.real, w.imaginary));
      }

      endShape();

      if (al2.size() == 0) {
        al2 = al1;
      } else {

        beginShape();
        for (int i = 0; i < al2.size(); i++) {
          P4Vector p1 = al1.get(i);
          P4Vector p2 = al2.get(i);
          stroke(map(p1.w, vMin, vMax, 0, 240), 360, 360);
          vertex(p1.x, p1.y, p1.z);
          vertex(p2.x, p2.y, p2.z);
        }
        endShape();
        al2 = al1;
      }
    }
  }

  ComplexNumber calculateSine(ComplexNumber c) {

    float newr = sin(c.real) * cosh(c.imaginary);
    float newi = cos(c.real) * sinh(c.imaginary);

    return new ComplexNumber(newr, newi);
  }

  float sinh(float x) {
    return 0.5 * (exp(x) - exp(-x));
  }

  float cosh(float x) {
    return 0.5 * (exp(x) + exp(-x));
  }
}
