part of 'weather_bloc.dart';

class WeatherState {
  final String? curretnCondition;
  final int currentTemp;
  final int maxTemp;
  final int minTemp;

  WeatherState({
    this.curretnCondition,
    this.currentTemp = 0,
    this.maxTemp = 0,
    this.minTemp = 0,
  });

  @override
  bool operator ==(Object other) =>
      other is WeatherState &&
      other.runtimeType == runtimeType &&
      other.currentTemp == currentTemp &&
      other.maxTemp == maxTemp &&
      other.minTemp == minTemp &&
      other.curretnCondition == curretnCondition;

  @override
  int get hashCode => currentTemp.hashCode;

  WeatherState copyWith(
      {int? newTemp, newMaxTemp, newMinTemp, String? newCondition}) {
    return WeatherState(
      curretnCondition: newCondition ?? curretnCondition,
      currentTemp: newTemp ?? currentTemp,
      maxTemp: newMaxTemp ?? maxTemp,
      minTemp: newMinTemp ?? minTemp,
    );
  }
}
