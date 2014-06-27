class IrregularEllipse {
  private int detail,
              ellipseWidth,
              ellipseHeight;
  private RPolygon shape;
  IrregularEllipse() {
    this(30, 30, (int)random(5, 8));
  }
  IrregularEllipse(int ellipseWidth, int ellipseHeight) {
    this(ellipseWidth, ellipseHeight, (int)random(5, 8));
  }
  IrregularEllipse(int ellipseWidth, int ellipseHeight, int detail) {
    this.ellipseWidth = ellipseWidth;
    this.ellipseHeight = ellipseHeight;
    this.detail = detail;
    shape = new RPolygon();
    float angle = -PI/2,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      float distanceFactor = 1 + (noise(i) - 0.5)/5;
      float x = distanceFactor*ellipseWidth*cos(angle),
            y = distanceFactor*ellipseHeight*sin(angle);
      shape.addPoint(new RPoint(x, y));
      angle += angleIncrement;
    }
  }
  public int getNumberOfPoints() {
    return detail;
  }
  public RPolygon getShape() {
    return shape;
  }
  public void draw() {
    drawPartial(0, detail + 3);
  }
  public void drawPartial(int from, int to) {
    while(from < 0 || to < detail) {
      from += detail;
      to += detail;
    }
    RPoint[] points = shape.getPoints();
    pushMatrix();
    //scale((float)ellipseWidth/ellipseHeight, 1);
    beginShape();
    for(int i = from; i < to + 3; i++) {
      int j = i % detail;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
      //ellipse(point.x, point.y, 10, 10);
    }
    endShape();
    popMatrix();
  }
}

