class Ear {
  public PVector[] points;
  private int detail,
              earLength,
              earWidth = 50;
  Ear() {
    this((int)random(10, 30));
  }
  Ear(int earLength) {
    this.earLength = earLength;
    detail = 3;
    points = new PVector[detail];
    points[0] = new PVector(-earWidth/2, 0);
    points[1] = new PVector(0, -earLength);
    points[2] = new PVector(earWidth/2, 0);
    /*for(int i = 0; i < detail; i++) {
      points[i] = new PVector
    }*/
  }
  public void draw() {
    beginShape();
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
  }
}
