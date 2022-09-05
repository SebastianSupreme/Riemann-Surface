//Riemann Surface of w = ln(z)

class ln {

  public ln() {
  }

  void renderLn() {
    renderLnK(0);
    renderLnK(1);
    renderLnK(2);
  }

  void renderLnK(int k) {

    ArrayList<P4Vector> al1 = new ArrayList<P4Vector>();
    ArrayList<P4Vector> al2 = new ArrayList<P4Vector>();

    for (float x = xMin; x < xMax; x += 0.05) {
      beginShape();
      al1 = new ArrayList<P4Vector>();
      for (float y = yMin; y < yMax; y += 0.05) {
        z = new ComplexNumber(x, y);

        w = calculateLn(z, k);

        stroke(map(w.real, vMin/12, vMax/12, 0, 240), 360, 360);
        vertex(z.real, z.imaginary, w.imaginary);
        al1.add(new P4Vector(z.real, z.imaginary, w.imaginary, w.real));
      }

      endShape();

      if (al2.size() == 0) {
        al2 = al1;
      } else {
        //Two seperate blocks because without, the edges would be connected too.
        beginShape();
        for (int i = 0; i < al2.size(); i++) {
          P4Vector p1 = al1.get(i);
          P4Vector p2 = al2.get(i);
          stroke(map(p1.w, vMin/12, vMax/12, 0, 240), 360, 360);
          if (p1.x >= 0 && p2.x >= 0) {
            vertex(p1.x, p1.y, p1.z);
            vertex(p2.x, p2.y, p2.z);
          }
        }
        endShape();

        beginShape();
        for (int i = 0; i < al2.size(); i++) {
          P4Vector p1 = al1.get(i);
          P4Vector p2 = al2.get(i);
          stroke(map(p1.w, vMin/12, vMax/12, 0, 240), 360, 360);
          if (p1.x < 0 && p2.x < 0) {
            vertex(p1.x, p1.y, p1.z);
            vertex(p2.x, p2.y, p2.z);
          }
        }
        endShape();

        al2 = al1;
      }
    }
  }



  ComplexNumber calculateLn(ComplexNumber c, float k) {

    float real = log(sqrt(c.real * c.real + c.imaginary * c.imaginary));
    float imag = atan(c.imaginary / c.real) + k * PI;

    return new ComplexNumber(real, imag);
  }
}
