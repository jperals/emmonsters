class Eye {
  private color eyeballColor = #FFFFFF,
                irisColor = color(random(127, 207), random(127, 207), random(127, 207)),
                pupilColor = #000000;
  private int eyeballRadius, irisRadius, pupilRadius;
  private IrregularCircle irregularCircle;
  Eye() {
    this(38);
  }
  Eye(int radius) {
    eyeballRadius = radius;
    irisRadius = eyeballRadius / 2;
    pupilRadius = irisRadius / 2;
    irregularCircle = new IrregularCircle(eyeballRadius);
  }
  public void draw() {
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
}

