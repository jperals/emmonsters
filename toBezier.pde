RShape toBezier(RPoint[] vertices) {
  return toBezier(vertices, 0, vertices.length - 1);
}
RShape toBezier(RPoint[] vertices, int from, int to) {
  RShape bezierShape = new RShape();
  int detail = vertices.length;
  PVector lastVertex = from > 0 ? new PVector(vertices[from - 1].x, vertices[from - 1].y) : new PVector(vertices[to].x, vertices[to].y),
          firstVertex = new PVector(vertices[from].x, vertices[from].y);
  PVector originalLocation = PVector.lerp(lastVertex, firstVertex, 0.5);
  bezierShape.addMoveTo(originalLocation.x, originalLocation.y);
  for(int i = from; i <= to; i++) {
    int previousIndex = i == 0 ? detail - 1 : i - 1,
        nextIndex = i == detail - 1 ? 0 : i + 1;
    PVector previousVertex = new PVector(vertices[previousIndex].x, vertices[previousIndex].y),
            currentVertex = new PVector(vertices[i].x, vertices[i].y),
            nextVertex = new PVector(vertices[nextIndex].x, vertices[nextIndex].y);
    PVector firstControlPoint = PVector.lerp(previousVertex, currentVertex, 0.75),
            secondControlPoint = PVector.lerp(currentVertex, nextVertex, 0.25),
            destinationPoint = PVector.lerp(currentVertex, nextVertex, 0.5);
    //println(destinationPoint.x, destinationPoint.y);
    bezierShape.addBezierTo(firstControlPoint.x, firstControlPoint.y,
                            secondControlPoint.x, secondControlPoint.y,
                            destinationPoint.x, destinationPoint.y);
    //println(firstControlPoint.x, firstControlPoint.y, secondControlPoint.x, secondControlPoint.y, destinationPoint.x, destinationPoint.y);
  }
  return bezierShape;
}

