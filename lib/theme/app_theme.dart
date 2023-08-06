import 'package:flutter/material.dart';

class AppTheme {
  static const Gradient _backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color.fromRGBO(34, 45, 83, 1),
      Color.fromRGBO(42, 51, 89, 1),
      Color.fromRGBO(50, 56, 94, 1),
      Color.fromRGBO(61, 64, 104, 1),
      Color.fromRGBO(73, 73, 109, 1),
      Color.fromRGBO(92, 84, 110, 1),
      Color.fromRGBO(108, 94, 107, 1),
      Color.fromRGBO(121, 99, 107, 1),
      Color.fromRGBO(136, 106, 106, 1),
    ],
  );

  static Gradient get backgroundColor => _backgroundGradient;
}
