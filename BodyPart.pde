class BodyPart {
  public RPolygon shape;
  BodyPart() {
    shape = new RPolygon();
  }
  public void draw() {
    shape.draw();
  }
/*  public void rotate(float angle) {
    shape.rotate(angle);
  }*/
  public void moveBy(float x, float y) {
    shape.translate(x, y);
  }
  public BodyPart union(BodyPart bodyPart) {
    shape.union(bodyPart.shape);
    return this;
  }
}
