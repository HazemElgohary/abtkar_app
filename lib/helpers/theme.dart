import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

class BeautyThemeConfig extends ThemeConfig {
  @override
  List<QTheme> get themes => [

    QTheme(
      id: 'dark',
      name: 'dark',
      theme: ThemeData.dark(),
    ),
    QTheme(
      id: 'light',
      name: 'light',
      theme: ThemeData.light(),
    ),
  ];
}