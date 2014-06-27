class Ear {
  public PVector[] points;
  public int earLength;
  private int detail,
              earWidth;
  Ear() {
    this((int)random(3, 10));
  }
  Ear(int detail) {
    this.detail = detail;
    earWidth = (int)random(25, 45);
    earLength = (int)((float)earWidth * random(0.75,2.5));
    points = new PVector[detail];
    float angle = PI/2 + PI/3,
          angleIncrement = TWO_PI/detail;
    for(int i = 0; i < detail; i++) {
      //float distance = radius;
      float distance = earWidth*(1 + (noise(i) - 0.5)/5);
      float x = distance*cos(angle),
            y = distance*sin(angle);
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    pushMatrix();
    beginShape();
    scale(1, (float)earLength/earWidth);
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
    popMatrix();
  }
  public Ear reversed() {
    Ear reversedEar = new Ear(detail);
    for(int i = 0; i < detail; i++) {
      reversedEar.points[i].x = - this.points[i].x;
    }
    reversedEar.earLength = this.earLength;
    return reversedEar;
  }
}
