class Eye {
  private color eyeballColor = #FFFFFF,
                irisColor = color(random(127, 207), random(127, 207), random(127, 207)),
                pupilColor = #000000;
  private int eyeballRadius, irisRadius, pupilRadius;
  Eye() {
    this(38);
  }
  Eye(int radius) {
    eyeballRadius = radius;
    irisRadius = eyeballRadius / 2;
    pupilRadius = irisRadius / 2;
  }
  public void draw() {
    pushStyle();
    fill(eyeballColor);
    ellipse(0, 0, eyeballRadius*2, eyeballRadius*2);
    fill(irisColor);
    noStroke();
    ellipse(0, 0, irisRadius*2, irisRadius*2);
    fill(pupilColor);
    ellipse(0, 0, pupilRadius*2, pupilRadius*2);
    popStyle();
  }
}

