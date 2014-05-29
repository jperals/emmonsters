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
    for(int i = 0; i < detail; i++) {
      float angle = TWO_PI * (float)i/detail,
            distanceToCenter = radius*(1 + (noise(i) - 0.5)/5);
      int x = (int)(distanceToCenter*cos(angle)),
          y = (int)(distanceToCenter*sin(angle));
      points[i] = new PVector(x, y);
    }
  }
  public void draw() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < detail + 3; i++) {
      int j = i % detail;
      PVector point = points[j];
      curveVertex(point.x, point.y);
    }
    endShape();
  }
}

