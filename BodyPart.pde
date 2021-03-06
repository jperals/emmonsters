class BodyPart {
  public color fillColor;
  public RShape shape;
  public RPoint[] vertices;
  private ArrayList<BodyPart> childParts;
  BodyPart() {
    shape = new RShape();
    childParts = new ArrayList<BodyPart>();
    fillColor = getNewColor();
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    shape.draw();
    popStyle();
  }
/*  public void rotate(float angle) {
    shape.rotate(angle);
  }*/
  public void addChild(BodyPart newChild) {
    childParts.add(newChild);
  }
  public boolean contains(BodyPart bodyPart) {
    return shape.contains(bodyPart.shape);
  }
  public boolean intersects(BodyPart bodyPart) {
    return shape.intersects(bodyPart.shape.toPolygon().getPoints());
  }
  public void moveBy(float x, float y) {
    shape.translate(x, y);
    /*int nChildren = childParts.size();
    for(int i = 0; i < nChildren; i++) {
      childParts.get(i).moveBy(x, y);
    }*/
  }
  public void setColor(int redComponent, int greenComponent, int blueComponent) {
    setColor(color(redComponent, greenComponent, blueComponent));
  }
  public void setColor(color newColor) {
    setColor(newColor, false);
  }
  public void setColor(color newColor, boolean recursive) {
    fillColor = newColor;
    if(recursive) {
      int nChildren = childParts.size();
      for(int i = 0; i < nChildren; i++) {
        childParts.get(i).setColor(newColor);
      }
    }
  }
  public BodyPart union(BodyPart bodyPart) {
    shape.union(bodyPart.shape);
    return this;
  }
}
