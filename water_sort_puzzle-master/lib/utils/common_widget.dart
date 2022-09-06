import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:water_sort_puzzle/utils/constants.dart';
// ignore: library_prefixes

SizedBox solveButton(
  BuildContext context,
  bool isShowingLoader,
  Function(int) hitSolveButton,
) {
  return SizedBox(
    width: 200,
    child: ElevatedButton(
        onPressed: () {
          // log('BUTTON PRESSED');
          hitSolveButton(1);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: kPrimaryColor,
            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        child: const Text('SOLVE')),
  );
}

Container bottleFilledColor(Color chosenColor) {
  return Container(
    //padding: const EdgeInsets.only(bottom: 4),
    color: chosenColor,
    width: filledColorWidth,
    height: filledColorHeight,
  );
}

Container bottleFilledColorWithDecoration(Color chosenColor) {
  return Container(
      width: filledColorWidth,
      height: filledColorHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        color: chosenColor,
      ));
}

Container bottleBottomFilledColorWithDecoration(Color chosenColor) {
  return Container(
      width: filledColorWidth,
      height: filledColorHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0)),
        color: chosenColor,
      ));
}
