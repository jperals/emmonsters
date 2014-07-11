class Wing extends BodyPart {
  private int wingLength,
              wingWidth;
  Wing() {
    this(120);
  }
  Wing(int wingLength) {
    this.wingLength = wingLength;
    wingWidth = abs(wingLength/3);
    shape.addMoveTo(0, 0);
    addUpperCurve();
    addLowerCurve();
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    shape.draw();
    popStyle();
  }
  private void addUpperCurve() {
    RPoint firstControlPoint = new RPoint((float)wingLength / 6, -(float)wingWidth),
           secondControlPoint = new RPoint((float)wingLength * 0.4, (float)wingWidth / 2),
           destinationPoint = new RPoint(wingLength, (float)wingWidth / 3.3);
    shape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                      secondControlPoint.x, secondControlPoint.y,
                      destinationPoint.x, destinationPoint.y);
  }
  private void addLowerCurve() {
    RPoint firstControlPoint = new RPoint((float)wingLength * 0.3, (float)wingWidth),
           secondControlPoint = new RPoint(-(float)wingLength / 7, (float)wingWidth * 0.83),
           destinationPoint = new RPoint(0, 0);
    shape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                      secondControlPoint.x, secondControlPoint.y,
                      destinationPoint.x, destinationPoint.y);
  }
}

