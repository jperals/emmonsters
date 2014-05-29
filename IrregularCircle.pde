class IrregularCircle {
  private int detail = 5,
              radius;
  private PVector[] points;
  IrregularCircle() {
    this(30);
  }
  IrregularCircle(int radius) {
    this.radius = radius;
    float angle = PI/2,
          angleIncrement = TWO_PI/detail;
    points = new PVector[detail];
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = radius*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    beginShape();
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      curveVertex(points[j].x, points[j].y);
    }
    endShape();
  }
}
