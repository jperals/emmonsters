class Belly extends BodyPart {
  private int radius;
  Belly() {
    this(80);
  }
  Belly(int radius) {
    this.radius = radius;
    shape = new IrregularEllipse(radius, radius).getShape();
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    noStroke();
    shape.draw();
    popStyle();
  }
}

