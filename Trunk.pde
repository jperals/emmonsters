class Trunk {
  float[] points;
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
    points = new float[detail];
    for(int i = 0; i < detail; i++) {
      points[i] = radius*(1 + (noise(i) - 0.5)/5);
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
      float angle = TWO_PI * (float)j/detail;
      float x = points[j]*cos(angle),
            y = points[j]*sin(angle);
      curveVertex(x, y);
    }
    endShape();
  }
}

