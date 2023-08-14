class WeekForecastParametrs {
  late int _minTempbehindSevenDays;
  late int _maxTempbehindSevenDays;

  WeekForecastParametrs(
    this._maxTempbehindSevenDays,
    this._minTempbehindSevenDays,
  );

  set setMinTemp(int newTemp) => _minTempbehindSevenDays = newTemp;
  set setMaxTemp(int newTemp) => _maxTempbehindSevenDays = newTemp;

  int get difference => _maxTempbehindSevenDays - _minTempbehindSevenDays;
  int get minTempBehindWeek => _minTempbehindSevenDays;
  int get maxTempBehindWeek => _maxTempbehindSevenDays;
}
