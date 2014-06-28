class Trunk {
  public RPolygon shape;
  color fillColor,
        strokeColor;
  int detail,
      radius,
      strokeWidth = 5;
  Trunk() {
    this(100);
  }
  Trunk(int radius) {
    this(radius, (int)random(5, 15));
  }
  Trunk(int radius, int detail) {
    this.radius = radius;
    fillColor = #FFFFFF;
    strokeColor = #555555;
    this.detail = detail;
    shape = new RPolygon();
    float angle = -PI/2,
          angleIncrement = TWO_PI / detail;
    for(int i = 0; i < detail; i++) {
      //float distanceToCenter = radius;
      float distanceToCenter = radius*(1 + (noise(1) - 0.5)/5);
      int x = (int)(distanceToCenter*cos(angle)),
          y = (int)(distanceToCenter*sin(angle));
      shape.addPoint(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    RPoint[] points = shape.getPoints();
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < detail + 1; i++) {
      int j = i % detail;
      RPoint point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
  }
}

