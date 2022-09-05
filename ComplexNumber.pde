
public class ComplexNumber {

  float real;
  float imaginary;

  public ComplexNumber(float real, float imaginary) {

    this.real = real;
    this.imaginary = imaginary;
  }

  public ComplexNumber addReal(float re) {

    float newR = this.real + re;
    float newI = this.imaginary;

    return new ComplexNumber(newR, newI);
  }

  public ComplexNumber square() {

    float newR = this.real * this.real - this.imaginary * this.imaginary;
    float newI = 2 * this.real * this.imaginary;

    return new ComplexNumber(newR, newI);
  }
}
