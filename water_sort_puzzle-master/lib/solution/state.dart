import 'dart:developer';
import 'dart:ui';

import 'package:water_sort_puzzle/solution/step.dart';
import 'package:water_sort_puzzle/solution/tube.dart';
import 'dart:collection';

import 'package:water_sort_puzzle/utils/constants.dart';

class State {
  var steps;
  var states;

  static int Id = 1;

  var IdPath;

  var id;

  State? prevState;
  State? nextState;

  var pStep;

  int depth = 0;
  String stringId = '';

  List<int> id2 = [];
  StringBuffer s = StringBuffer();

  final int full = -1;

  List<Tube> allTubes = [];

  List<State> wipStates = [];

  static HashSet<String> setStates = HashSet<String>();

  State(List<Tube> allInitialTubes) {
    allTubes = allInitialTubes;

    steps = List<String>.empty(growable: true);

    states = List<State>.empty(growable: true);
    id = Id++;
    prevState = null;
    nextState = null;

    IdPath = id.toString();
    depth = 0;

    s = StringBuffer();
    makeStringId();
    pStep = null;
  }

  State.fromState(State previousState) {
    steps = List<String>.empty(growable: true);

    states = List<State>.empty(growable: true);

    List<Tube> allTubesLocal = previousState.getTubes();
    for (int i = 0; i < allTubesLocal.length; i++) {
      Tube tempTube = Tube.deepClone(allTubesLocal.elementAt(i));
      allTubes.add(tempTube);
    }

    id = Id++;
    prevState = previousState;

    //if (prevState != null) {
    prevState?.nextState = this;
    IdPath = prevState?.IdPath + "-" + id.toString();
    depth = prevState?.depth ?? 0 + 1;
    //}

    s = StringBuffer();
    makeStringId();
    pStep = null;
  }

  void makeStringId() {
    id2.clear();

    for (int i = 0; i < allTubes.length; i++) {
      id2.add(allTubes[i].intId);
    }

    id2.sort();

    s.clear();
    for (int i = 0; i < id2.length; i++) {
      s.write(id2[i].toString());
    }

    stringId = s.toString();
  }

  bool isEssentiallySameAs(State second) {
    return (stringId == (second.stringId));
  }

  bool isEssentiallySameAsPredecessors() {
    State? prev = prevState;
    while (prev != null) {
      if (isEssentiallySameAs(prev)) {
        return true;
      }
      prev = prev.prevState;
    }

    return false;
  }

  bool amIDone() {
    for (int idx = 0; idx < allTubes.length; idx++) {
      if (allTubes[idx].tubeDone() == false) {
        return false;
      }
    }
    return true;
  }

  List<Tube> getTubes() {
    return allTubes;
  }

  String draw() {
    var ret = StringBuffer();
    for (int i = 0; i < allTubes.length; i++) {
      ret.write(allTubes[i].draw());
    }
    ret.write("\r\n");
    return ret.toString();
  }

  bool canTransfer(Tube fromTube, Tube toTube) {
    if (fromTube == toTube) {
      return false;
    }

    if (toTube.firstEmptySlot() == full) {
      return false;
    }

    Color poppedColor = fromTube.pop(true);

    if (poppedColor == emptyColor) {
      return false;
    }

    if (!toTube.push(poppedColor, true)) {
      return false;
    }

    return true;
  }

  State transfer(int from, int to) {
    if (from == to) {
      return this;
    }

    State newState;
    Color? color;
    int quartsTransferred = 0;
    Tube fromTube = allTubes[from];
    Tube toTube = allTubes[to];
    bool toTubeEmptyBefore = (toTube.pop(true) == emptyColor);

    if (canTransfer(fromTube, toTube)) {
      newState = State.fromState(this);
      fromTube = newState.allTubes[from];
      toTube = newState.allTubes[to];

      // do one transfer here
      color = fromTube.pop(false);
      toTube.push(color, false);
      //this.makeStringId();
      quartsTransferred++;
    } else {
      return this;
    }

    // if more transfers possible
    while (newState.canTransfer(fromTube, toTube)) {
      color = fromTube.pop(false);
      toTube.push(color, false);

      quartsTransferred++;
    }

    if (quartsTransferred > 0) {
      bool fromTubeEmptyAfter = (fromTube.pop(true) == emptyColor);

      if (toTubeEmptyBefore && fromTubeEmptyAfter) {
        return this;
      }

      if (color == fromTube.pop(true)) {
        return this;
      }

      newState.makeStringId();

      // check for duplicates
      bool success = setStates.add(newState.stringId);

      if (!success) {
        return this;
      }

      newState.pStep = Step(fromTube, toTube, color!, quartsTransferred);

      return newState;
    }

    return this;
  }

  String printSolutionSteps() {
    List<State?> prevStates = [];
    List<Step> prevSteps = [];

    State? st = this;

    while (st != null) {
      prevStates.insert(0, st);
      if (st.pStep != null) {
        prevSteps.insert(0, st.pStep);
        // log('STEPS ARE ${prevSteps.length}');
      }
      st = st.prevState;
    }

    StringBuffer ret = StringBuffer();

    for (int i = 0; i < prevSteps.length; ++i) {
      ret.write("**  STEP.");
      ret.write(i + 1);
      ret.write("  ********* ");
      ret.write(prevSteps[i].getToStr2());
      ret.write("\r\n");
    }

    return ret.toString();
  }

  List<String> printSolutionStepsInArray() {
    List<State?> prevStates = [];
    List<Step> prevSteps = [];

    State? st = this;

    while (st != null) {
      prevStates.insert(0, st);
      if (st.pStep != null) {
        prevSteps.insert(0, st.pStep);
      }
      st = st.prevState;
    }

    List<String> solutionSteps = [];
    for (int i = 0; i < prevSteps.length; ++i) {
      solutionSteps.add(prevSteps[i].getCommaSeparatedString());
    }

    return solutionSteps;
  }

  bool isValid() {
    HashMap ourHashmap = HashMap<Color, int>();
    for (int i = 0; i < allTubes.length; ++i) {
      for (int j = 0; j < allTubes[i].tubeContents.length; ++j) {
        Color col = allTubes[i].tubeContents[j];
        if (col == emptyColor) {
          continue;
        }

        if (!ourHashmap.containsKey(col)) {
          ourHashmap.putIfAbsent(col, () => 0);
        }

        ourHashmap[col] = ourHashmap[col] + 1;
      }
    }

    bool retValue = true;
    ourHashmap.entries.forEach((e) {
      if (e.value != 4) {
        retValue = false;
      }
    });

    if (!retValue) {
      return false;
    }

    return true;
  }

  State? solveNonRecursively() {
    wipStates.clear();

    wipStates.add(this);
    setStates.add(stringId);

    // ignore: unused_local_variable
    int added = 0;

    while (wipStates.isNotEmpty) {
      added = 0;

      State s = wipStates[0];

      if (s.amIDone()) {
        return s;
      }

      wipStates.removeAt(0);

      for (int i = 0; i < s.allTubes.length; i++) {
        for (int j = 0; j < s.allTubes.length; j++) {
          if (i != j) {
            State newState = s.transfer(i, j);

            if (newState != s) {
              wipStates.add(newState);
              added++;
            }
          }
        }
      }
    }

    return null;
  }

  State? solveRecursively() {
    if (amIDone()) {
      return this;
    }

    setStates.add(stringId);

    for (int i = 0; i < allTubes.length; i++) {
      for (int j = 0; j < allTubes.length; j++) {
        if (i != j) {
          State newState = transfer(i, j);

          if (newState != this) {
            State? sol = newState.solveRecursively();
            if (sol != null) {
              return sol;
            }
          }
        }
      }
    }

    return null;
  }
}
