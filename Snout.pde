class Snout {
  private boolean hasDifferentColor,
                  drawContourTop,
                  drawContourBottom,
                  drawRhinarium;
  private color snoutColor = #BB9944,
                rhinariumColor = #331100;
  private int snoutWidth, snoutHeight, rhinariumRadius;
  private IrregularCircle rhinarium;
  private IrregularEllipse outerSnout;
  Snout() {
    this(15);
  }
  Snout(int radius) {
    snoutHeight = radius;
    snoutWidth = (int)(snoutHeight*random(1, 2));
    rhinariumRadius = (int) (radius * random(0.25, 0.75));
    hasDifferentColor = randomBoolean();
    drawContourTop = randomBoolean(0.75);
    drawContourBottom = drawContourTop && randomBoolean();
    drawRhinarium = randomBoolean(0.75);
    outerSnout = new IrregularEllipse(snoutWidth, snoutHeight);
    rhinarium = new IrregularCircle(rhinariumRadius, (int)random(3, 8));    
  }
  public void draw() {
    pushStyle();
    if(hasDifferentColor) {
      fill(snoutColor);
    }
    pushStyle();
    if(!drawContourBottom) {
      noStroke();
    }
    outerSnout.draw();
    popStyle();
    if(!drawContourBottom && drawContourTop) {
      int outerSnoutDetail = outerSnout.getNumberOfPoints();
      float angleBetweenPoints = (2*PI) / outerSnoutDetail;
      int pointsToMoveBack = outerSnoutDetail/2;
      outerSnout.drawPartial(-pointsToMoveBack, (int)(outerSnoutDetail/2) - pointsToMoveBack);
    }
    pushMatrix();
    if(drawRhinarium) {
      fill(rhinariumColor);
      noStroke();
      translate(0, (rhinariumRadius - snoutHeight)/2);
      rhinarium.draw();
    }
    popStyle();
    pushStyle();
    noFill();
    translate(0, rhinariumRadius);
    curve(-snoutWidth/2, 0, -snoutWidth/2, 0, 0, snoutHeight/2, snoutWidth/2, 0);
    curve(-snoutWidth/2, 0, 0, snoutHeight/2, snoutWidth/2, 0, snoutWidth/2, 0);
    popStyle();
    popMatrix();
  }
}

