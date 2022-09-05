import peasy.*; //PeasyCam library is licensed under Apache 2.0 license.


//z = x + i*y
int xMin = -4;
int xMax = 4;
int yMin = -4;
int yMax = 4;

//w = u + i*v
int uMin;
int uMax;
//v is color
int vMin = -12;
int vMax = 12;

//Calculation vars

//z = x + i * y
ComplexNumber z;

//w = u + i * v
ComplexNumber w;

PeasyCam cam;

int index = 0;

String[] functions = {
  "w = sqrt(z)", "w = z^2 + 1", "w = 1 / z", 
  "w = sin(z)", "w = e^z", "w = ln(z)"
};

squaredSurface ss = new squaredSurface();
rootSurface rs = new rootSurface();
oneDividedByX odbx = new oneDividedByX();
sine s = new sine();
e ex = new e();
ln ln = new ln();


void settings() {

  size(712, 1266, P3D);
}


void setup() {

  cam = new PeasyCam(this, 1500);
  cam.lookAt(width / 2, height / 2, 0);
  colorMode(HSB, 360);
}


void draw() {

  background(0);

  stroke(255);
  strokeWeight(0.01);

  translate(width / 2, height / 2);
  scale(40);
  rotateX(HALF_PI);

  noFill();
  strokeWeight(0.05);

  String surfaceFunction = functions[index];

  if (surfaceFunction.equals("w = sqrt(z)")) {
    rs.renderRoot();
  } else if (surfaceFunction.equals("w = z^2 + 1")) {
    ss.renderSquare();
  } else if (surfaceFunction.equals("w = 1 / z")) {
    odbx.renderOneDividedByX();
  } else if (surfaceFunction.equals("w = sin(z)")) {
    s.renderSine();
  } else if (surfaceFunction.equals("w = e^z")) {
    ex.renderExp();
  } else if (surfaceFunction.equals("w = ln(z)")) {
    ln.renderLn();
  }
  
}

public void keyPressed() {

  if (keyCode == RIGHT) {

    index++;

    if (index > functions.length - 1)
      index = 0;
  } else if (keyCode == LEFT) {

    index--;

    if (index < 0)
      index = functions.length - 1;
  }
  
  
  
}
