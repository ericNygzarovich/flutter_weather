import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_flutter/bloc/weather_bloc.dart';

import 'hour_forecast_item.dart';

class HourForecast extends StatelessWidget {
  final WeatherState state;

  const HourForecast({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(57, 61, 107, 0.388),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10, right: 25),
              child: Text(
                'Ясная погода ночью и утром порывы вeтра до 6 м/с.',
                style: TextStyle(color: Color.fromARGB(255, 249, 249, 249), fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 155, 155, 155),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.hourForecast.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: HourForecastItem(
                      hour: index == 0 ? 'Сейчас' : state.hourForecast[index].hour,
                      icon: state.hourForecast[index].hour.length > 2
                          ? Image.asset(
                              state.hourForecast[index].icon,
                              height: 30,
                              width: 30,
                            )
                          : SvgPicture.network(
                              'https://yastatic.net/weather/i/icons/funky/dark/${state.hourForecast[index].icon}.svg',
                              height: 30,
                              width: 30,
                            ),
                      temp: index == 0 ? state.currentTemp : state.hourForecast[index].temp,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
