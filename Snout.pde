class Snout extends BodyPart {
  public boolean overflowsHead;
  private Mouth mouth;
  private boolean drawContourTop,
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
    snoutWidth = (int)(snoutHeight*random(0.8, 2));
    mouth = new Mouth(snoutWidth, snoutHeight/2);
    mouth.moveBy(0, snoutHeight/3);
    rhinariumRadius = (int) (radius * random(0.25, 0.75));
    drawContourTop = randomBoolean(0.75);
    drawContourBottom = drawContourTop && randomBoolean();
    drawRhinarium = randomBoolean(0.75);
    outerSnout = new IrregularEllipse(snoutWidth, snoutHeight);
    shape = outerSnout.getShape();
    rhinarium = new IrregularCircle(rhinariumRadius, (int)random(3, 8));    
  }
  public void draw() {
    pushStyle();
    //fill(fillColor);
    noFill();
    pushStyle();
    if(!drawContourBottom) {
      noFill();
      noStroke();
    }
    else {
      fill(fillColor);
    }
    outerSnout.draw();
    popStyle();
    if(!drawContourBottom && drawContourTop) {
      int outerSnoutDetail = outerSnout.getNumberOfPoints();
      float angleBetweenPoints = (2*PI) / outerSnoutDetail;
      int pointsToMoveBack = outerSnoutDetail/2;
      //outerSnout.drawPartial(-pointsToMoveBack, (int)(outerSnoutDetail/2) - pointsToMoveBack);
    }
    pushMatrix();
    if(drawRhinarium) {
      fill(rhinariumColor);
      noStroke();
      translate(0, (rhinariumRadius - snoutHeight)/2);
      rhinarium.draw();
    }
    popStyle();
    popMatrix();
    mouth.draw();
  }
  public void moveBy(float x, float y) {
    outerSnout.shape.translate(x, y);
    rhinarium.shape.translate(x, y);
    mouth.moveBy(x, y);
  }
}

