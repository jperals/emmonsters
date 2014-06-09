class IrregularCircle {
  private int detail, 
  radius;
  private PVector[] points;
  IrregularCircle() {
    this(30, (int)random(5, 8));
  }
  IrregularCircle(int radius) {
    this(radius, (int)random(5, 8));
  }
  IrregularCircle(int radius, int detail) {
    this.radius = radius;
    this.detail = detail;
    float angle = PI/2, 
    angleIncrement = TWO_PI/detail;
    points = new PVector[detail];
    for (int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = radius*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle), 
      y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    drawPartial(0, detail);
  }
  private void drawPartial(int from, int to) {
    beginShape();
    for (int i = from; i < to + 3; i++) {
      int j = i % detail;
      curveVertex(points[j].x, points[j].y);
    }
    endShape();
  }
}

