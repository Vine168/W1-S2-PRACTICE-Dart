class CustomDuration {
  final int _millisecond;

  CustomDuration._convert(this._millisecond);

  factory CustomDuration.fromHours(int hours) {
    return CustomDuration._convert(hours * 3600000);
  }
  factory CustomDuration.fromMinutes(int minutes) {
    return CustomDuration._convert(minutes * 60000);
  }
  factory CustomDuration.fromSecond(int seconds) {
    return CustomDuration._convert(seconds * 1000);
  }

  int get millisecond => _millisecond;

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._convert(_millisecond + other._millisecond);
  }

  CustomDuration operator -(CustomDuration other) {
    return CustomDuration._convert(_millisecond - other._millisecond);
  }

  bool operator >(CustomDuration other) {
    return this._millisecond > other._millisecond;
  }

  String display() {
    int seconds = (_millisecond % 60000) ~/ 1000;
    int minutes = (_millisecond % 3600000) ~/ (60000);
    int hours = (_millisecond ~/ 3600000);
    return 'Time : $hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  CustomDuration time1 = CustomDuration.fromHours(2);
  CustomDuration time2 = CustomDuration.fromMinutes(2);
  CustomDuration time3 = CustomDuration.fromSecond(10);

  CustomDuration addTwoDuration = time1 + time3;
  print('Adding duration: ${addTwoDuration.display()}');

  CustomDuration minusTwoDuration = time1 - time2;
  print('Minus duration: ${minusTwoDuration.display()}');
}
