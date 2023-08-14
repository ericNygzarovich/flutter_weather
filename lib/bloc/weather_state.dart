part of 'weather_bloc.dart';

class WeatherState {
  final bool isLoading;
  final String? curretnCondition;
  final int currentTemp;
  final int maxTemp;
  final int minTemp;
  final List<Hour> hourForecast;
  final List<Forecast> forecastList;

  WeatherState({
    this.curretnCondition,
    this.currentTemp = 0,
    this.maxTemp = 0,
    this.minTemp = 0,
    this.hourForecast = const [],
    this.isLoading = false,
    this.forecastList = const [],
  });

  @override
  bool operator ==(Object other) => other is WeatherState && other.runtimeType == runtimeType && other.currentTemp == currentTemp && other.maxTemp == maxTemp && other.minTemp == minTemp && other.curretnCondition == curretnCondition;

  @override
  int get hashCode => currentTemp.hashCode;

  WeatherState copyWith({
    int? newTemp,
    newMaxTemp,
    newMinTemp,
    String? newCondition,
    List<Hour>? newHourForecastList,
    bool? loadUpdate,
    List<Forecast>? forecastList,
  }) {
    return WeatherState(
      curretnCondition: newCondition ?? curretnCondition,
      currentTemp: newTemp ?? currentTemp,
      maxTemp: newMaxTemp ?? maxTemp,
      minTemp: newMinTemp ?? minTemp,
      hourForecast: newHourForecastList ?? [],
      isLoading: loadUpdate ?? isLoading,
      forecastList: forecastList ?? [],
    );
  }
}
