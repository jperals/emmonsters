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
    armWidth = (int)random(12, 30);
    armLength = (int)random(60, 70);
    shape = new RPolygon();
    float angleIncrement = TWO_PI*0.9/detail;
    float angle = angleIncrement;
    //RPoint originalPoint = new RPoint(-armWidth*cos(angle), - armLength*sin(angle));
    RPoint originalPoint = new RPoint(0, 0);
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = armWidth*(1 + (noise(i) - 0.5)/5);
      float x = originalPoint.x + distance*(armLength/armWidth)*cos(angle),
            y = originalPoint.y + distance*sin(angle);
      PVector point = new PVector(x, y);
      //point.rotate(-PI/3);
      shape.addPoint(point.x, point.y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    pushStyle();
    //fill(255, 255, 220);
    RPoint[] points = shape.getPoints();
    beginShape();
    for(int i = 0; i < detail; i++) {
      int j = i % detail;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
    popStyle();
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
  public void translate(float x, float y) {
    shape.translate(x, y);
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
