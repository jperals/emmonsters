public class Arm implements Cloneable {
  public RPolygon shape;
  public int armLength;
  private int detail,
              armWidth;
  Arm() {
    this((int)random(8, 10));
  }
  Arm(int detail) {
    this.detail = detail;
    armWidth = (int)random(10, 12);
    armLength = (int)((float)armWidth * random(7, 14));
    shape = new RPolygon();
    float angle = PI/2 + PI/3,
          angleIncrement = TWO_PI/detail;
    RPoint originalPoint = new RPoint(-armWidth*cos(angle), - armLength*sin(angle));
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = armWidth*(1 + (noise(i) - 0.5)/5);
      float x = originalPoint.x + distance*cos(angle),
            y = originalPoint.y + distance*(armLength/armWidth)*sin(angle);
      PVector point = new PVector(x, y);
      point.rotate(-PI/3);
      shape.addPoint(point.x, point.y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    RPoint[] points = shape.getPoints();
    beginShape();
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
  }
  public Arm cloneReversed() {
    Arm reversedArm = new Arm(detail);
    reversedArm.shape = new RPolygon();
    RPoint[] points = shape.getPoints();
    for(int i = 0; i < detail; i++) {
      reversedArm.shape.addPoint(- points[i].x, points[i].y);
    }
    reversedArm.armLength = this.armLength;
    return reversedArm;
  }
  public void reverseX() {
    RPoint[] points = shape.getPoints();
    shape = new RPolygon();
    for(int i = 0; i < detail; i++) {
      shape.addPoint(- points[i].x, points[i].y);
    }
  }
  public Object clone() throws CloneNotSupportedException {  
      return super.clone();
  }
}
