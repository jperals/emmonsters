class Snout extends BodyPart {
  public boolean overflowsHead;
  private boolean drawContourTop,
                  drawContourBottom,
                  drawRhinarium,
                  waved;
  private color bodyColor,
                rhinariumColor = #331100;
  private int snoutWidth, snoutHeight, rhinariumRadius;
  private IrregularCircle rhinarium;
  private IrregularEllipse outerSnout;
  private Mouth mouth;
  Snout() {
    this(15);
  }
  Snout(int radius) {
    snoutHeight = radius;
    snoutWidth = (int)(snoutHeight*random(0.8, 2));
    mouth = new Mouth(snoutWidth, snoutHeight/2);
    mouth.moveBy(0, snoutHeight/3);
    rhinariumRadius = (int) (radius * random(0.25, 0.75));
    drawContourTop = randomBoolean(0.75);
    drawContourBottom = drawContourTop && randomBoolean();
    drawRhinarium = randomBoolean(0.75);
    waved = randomBoolean(0.4);
    outerSnout = new IrregularEllipse(snoutWidth, snoutHeight);
    shape = outerSnout.getShape();
    rhinarium = new IrregularCircle(rhinariumRadius, (int)random(3, 8));    
  }
  public void draw() {
    pushStyle();
    fill(fillColor);
    pushStyle();
    if(drawContourBottom) {
      mouth.setColor(fillColor);
    }
    else {
      noFill();
      noStroke();
      mouth.setColor(bodyColor);
    }
    outerSnout.draw();
    popStyle();
    mouth.draw();
    popStyle();
    pushMatrix();
    if(drawRhinarium) {
      float verticalDistance = snoutHeight/2 - rhinariumRadius;
      if(waved && verticalDistance > 5) {
        RPoint[] points = new RPoint[3];
        points[0] = new RPoint(-snoutWidth/3, verticalDistance/2 + 3);
        points[1] = new RPoint(0, verticalDistance/2);
        points[2] = new RPoint(snoutWidth/3, verticalDistance/2 + 3);
        drawCurve(points);
      }
      pushStyle();
      fill(rhinariumColor);
      noStroke();
      translate(0, (rhinariumRadius - snoutHeight)/2);
      rhinarium.draw();
      popStyle();
    }
    else {
      float x1 = 10,
            x2 = x1 - 2,
            y1 = snoutHeight/2,
            y2 = y1 + 2;
      line(x1, y1, x2, y2);
      line(-x1, y1, -x2, y2);
    }
    popMatrix();
  }
  public void moveBy(float x, float y) {
    outerSnout.shape.translate(x, y);
    rhinarium.shape.translate(x, y);
    mouth.moveBy(x, y);
  }
  public void setBodyColor(color bodyColor) {
    this.bodyColor = bodyColor;
  }
}

