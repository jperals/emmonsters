class Leg {
  public PVector[] points;
  public int legLength;
  private int detail;
  Leg(int detail) {
    // TODO
  }
  public void draw() {
    // TODO
  }
  public Leg reversed() {
    Leg reversedLeg = new Leg(detail);
    for(int i = 0; i < detail; i++) {
      reversedLeg.points[i].x = - this.points[i].x;
    }
    reversedLeg.legLength = this.legLength;
    return reversedLeg;
  }
  public void reverseX() {
    for(int i = 0; i < detail; i++) {
      points[i].x = - points[i].x;
    }
  }
}
