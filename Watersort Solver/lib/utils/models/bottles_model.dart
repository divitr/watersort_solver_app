import 'package:flutter/material.dart';

class ItemData {
  Widget image;
  bool isAdded = false;
  int itemCount = 0;

  ItemData(this.image);
}

List<ItemData> bottles = [
  ItemData(
      Image.asset('assets/images/milk-bottle.png', width: 50, height: 100)),
];
