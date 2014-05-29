class Trunk {
  public PVector[] points;
  color fillColor,
        strokeColor;
  int detail = 10,
      radius,
      strokeWidth = 5;
  Trunk() {
    this(100);
  }
  Trunk(int radius) {
    this.radius = radius;
    fillColor = #FFFFFF;
    strokeColor = #555555;
    points = new PVector[detail];
    float angle = -PI/2,
          angleIncrement = TWO_PI / detail;
    for(int i = 0; i < detail; i++) {
      float distanceToCenter = radius*(1 + (noise(i) - 0.5)/5);
      int x = (int)(distanceToCenter*cos(angle)),
          y = (int)(distanceToCenter*sin(angle));
      points[i] = new PVector(x, y);
      angle += angleIncrement;
    }
  }
  public void draw() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < detail + 1; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
  }
}

