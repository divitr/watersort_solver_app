import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/addNewColorWithName.dart';

const kPrimaryColor = Color(0xff02122d);
const kSecondaryColor = Color(0xe6e6faf5);

const filledColorWidth = 18.0;
const filledColorHeight = 15.0;

const emptyColor = Colors.transparent;
bool resetBottles = true;

List<Color> dragColors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  // Colors.lightGreen,
  // Colors.pink,
  // Colors.greenAccent,
  // Colors.indigo,
  // Colors.blueAccent,
  // Colors.grey,
  // Colors.orange,
  // Colors.purple,
  // Colors.lightBlue,
  // emptyColor
];

List<String> dragColorsNames = [
  'blue',
  'red',
  'green',
  'yellow',
  // 'lightGreen',
  // 'pink',
  // 'greenAccent',
  // 'indigo',
  // 'blueAccent',
  // 'grey',
  // 'orange',
  // 'purple',
  // 'lightBlue',
  // 'empty',
];

List<AddColorsWithNameModel> colorsName = [
  AddColorsWithNameModel('blue', Colors.blue),
  AddColorsWithNameModel('red', Colors.red),
  AddColorsWithNameModel('green', Colors.green),
  AddColorsWithNameModel('yellow', Colors.yellow),
  // AddColorsWithNameModel('lightGreen', Colors.lightGreen),
  // AddColorsWithNameModel('pink', Colors.pink),
  // AddColorsWithNameModel('greenAccent', Colors.greenAccent),
  // AddColorsWithNameModel('indigo', Colors.indigo),
  // AddColorsWithNameModel('blueAccent', Colors.blueAccent),
  // AddColorsWithNameModel('grey', Colors.grey),
  // AddColorsWithNameModel('orange', Colors.orange),
  // AddColorsWithNameModel('purple', Colors.purple),
  // AddColorsWithNameModel('lightBlue', Colors.lightBlue),
  // AddColorsWithNameModel('empty', emptyColor),
];
