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

  Future<void> _getWeather(
      WeatherEvent event, Emitter<WeatherState> emitter) async {
    final WeatheObject weather = await _weatherRepo.getDataAPI();
    final String currenCondition =
        ConditionModel.returnCondition(weather.fact.condition)!;
    final int currentTemperature = weather.fact.temp;
    final int minTemp = weather.forecast[0].parts.night.tempMin;
    final int maxTemp = weather.forecast[0].parts.day.tempMax;

    emitter(
      state.copyWith(
        newCondition: currenCondition,
        newTemp: currentTemperature,
        newMaxTemp: maxTemp,
        newMinTemp: minTemp,
      ),
    );
  }
}
