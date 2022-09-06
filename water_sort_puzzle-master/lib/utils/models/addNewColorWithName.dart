import 'package:flutter/material.dart';

class AddColorsWithNameModel {
  String nameOfColors;
  Color colors;

  AddColorsWithNameModel(this.nameOfColors, this.colors);
}

List<AddColorsWithNameModel> colors = [
  AddColorsWithNameModel('red', Colors.red),
  AddColorsWithNameModel('blue', Colors.blue),
  AddColorsWithNameModel('green', Colors.green),
  AddColorsWithNameModel('yellow', Colors.yellow),
];
