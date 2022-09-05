//Riemann Surface of w = sqrt(z)


class rootSurface {

  rootSurface() {
  }

  void renderRoot() {

    ArrayList<P4Vector> al1 = new ArrayList<P4Vector>();
    ArrayList<P4Vector> al2 = new ArrayList<P4Vector>();

    for (float x = xMin; x < xMax; x += 0.05) {
      al1 = new ArrayList<P4Vector>();

      beginShape();
      for (float y = yMin; y < yMax; y += 0.05) {

        z = new ComplexNumber(x, y);

        w = calculateRoot(z)[0];
        stroke(map(w.imaginary, vMin / 12.0, vMax / 12.0, 0, 180), 360, 360);
        vertex(z.real, z.imaginary, w.real);

        al1.add(new P4Vector(z.real, z.imaginary));
      }
      endShape();

      beginShape();
      for (float y = yMin; y < yMax; y += 0.1) {

        z = new ComplexNumber(x, y);

        w = calculateRoot(z)[1];
        stroke(map(w.imaginary, vMin / 12.0, vMax / 12.0, 0, 180), 360, 360);
        vertex(z.real, z.imaginary, w.real);
      }
      endShape();


      if (al2.size() == 0) {
        al2 = al1;
      } else {

        beginShape();
        for (int i = 0; i < al2.size(); i++) {
          P4Vector p1 = al1.get(i);
          P4Vector p2 = al2.get(i);
          ComplexNumber temp = calculateRoot(new ComplexNumber(p1.x, p1.y))[0];
          stroke(map(temp.imaginary, vMin / 12.0, vMax / 12.0, 0, 180), 360, 360);
          vertex(p1.x, p1.y, temp.real);
          vertex(p2.x, p2.y, temp.real);
        }
        endShape();

        beginShape();
        for (int i = 0; i < al2.size(); i++) {
          P4Vector p1 = al1.get(i);
          P4Vector p2 = al2.get(i);
          ComplexNumber temp = calculateRoot(new ComplexNumber(p1.x, p1.y))[1];

          stroke(map(temp.imaginary, vMin / 12.0, vMax / 12.0, 0, 180), 360, 360);
          vertex(p1.x, p1.y, temp.real);
          vertex(p2.x, p2.y, temp.real);
        }
        endShape();

        al2 = al1;
      }
    }
  }
}

ComplexNumber[] calculateRoot(ComplexNumber c) {

  float[] f = squareroot(c);

  //Positive result
  ComplexNumber c1 = new ComplexNumber(f[0], f[1]);

  //Negative result
  ComplexNumber c2 = new ComplexNumber(f[2], f[3]);

  ComplexNumber[] cArray = {c1, c2};

  return cArray;
}

float[] squareroot(ComplexNumber c) {

  float[] numbers = new float[4];

  float[] f = pq(-1 * c.real, -1 * (pow(c.imaginary, 2) / 4));

  float a_p = 0, a_n = 0, b_1 = 0, b_2 = 0;

  if (f[0] > 0) {

    a_p = sqrt(f[0]);
    a_n = -1 * sqrt(f[0]);

    b_1 = c.imaginary / (2 * a_p);
    b_2 = c.imaginary / (2 * a_n);
  } else if (f[0] < 0) {

    a_p = sqrt(abs(f[0]));//*i
    a_n = -1 * sqrt(abs(f[0]));//*i

    b_1 = a_p;
    b_2 = a_n;

    a_p = 0;
    a_n = 0;
  } else if (f[1] > 0) {

    a_p = sqrt(f[1]);
    a_n = -1 * sqrt(f[1]);

    b_1 = c.imaginary / (2 * a_p);
    b_2 = c.imaginary / (2 * a_n);
  } else if (f[1] < 0) {

    a_p = sqrt(abs(f[1]));//*i
    a_n = -1 * sqrt(abs(f[1]));//*i

    b_1 = a_p;
    b_2 = a_n;

    a_p = 0;
    a_n = 0;
  }


  numbers[0] = a_p;
  numbers[1] = b_1;
  numbers[2] = a_n;
  numbers[3] = b_2;

  return numbers;
}

float[] pq(float p, float q) {

  float result1 = -1 * p/2 + sqrt(pow(p/2, 2) - q);

  float result2 = -1 * p/2 - sqrt(pow(p/2, 2) - q);

  float[] f = {result1, result2};

  return f;
}
