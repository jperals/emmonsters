color getNewColor() {
  return getNewColor(127);
}

color getNewColor(int minimum) {
  int blueComponent = (int)random(minimum, 255),
      greenComponent = (int)random(blueComponent - 16, 255),
      redComponent = (int)random(greenComponent - 32, 255);
  return color(redComponent, greenComponent, blueComponent);
}

