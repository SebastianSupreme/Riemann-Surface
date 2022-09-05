//Riemann Surface of w = 1 / z

class oneDividedByX {


  public oneDividedByX() {
  }


  void renderOneDividedByX() {

    ArrayList<P4Vector> al1 = new ArrayList<P4Vector>();
    ArrayList<P4Vector> al2 = new ArrayList<P4Vector>();

    for (float x = xMin; x < xMax; x += 0.05) {
      beginShape();
      al1 = new ArrayList<P4Vector>();
      for (float y = yMin; y < yMax; y += 0.05) {

        z = new ComplexNumber(x, y);

        w = calculateOneDividedByX(z);

        stroke(map(w.imaginary, vMin/4, vMax/4, 0, 360), 360, 360);

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
          stroke(map(p1.w, vMin/4, vMax/4, 0, 360), 360, 360);
          vertex(p1.x, p1.y, p1.z);
          vertex(p2.x, p2.y, p2.z);
        }
        endShape();
        al2 = al1;
      }
    }
  }

  ComplexNumber calculateOneDividedByX(ComplexNumber c) {

    ComplexNumber conj = new ComplexNumber(c.real, -1.0 * c.imaginary);
    float num = 1.0;
    float num1 = num * conj.real, num2 = num * conj.imaginary;
    float den1 = c.real * conj.real;

    //den2 and den3 are cancelling each other out
    float den4 = c.imaginary * conj.imaginary * -1.0;
    float den = den1 + den4;

    return new ComplexNumber(num1 / den, num2 / den);
  }
}
