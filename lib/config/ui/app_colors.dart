import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {

  static const Map<String, Color> black = {
    'std': Color(0xff343131),
    '100': Color.fromARGB(255, 10, 3, 0),
    '200': Color.fromARGB(255, 19, 19, 19),
    '300': Color.fromARGB(255, 52, 49, 49),
    '400': Color.fromARGB(255, 138, 138, 138),
  };

  static const Map<String, Color> maroon = {
    'std': Color(0xffA04747),
    '100': Color.fromARGB(255, 107, 47, 47),
    '200': Color.fromARGB(255, 160, 71, 71),
    '300': Color.fromARGB(255, 224, 117, 117),
    '400': Color.fromARGB(255, 255, 202, 202),
  };

  static const Map<String, Color> orange = {
    'std': Color(0xffD8A25E),
    '100': Color.fromARGB(255, 37, 27, 15),
    '200': Color(0xffD8A25E),
    '300': Color.fromARGB(255, 230, 187, 134),
    '400': Color.fromARGB(255, 238, 226, 212),
  };

  static const Map<String, Color> yellow = {
    'std': Color(0xffEEDF7A),
    '100': Color.fromARGB(255, 33, 31, 16),
    '200': Color.fromARGB(255, 238, 222, 122),
    '300': Color.fromARGB(255, 242, 232, 166),
    '400': Color.fromARGB(255, 252, 246, 206),
  };




  static const Map<String, Color> menuColors = {
    'color1': Color(0xFFf9d263),
    'color2': Color(0xFFf2603d),
    'color3': Color(0xFF04abe6),
  };

  static const Map<String, Color> backgrounColors = 
  {
    'light': Color.fromARGB(255, 236, 236, 236),
    'silver': Color.fromARGB(255, 211, 211, 211),
    'dark' :  Color.fromARGB(255, 20, 20, 20),
    'darker' : Color.fromARGB(255, 7, 7, 7),
  };

  static const Map<String, Color> iconColors = {
    'light': Color.fromARGB(255, 241, 241, 241),
    'medium': Color.fromARGB(255, 200, 200, 200),
    'dark': Color.fromARGB(255, 26, 26, 26),
  };
}
