class Neck extends BodyPart {
  Neck(RPoint[] points) {
    this(points[0], points[1], points[2], points[3]);
  }
  Neck(RPoint p0, RPoint p1, RPoint p2, RPoint p3) {
    this(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
  Neck(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
    float arcRadius = random(0.25, 0.4)*(x1-x0);
    shape = new RShape();
    shape.addMoveTo(x0, y0);
    shape.addLineTo(x1, y1);
    shape.addBezierTo((x1+x2)/2 - arcRadius, (y1+y2)/2, (x1+x2)/2 - arcRadius, (y1+y2)/2, x2, y2);
    //shape.addPoint(x2, y2);
    shape.addLineTo(x3, y3);
    shape.addBezierTo((x3+x0)/2 + arcRadius, (y3+y0)/2, (x3+x0)/2 + arcRadius, (y3+y0)/2, x0, y0);
    shape.addClose();
  }
}

