class Mouth extends BodyPart {
  private float mouthWidth,
                mouthHeight;
  Mouth(float mouthWidth, float mouthHeight) {
    this.mouthWidth = mouthWidth;
    this.mouthHeight = mouthHeight;
    shape.addPoint(- mouthWidth/2, 0);
    shape.addPoint(0, mouthHeight);
    shape.addPoint(mouthWidth/2, 0);
  }
  public void draw() {
    RPoint center = this.shape.getCenter();
    //println(center.x);
    //println(center.y);
    RPoint[] points = shape.getPoints();
    curve(points[0].x, points[0].y, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);
    curve(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[2].x, points[2].y);
  }
}

