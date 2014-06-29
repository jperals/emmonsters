color getNewColor() {
  int blueComponent = (int)random(127, 255),
      greenComponent = (int)random(blueComponent, 255);
  return color(random(greenComponent, 255), greenComponent, blueComponent);
}

