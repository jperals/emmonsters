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
    drawCurve(points);
  }
  public void moveBy(float x, float y) {
    polygon.translate(x, y);
  } 
}

