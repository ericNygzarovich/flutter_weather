import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter/bloc/weather_bloc.dart';
// ignore: implementation_imports, unused_import
import 'package:weather_repository/src/weather_repository.dart';
import '../../theme/app_theme.dart';
import 'widgets/current_temp_delegate.dart';
import 'widgets/edge_forecat_for_the_day.dart';
import 'widgets/header_delegate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _controller;
  //late double _scrollOffset;

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetWeather());
    _controller = ScrollController();
    //_scrollOffset = 0.0;

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
            return Center(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [],
                    ),
                  ),
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
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(57, 61, 107, 0.388),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 25),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, right: 25),
                                child: Text(
                                  'Ясная погода ночью и утром порывы вeтра до 6 м/с.',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 249, 249, 249),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Divider(
                                color: Color.fromARGB(255, 155, 155, 155),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(57, 61, 107, 0.382),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(57, 61, 107, 0.382),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(57, 61, 107, 0.382),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
