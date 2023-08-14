import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter/bloc/weather_bloc.dart';
// ignore: implementation_imports, unused_import
import 'package:weather_repository/src/weather_repository.dart';
import '../../theme/app_theme.dart';
import 'widgets/current_temp_delegate.dart';
import 'widgets/edge_forecat_for_the_day.dart';
import 'widgets/header_delegate.dart';
import 'widgets/hour_forecast.dart';
import 'widgets/ten_days_forecast.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _controller;
  //late double _scrollOffset;

  Future<void> getWeather() async {}

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2));
    context.read<WeatherBloc>().add(GetWeather());

    _controller = ScrollController();

    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      //_scrollOffset = _controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundColor,
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (!state.isLoading) {
              return const LoadScreen();
            }

            return Center(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  //city name
                  SliverPersistentHeader(
                    delegate: HeaderDelegate(
                      isHeader: true,
                      maxExtents: 150,
                      minExtents: 90,
                      title: 'Краснодар',
                    ),
                    pinned: true,
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: CurrentTempDelegate(
                      maxExtents: 95,
                      minExtants: 95,
                      state: state,
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 5),
                  ),

                  SliverPersistentHeader(
                    delegate: HeaderDelegate(
                      maxExtents: 24,
                      minExtents: 24,
                      title: state.curretnCondition.toString(),
                    ),
                    pinned: true,
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),

                  SliverPersistentHeader(
                    pinned: true,
                    delegate: EdgeForecastForTheDay(
                      maxExtents: 21,
                      minExtants: 21,
                      state: state,
                    ),
                  ),

                  //

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 50),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 50)),

                  //hourForecastComponent
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HourForecast(state: state),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 12)),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TenDaysForecast(state: state),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundColor,
        ),
        child: const Center(
          child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
