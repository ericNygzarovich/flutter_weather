import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_flutter/models/condition_model.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  late final WeatherRepository _weatherRepo;

  WeatherBloc({required WeatherRepository weatherRepo})
      : _weatherRepo = weatherRepo,
        super(WeatherState()) {
    on<WeatherEvent>(_getWeather);
  }

  Future<void> _getWeather(WeatherEvent event, Emitter<WeatherState> emitter) async {
    final WeatherObject weather = await _weatherRepo.getDataAPI();

    final String currenCondition = ConditionModel.returnCondition(weather.fact.condition)!;
    final int currentTemperature = weather.fact.temp;
    final int minTemp = weather.forecast[0].parts.night.tempMin;
    final int maxTemp = weather.forecast[0].parts.day.tempMax;
    final List<Hour> hourForecastList = _tranformationHourlyForecastList(
      HourlyForecastForTwoDays(
        todayList: weather.forecast[0].hours,
        tommorList: weather.forecast[1].hours,
      ),
    );

    Future.delayed(const Duration(seconds: 2));

    emitter(
      state.copyWith(
        newCondition: currenCondition,
        newTemp: currentTemperature,
        newMaxTemp: maxTemp,
        newMinTemp: minTemp,
        newHourForecastList: hourForecastList,
        loadUpdate: true,
      ),
    );
  }

  List<Hour> _tranformationHourlyForecastList(HourlyForecastForTwoDays forecast) {
    final currentHour = DateTime.now().hour;

    return forecast.todayList.sublist(currentHour) + forecast.tommorList.sublist(0, currentHour + 1);
  }
}

class HourlyForecastForTwoDays {
  final List<Hour> todayList;
  final List<Hour> tommorList;

  HourlyForecastForTwoDays({
    this.todayList = const [],
    this.tommorList = const [],
  });
}
