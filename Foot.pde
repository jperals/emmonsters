public class Foot extends BodyPart implements Cloneable {
  public int footLength;
  private int detail,
              footWidth,
              numberOfFingers;
  private String which;
  Foot(String which) {
    this(which, (int)random(9, 12));
  }
  Foot(String which, int detail) {
    this(which, detail, (int)random(35, 40), (int)random(50, 70));
  }
  Foot(String which, int detail, int footWidth, int footLength) {
    this(which, detail, footWidth, footLength, (int)random(3, 5));
  }
  Foot(String which, int detail, int footWidth, int footLength, int numberOfFingers) {
    boolean longFingers = true;//randomBoolean(0.3);
    this.numberOfFingers = numberOfFingers;
    this.detail = detail;
    this.footWidth = footWidth;
    this.footLength = footLength;
    float angleIncrement = TWO_PI/detail;
    float angle = angleIncrement;
    //RPoint originalPoint = new RPoint(-footWidth*cos(angle), - footLength*sin(angle));
    vertices = new RPoint[detail];
    RPoint originalPoint = new RPoint(0, 0);
    //float coefficient = random(0.5);
    for(int i = 0; i < detail; i++) {
      float distance = footWidth*(1 + (noise(i) - 0.5)/5);//*(1 + coefficient*sin(PI/2 + angle));
      float x = originalPoint.x + distance*((float)footLength/footWidth)*cos(angle),
            y = originalPoint.y + distance*sin(angle);
      if(x > 0) {
        y += random(0.5, 1)*y*cos(angle);
      }
      PVector point = new PVector(x, y);
      vertices[i] = new RPoint(point.x, point.y);
      angle += angleIncrement;
    }
    shape = toBezier(vertices);
    if(longFingers) {
      int fingerWidth = footLength / numberOfFingers;
      for(int i = 0; i < numberOfFingers; i++) {
        int fingerLength;
        if(which == "right") {
          fingerLength = (int)(footLength * (0.7 + 0.3 * (numberOfFingers - i) / numberOfFingers));
        }
        else {
          fingerLength = (int)(footLength * (0.7 + 0.3 * i / numberOfFingers));
        }
        IrregularEllipse finger = new IrregularEllipse(fingerLength, fingerWidth);
        float distanceToCenter = - fingerWidth*numberOfFingers/2 + fingerWidth*(i + 0.5);
        finger.shape.rotate(distanceToCenter/60);
        finger.shape.translate(footLength / 3, distanceToCenter);
        shape = shape.union(finger.shape);
      }
    }
  }
  public Foot clone() {
    return new Foot(which, detail, footWidth, footLength, numberOfFingers);
  }
  public Foot cloneReversed() {
    String whichOther = which == "left" ? "right" : "left";
    return new Foot(whichOther, detail, footWidth, footLength, numberOfFingers);
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
}
