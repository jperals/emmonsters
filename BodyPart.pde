class BodyPart {
  public RPolygon shape;
  private ArrayList<BodyPart> childParts;
  BodyPart() {
    shape = new RPolygon();
  }
  public void draw() {
    shape.draw();
    childParts = new ArrayList<BodyPart>();
  }
/*  public void rotate(float angle) {
    shape.rotate(angle);
  }*/
  public void moveBy(float x, float y) {
    shape.translate(x, y);
    /*int nChildren = childParts.size();
    for(int i = 0; i < nChildren; i++) {
      childParts.get(i).moveBy(x, y);
    }*/
  }
  public BodyPart union(BodyPart bodyPart) {
    shape.union(bodyPart.shape);
    return this;
  }
}
