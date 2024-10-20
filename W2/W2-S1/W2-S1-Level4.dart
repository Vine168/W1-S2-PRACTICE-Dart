class Distance {
  final double _m;

  const Distance._(this._m);

  factory Distance.cm(double cm) {
    return Distance._(cm / 100);
  }
  factory Distance.m(double m) {
    return Distance._(m);
  }
  factory Distance.km(double km) {
    return Distance._(km * 1000);
  }
  double get m => _m;
  double get km => _m * 1000;
  double get cm => _m / 100;

  Distance operator +(Distance other) {
    return Distance._(_m + other._m);
  }
  @override
  String toString() => 'distance: $_m meters';
}
void main() {
  Distance d1 = Distance.km(1);
  Distance d2 = Distance.m(1000);

  Distance res = d1 + d2;
  print(res);
}
