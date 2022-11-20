import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UI_config
{
  static const MaterialColor backgroudColor = Colors.blueGrey;

  static const double detailTextSize = 13;
  static const Color detailTextColor = Colors.white;

  static const TextStyle detailTextStyle = TextStyle(
      fontSize: UI_config.detailTextSize,
      color: UI_config.detailTextColor
  );

  static const TextStyle TitleTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle cubeTextStyle = TextStyle(
    fontSize: 13,
    color: Colors.white,
  );

  static const TextStyle dateTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );
  static const List<Color> colors = <Color>[
    Colors.deepOrangeAccent,
    Colors.lightGreenAccent,
    Colors.amber,
  ];
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,

  );
}
