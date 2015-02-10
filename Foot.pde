public class Foot extends BodyPart implements Cloneable {
  public int footLength;
  private int detail,
              footWidth;
  Foot() {
    this((int)random(9, 12));
  }
  Foot(int detail) {
    boolean longFingers = true;//randomBoolean(0.3);
    this.detail = detail;
    footWidth = (int)random(35, 40);
    footLength = (int)random(50, 70);
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
      int numberOfFingers = (int)random(3, 5);
      int fingerWidth = footLength / numberOfFingers;
      for(int i = 0; i < numberOfFingers; i++) {
        IrregularEllipse finger = new IrregularEllipse(footLength, fingerWidth);
        float distanceToCenter = - fingerWidth*numberOfFingers/2 + fingerWidth*(i + 0.5);
        finger.shape.rotate(distanceToCenter/60);
        finger.shape.translate(footLength / 3, distanceToCenter);
        shape = shape.union(finger.shape);
      }
    }
  }
  public Foot cloneReversed() {
    Foot reversedFoot = new Foot(detail);
    //RPoint[] verticesInverted = shape.getPoints();
    RShape newShape = new RShape();
    /*for(int i = 0; i < detail; i++) {
      RPoint newPoint = new RPoint(- verticesInverted[i].x, verticesInverted[i].y);
      newShape.addMoveTo(newPoint);
    }*/
    
    reversedFoot.shape = newShape;
    return reversedFoot;
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
