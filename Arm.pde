public class Arm extends BodyPart implements Cloneable {
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
    float angleIncrement = TWO_PI*0.9/detail;
    float angle = angleIncrement;
    //RPoint originalPoint = new RPoint(-armWidth*cos(angle), - armLength*sin(angle));
    vertices = new RPoint[detail];
    RPoint originalPoint = new RPoint(0, 0);
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = armWidth*(1 + (noise(i) - 0.5)/5);
      float x = originalPoint.x + distance*(armLength/armWidth)*cos(angle),
            y = originalPoint.y + distance*sin(angle);
      PVector point = new PVector(x, y);
      //point.rotate(-PI/3);
      vertices[i] = new RPoint(point.x, point.y);
      angle += angleIncrement;
    }
    shape = toBezier(vertices, 1, detail - 2);
  }
  /*public void draw() {
    pushStyle();
    fill(fillColor);
    RPoint[] points = shape.getPoints();
    beginShape();
    for(int i = 0; i < detail; i++) {
      int j = i % detail;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
    popStyle();
  }*/
  public Arm cloneReversed() {
    Arm reversedArm = new Arm(detail);
    RPoint[] verticesInverted = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      verticesInverted[i] = new RPoint(- vertices[i].x, vertices[i].y);
    }
    reversedArm.armLength = this.armLength;
    reversedArm.shape = toBezier(verticesInverted, 1, detail - 2);
    return reversedArm;
  }
  public void translate(float x, float y) {
    shape.translate(x, y);
  }
  public void reverseX() {
    RPoint[] verticesInverted = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      verticesInverted[i] = new RPoint(- vertices[i].x, vertices[i].y);
    }
    shape = toBezier(verticesInverted);
  }
  public Object clone() throws CloneNotSupportedException {  
      return super.clone();
  }
}
