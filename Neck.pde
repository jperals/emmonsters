class Neck {
  public RPolygon shape;
  Neck(RPoint[] points) {
    this(points[0], points[1], points[2], points[3]);
  }
  Neck(RPoint p0, RPoint p1, RPoint p2, RPoint p3) {
    this(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
  Neck(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
    shape = new RPolygon();
    shape.addPoint(x0, y0);
    shape.addPoint(x1, y1);
    shape.addPoint(x2, y2);
    shape.addPoint(x3, y3);
  }
}

