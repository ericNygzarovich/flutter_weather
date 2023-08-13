class SunriseSunsetData {
  final Result results;
  final String status;

  SunriseSunsetData({
    required this.results,
    required this.status,
  });

  factory SunriseSunsetData.fromJson(Map<String, dynamic> json) => SunriseSunsetData(
        results: Result.fromJson(json['results']),
        status: json['status'],
      );
}

class Result {
  final String sunsetNoTranfor;
  final String suriseNoTranfor;

  Result({
    required this.sunsetNoTranfor,
    required this.suriseNoTranfor,
  });

  String get sunset => _tranformation(sunsetNoTranfor);
  String get sunrise => _tranformation(suriseNoTranfor);

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      suriseNoTranfor: json['sunrise'],
      sunsetNoTranfor: json['sunset'],
    );
  }

  String _tranformation(String element) {
    if (element.endsWith('PM')) {
      element = element.substring(0, 4);
      String hour = (int.parse(element[0]) + 12).toString();
      return hour + element.substring(1);
    }

    return element.substring(0, 4);
  }
}
