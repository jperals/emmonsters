public class Foot extends BodyPart implements Cloneable {
  public int footLength;
  private int detail,
              footWidth;
  Foot() {
    this((int)random(9, 12));
  }
  Foot(int detail) {
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
  }
  public Foot cloneReversed() {
    Foot reversedFoot = new Foot(detail);
    RPoint[] verticesInverted = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      verticesInverted[i] = new RPoint(- vertices[i].x, vertices[i].y);
    }
    reversedFoot.footLength = this.footLength;
    reversedFoot.shape = toBezier(verticesInverted);
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
