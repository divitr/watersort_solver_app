import 'dart:ui';
import 'package:water_sort_puzzle/utils/colors_extension.dart';
import 'package:water_sort_puzzle/utils/constants.dart';

class Tube {
  String name = '';
  final int full = -1;

  List<Color> tubeContents = [];

  String stringId = '';
  int intId = -1;

  Tube(String tubeName, Color color1, Color color2, Color color3,
      Color color4) //assigns colors to positions
  {
    tubeContents = List<Color>.from([color1, color2, color3, color4]);
    name = tubeName;
    intId = int.parse(getIndexOfTheColor(tubeContents[0]).toString() +
        getIndexOfTheColor(tubeContents[1]).toString() +
        getIndexOfTheColor(tubeContents[2]).toString() +
        getIndexOfTheColor(tubeContents[3]).toString());
  } // Tube constructor

  int getIndexOfTheColor(Color colorToGetIndex) {
    if (dragColors.contains(colorToGetIndex)) {
      return dragColors.indexOf(colorToGetIndex);
    }

    // if (tubeContents.contains(colorToGetIndex)) {
    //   return tubeContents.indexOf(colorToGetIndex);
    // }

    return 99;
  }

  bool tubeDone() {
    int firstColor = getIndexOfTheColor(tubeContents[0]);
    for (int idx = 1; idx < tubeContents.length; idx++) {
      if (getIndexOfTheColor(tubeContents[idx]) != firstColor) {
        return false;
      }
    }
    return true;
  }

  String draw() {
    var buffer = StringBuffer();
    buffer.write(name);
    buffer.write("-------");

    for (int i = 0; i < tubeContents.length; i++) {
      //System.out.print(" |  " + tubeContents.get(i));
      buffer.write(" |  ");
      buffer.write(tubeContents[i].name);
    }

    buffer.write('\r\n');
    return buffer.toString();
  }

  bool push(Color newColor, bool mock) {
    int slot = firstEmptySlot();
    if (slot == full) {
      return false;
    }

    if (slot != 0 && tubeContents[slot - 1] != newColor) {
      return false;
    }

    if (!mock) {
      tubeContents[slot] = newColor;

      intId = int.parse(getIndexOfTheColor(tubeContents[0]).toString() +
          getIndexOfTheColor(tubeContents[1]).toString() +
          getIndexOfTheColor(tubeContents[2]).toString() +
          getIndexOfTheColor(tubeContents[3]).toString());
    }

    return true;
  }

  Color pop(bool mock) {
    Color popColor;
    int slot = firstEmptySlot();
    if (slot != 0) {
      if (slot != full) {
        popColor = tubeContents[slot - 1];
      } else {
        popColor = tubeContents[tubeContents.length - 1];
      }
      if (!mock) {
        if (slot != full) {
          tubeContents[slot - 1] = emptyColor;
        }

        if (slot == full) {
          tubeContents[tubeContents.length - 1] = emptyColor;
        }

        intId = int.parse(getIndexOfTheColor(tubeContents[0]).toString() +
            getIndexOfTheColor(tubeContents[1]).toString() +
            getIndexOfTheColor(tubeContents[2]).toString() +
            getIndexOfTheColor(tubeContents[3]).toString());
      }
      return popColor;
    }
    return emptyColor;
  }

  //returns FULL if tube is full, otherwise returns index of first empty slot
  int firstEmptySlot() {
    for (int idx = 0; idx < tubeContents.length; idx++) {
      if (tubeContents[idx] == emptyColor) {
        return idx;
      }
    }
    return full;
  }

  bool isEssentiallySameAs(Tube second) {
    int size = tubeContents.length;
    if (size != second.tubeContents.length) {
      return false;
    }

    for (int i = 0; i < size; i++) {
      if (getIndexOfTheColor(tubeContents[i]) !=
          getIndexOfTheColor(second.tubeContents[i])) {
        return false;
      }
    }
    return true;
  }

  static Tube deepClone(Tube oldTube) {
    Tube newTube = Tube(
        oldTube.name,
        oldTube.tubeContents[0],
        oldTube.tubeContents[1],
        oldTube.tubeContents[2],
        oldTube.tubeContents[3]);
    return newTube;
  }
}
