boolean randomBoolean(float bias) {
  return random(1) < bias;
}

boolean randomBoolean() {
  return randomBoolean(0.5);
}

