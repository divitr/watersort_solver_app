import 'dart:developer';
import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:water_sort_puzzle/utils/constants.dart';

class ArrowPainter extends CustomPainter {
  double startingPointX = 0.0;
  double startingPointY = 0.0;
  double endingPointX = 0.0;
  double endingPointY = 0.0;
  Color colorToBeApplied = emptyColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.0;
    {
      // log('in this function');
      //
      // log('*** Starting point x: $startingPointX and y: $startingPointY');
      // log('*** Ending point x: $endingPointX and y: $endingPointY');

      //bool shouldUseOldSolution = false;

      /*if (shouldUseOldSolution) {
        Path path = Path();
        path.moveTo(37, 105); // Starting point
        // If we want curve then use 0.1
        // If don't need curve then use 0.0
        path.relativeCubicTo(
            0, 0, size.width * 0.1, 30, 154, 0); // x3 y3 Last point
        path = ArrowPath.make(path: path);
        canvas.drawPath(path, paint..color = Colors.black);
      } */

      Path path = Path();
      path.moveTo(startingPointX, startingPointY); // Starting point
      path.lineTo(endingPointX, endingPointY); // Ending point
      path = ArrowPath.make(path: path);
      canvas.drawPath(path, paint..color = colorToBeApplied);
    }
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) {
    return true;
  }
}
