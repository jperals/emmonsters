class Mouth extends BodyPart {
  private float mouthWidth,
                mouthHeight;
  private RPolygon polygon;
  Mouth(float mouthWidth, float mouthHeight) {
    this.mouthWidth = mouthWidth;
    this.mouthHeight = mouthHeight;
    polygon = new RPolygon();
    polygon.addPoint(- mouthWidth/2, 0);
    polygon.addPoint(0, mouthHeight);
    polygon.addPoint(mouthWidth/2, 0);
  }
  public void draw() {
    RPoint[] points = polygon.getPoints();
    curve(points[0].x, points[0].y, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);
    curve(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[2].x, points[2].y);
  }
  public void moveBy(float x, float y) {
    polygon.translate(x, y);
  } 
}

