class Ear extends BodyPart implements Cloneable {
  public int earLength;
  private int detail,
              earWidth;
  Ear() {
    this((int)random(3, 10));
  }
  Ear(int detail) {
    this.detail = detail;
    earWidth = (int)random(25, 55);
    earLength = (int)((float)earWidth * random(0.75,2.5));
    vertices = new RPoint[detail];
    float angle = PI/2 + PI/3,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float baseWidth = earWidth*(1 + (noise(i) - 0.5)/5),
            baseLength = baseWidth * earLength / earWidth;
      float x = baseWidth*cos(angle),
            y = baseLength*sin(angle);
      vertices[i] = new RPoint(x, y);
      angle += angleIncrement;
    }
    shape = toBezier(vertices);
  }
  public Ear cloneReversed() {
    Ear reversedEar = new Ear(detail);
    RPoint[] verticesInverted = new RPoint[detail];
    for(int i = 0; i < detail; i++) {
      verticesInverted[i] = new RPoint(- vertices[i].x, vertices[i].y);
    }
    reversedEar.earLength = this.earLength;
    reversedEar.shape = toBezier(verticesInverted);
    return reversedEar;
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
