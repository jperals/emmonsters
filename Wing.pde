class Wing extends BodyPart {
  private int wingLength,
              wingWidth;
  Wing() {
    this(120);
  }
  Wing(int wingLength) {
    this.wingLength = wingLength;
    wingWidth = abs(wingLength/3);
    boolean isLeft = wingLength < 0;
    Feather feather1 = new Feather(wingWidth, wingLength),
            feather2 = new Feather(wingWidth, wingLength),
            feather3 = new Feather(wingWidth, wingLength);
    float rotateAngle = PI/12;
    if(isLeft) {
      rotateAngle = - rotateAngle;
    }
    feather2.shape.rotate(rotateAngle);
    feather3.shape.rotate(rotateAngle * 2);
    shape = feather1.shape.union(feather2.shape).union(feather3.shape);
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    shape.draw();
    popStyle();
  }
}

class Feather extends BodyPart {
  private int featherWidth,
              featherLength;
  Feather() {
    this(40, 120);
  }
  Feather(int featherWidth, int featherLength) {
    this.featherWidth = featherWidth;
    this.featherLength = featherLength;
    shape.addMoveTo(0, 0);
    addUpperCurve();
    addLowerCurve();
  }
  private void addUpperCurve() {
    RPoint firstControlPoint = new RPoint((float)featherLength / 6, -(float)featherWidth),
           secondControlPoint = new RPoint((float)featherLength * 0.4, (float)featherWidth / 2),
           destinationPoint = new RPoint(featherLength, (float)featherWidth / 3.3);
    shape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                      secondControlPoint.x, secondControlPoint.y,
                      destinationPoint.x, destinationPoint.y);
  }
  private void addLowerCurve() {
    RPoint firstControlPoint = new RPoint((float)featherLength * 0.3, (float)featherWidth),
           secondControlPoint = new RPoint(-(float)featherLength / 7, (float)featherWidth * 0.83),
           destinationPoint = new RPoint(0, 0);
    shape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                      secondControlPoint.x, secondControlPoint.y,
                      destinationPoint.x, destinationPoint.y);
  }
}

