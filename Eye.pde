class Eye {
  public boolean hasLashes;
  private color eyeballColor = #FFFFFF,
                irisColor = color(random(127, 207), random(127, 207), random(127, 207)),
                pupilColor = #000000;
  private int detail, eyeballRadius, irisRadius, pupilRadius;
  private IrregularCircle irregularCircle;
  Eye() {
    this(38);
  }
  Eye(int radius) {
    hasLashes = randomBoolean();
    detail = (int)random(5, 8);
    eyeballRadius = radius;
    irisRadius = eyeballRadius / 2;
    pupilRadius = irisRadius / 2;
    irregularCircle = new IrregularCircle(eyeballRadius, detail);
  }
  public void draw() {
    if(hasLashes) {
      drawLashes();
    }
    pushStyle();
    pushMatrix();
    fill(eyeballColor);
    irregularCircle.draw();
    fill(irisColor);
    noStroke();
    scale((float)irisRadius/eyeballRadius);
    irregularCircle.draw();
    fill(pupilColor);
    scale((float)pupilRadius/irisRadius);
    irregularCircle.draw();
    popMatrix();
    popStyle();
  }
  private void drawLashes() {
    int lashLength = eyeballRadius*3/2;
    line(0, 0, -15, -lashLength);
    line(0, 0, 0, -lashLength);
    line(0, 0, 15, -lashLength);
  }
}

