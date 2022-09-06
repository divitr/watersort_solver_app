import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:water_sort_puzzle/solution/tube.dart';
import 'package:water_sort_puzzle/utils/colors_extension.dart';
import 'package:water_sort_puzzle/utils/constants.dart';

class Step {
  Tube? fromTube;
  Tube? toTube;
  Color? col;
  int quarts = 0;

  Step(Tube from, Tube to, Color color, int q) {
    fromTube = from;
    toTube = to;
    col = color;
    quarts = q;
  }

  int getQuarts() {
    return quarts;
  }

  Color? color() {
    return col;
  }

  Tube? getFromTube() {
    return fromTube;
  }

  Tube? getToTube() {
    return toTube;
  }

  String getToStr2() {
    var s = StringBuffer();
    s.write(quarts);
    s.write(" quart(s) of ");

    // log('*** CURRENT COLOR NAME IS $col');

    if (col != null) {
      if (dragColors.contains(col!)) {
        int theIndex = dragColors.indexOf(col!);
        s.write('$theIndex');
      }
    }

    //s.write(col?.name ?? '');
    s.write("  ");
    s.write(" from ");
    s.write(fromTube?.name ?? '');
    s.write(" to ");
    s.write(toTube?.name ?? '');
    return s.toString();
  }

  // Output format is 2,2,1,2 (Quarts, Index, FromTube, ToTube)
  // It means 2 quarts of 2nd Index from 1st Tube to 2nd Tube
  String getCommaSeparatedString() {
    var s = StringBuffer();
    s.write(quarts);
    s.write(',');

    if (col != null) {
      if (dragColors.contains(col!)) {
        int theIndex = dragColors.indexOf(col!);
        s.write('$theIndex');
        s.write(',');
      }
    }

    s.write(fromTube?.name ?? '');
    s.write(',');
    s.write(toTube?.name ?? '');
    return s.toString();
  }

  String getToStr() {
    String bold = "\033[1;97m";
    String underline = "\033[4;30m";

    var s = StringBuffer();

    s.write(bold);
    s.write(underline);
    s.write(quarts);
    s.write(" quart(s) of ");

    s.write("  ");

    s.write(bold);
    s.write(underline);
    s.write("(");
    s.write(col);
    s.write(") from ");
    s.write(fromTube?.name ?? '');
    s.write(" to ");
    s.write(toTube?.name ?? '');

    return s.toString();
  }
}
