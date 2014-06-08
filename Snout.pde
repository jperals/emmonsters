class Snout {
  private boolean hasDifferentColor,
                  drawContourTop,
                  drawContourBottom;
  private color snoutColor = #BB9944,
                rhinariumColor = #331100;
  private int snoutRadius, rhinariumRadius;
  private IrregularCircle outerSnout, rhinarium;
  Snout() {
    this(15);
  }
  Snout(int radius) {
    snoutRadius = radius;
    rhinariumRadius = (int) (radius * random(0.5, 1));
    hasDifferentColor = randomBoolean();
    drawContourTop = hasDifferentColor && randomBoolean();
    drawContourBottom = drawContourTop && randomBoolean();
    outerSnout = new IrregularCircle(snoutRadius);
    rhinarium = new IrregularCircle(rhinariumRadius);    
  }
  public void draw() {
    pushStyle();
    pushStyle();
    if(!drawContourBottom) {
      noStroke();
    }
    if(hasDifferentColor) {
      fill(snoutColor);
    }
    outerSnout.draw();
    popStyle();
    fill(rhinariumColor);
    noStroke();
    pushMatrix();
    translate(0, (rhinariumRadius - snoutRadius)/2);
    rhinarium.draw();
    popMatrix();
    popStyle();
  }
}

