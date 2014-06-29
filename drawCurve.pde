void drawCurve(RPoint[] points) {
    curve(points[0].x, points[0].y, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);
    curve(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[2].x, points[2].y);
}

