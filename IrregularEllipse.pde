class IrregularEllipse {
  private int detail,
              ellipseWidth,
              ellipseHeight;
  private PVector[] points;
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
    float angle = -PI/2,
          angleIncrement = TWO_PI/detail;
    points = new PVector[detail];
    for(int i = 0; i < detail; i++) {
      float distance = ellipseHeight*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public int getNumberOfPoints() {
    return detail;
  }
  public void draw() {
    drawPartial(0, detail + 3);
  }
  public void drawPartial(int from, int to) {
    while(from < 0 || to < detail) {
      from += detail;
      to += detail;
    }
    pushMatrix();
    scale(ellipseWidth/ellipseHeight, 1);
    beginShape();
    for(int i = from; i < to + 3; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
      //ellipse(point.x, point.y, 10, 10);
    }
    endShape();
    popMatrix();
    //println(ellipseWidth, ellipseHeight);
  }
}

