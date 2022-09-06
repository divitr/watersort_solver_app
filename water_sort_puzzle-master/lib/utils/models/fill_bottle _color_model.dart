import 'package:flutter/cupertino.dart';

import '../../solution/tube.dart';
import '../constants.dart';

class FillBottleColor {
  double size;
  List<Color> colors;
  Tube? tube;
  int indexOfBottle;

  FillBottleColor(this.colors, this.size, this.indexOfBottle);

  void prepareTube() {
    String tubeName = 'tube' + (indexOfBottle + 1).toString();

    if (colors.isNotEmpty) {
      // A tube must have 4 colors either filled or empty.
      tube = Tube(tubeName, _colorToBeAdded(0), _colorToBeAdded(1),
          _colorToBeAdded(2), _colorToBeAdded(3));
    } else {
      tube = Tube(tubeName, emptyColor, emptyColor, emptyColor, emptyColor);
    }
  }

  Color _colorToBeAdded(int index) {
    if (index < colors.length) {
      return colors[index];
    }

    return emptyColor;
  }
}
