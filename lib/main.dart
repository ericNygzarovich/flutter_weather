import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/src/weather_repository.dart';

import 'bloc/weather_bloc.dart';
import 'screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<WeatherRepository>(
      create: (context) => WeatherRepository(),
      child: BlocProvider<WeatherBloc>(
        create: (context) =>
            WeatherBloc(weatherRepo: context.read<WeatherRepository>()),
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );
  }
}
