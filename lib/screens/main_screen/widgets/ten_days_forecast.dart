import 'package:flutter/material.dart';
import 'package:weather_flutter/bloc/weather_bloc.dart';
import 'package:weather_repository/weather_repository.dart';
import 'day_forecast_item.dart';

class TenDaysForecast extends StatelessWidget {
  final WeatherState state;

  const TenDaysForecast({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final List<Forecast> forecastList = state.forecastList;

    return Container(
      height: 400,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(57, 61, 107, 0.382),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Color.fromARGB(255, 155, 155, 155),
                  size: 19,
                ),
                SizedBox(width: 5),
                Text(
                  'ПРОГНОЗ ПОГОДЫ НА 7 ДН',
                  style: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                )
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 155, 155, 155),
            ),
            Expanded(
              child: ListView.separated(
                //physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemCount: forecastList.length,
                itemBuilder: (context, index) {
                  List<dynamic> dateList = forecastList[index].date.split('-').toList();
                  dateList = dateList.map((element) => int.parse(element)).toList();

                  return DayForecastItem(
                    weekForecastParametrs: state.weekParametrs!,
                    minTemp: forecastList[index].parts.night.tempMin,
                    maxTemp: forecastList[index].parts.day.tempMax,
                    icon: forecastList[index].parts.day.icon,
                    weekday: index == 0
                        ? 'Сегодня'
                        : DateTime.utc(
                            dateList[0],
                            dateList[1],
                            dateList[2],
                          ).weekday.toString(),
                    currentTemValue: index == 0 ? state.currentTemp : 0,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromARGB(255, 155, 155, 155),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
