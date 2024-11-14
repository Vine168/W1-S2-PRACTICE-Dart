class Point {
  double x;
  double y;
  Point(this.x, this.y);
  void translate(double dx, double dy) {
    x += dx;
    y += dy;
  }
  @override
  String toString() => 'Point(x: $x, y: $y)';
}
void main() {
  Point p = Point(3, 4);
  print(p);

  p.translate(2, 3);
  print(p);
}
