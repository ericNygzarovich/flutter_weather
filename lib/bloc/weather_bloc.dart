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
    final SunriseSunsetData sunriseSunsetData = await _weatherRepo.getSunseSunriseData();
    final String currenCondition = ConditionModel.returnCondition(weather.fact.condition)!;
    final int currentTemperature = weather.fact.temp;
    final int minTemp = weather.forecast[0].parts.night.tempMin;
    final int maxTemp = weather.forecast[0].parts.day.tempMax;
    final List<Hour> hourForecastList = _tranformationHourlyForecastList(
      HourlyForecastForTwoDays(
        todayList: weather.forecast[0].hours,
        tommorList: weather.forecast[1].hours,
      ),
      sunriseSunsetData,
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

  List<Hour> _tranformationHourlyForecastList(
    HourlyForecastForTwoDays forecast,
    SunriseSunsetData sunriseSunsetData,
  ) {
    final currentHour = DateTime.now().hour;

    final List<Hour> tempList = forecast.todayList.sublist(currentHour) +
        forecast.tommorList.sublist(
          0,
          currentHour + 1,
        );

    List<Hour> resultList = [];
    String sunset = sunriseSunsetData.results.sunset.substring(0, 2);
    String sunrise = sunriseSunsetData.results.sunrise.substring(0, 1);
    for (int i = 0; i < tempList.length; i++) {
      resultList.add(tempList[i]);
      if (sunset == tempList[i].hour) {
        resultList.add(Hour(
          hour: sunriseSunsetData.results.sunset,
          icon: 'assets/sunset.png',
          temp: 'Заход солнца',
        ));
      } else if (sunrise == tempList[i].hour) {
        resultList.add(Hour(
          hour: sunriseSunsetData.results.sunrise,
          icon: 'assets/sunrise.png',
          temp: 'Восход солнца',
        ));
      }
    }

    return resultList;
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
