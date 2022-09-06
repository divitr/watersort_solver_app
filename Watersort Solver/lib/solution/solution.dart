import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:water_sort_puzzle/solution/state.dart' as gameState;
import 'package:water_sort_puzzle/solution/tube.dart';
import 'package:water_sort_puzzle/utils/constants.dart';

class Solution {
  gameState.State _createSimplePuzzle() {
    List<Tube> allTubes = [];
    allTubes.clear();

    Tube tube1 =
        Tube("tube1", Colors.green, Colors.green, Colors.red, Colors.red);
    allTubes.add(tube1);

    Tube tube2 = Tube("tube2", emptyColor, emptyColor, emptyColor, emptyColor);
    allTubes.add(tube2);

    Tube tube3 =
        Tube("tube3", Colors.red, Colors.red, Colors.green, Colors.green);
    allTubes.add(tube3);

    // reset static variables
    gameState.State.Id = 1;
    gameState.State.setStates.clear();

    return gameState.State(allTubes);
  }

  gameState.State initializePuzzle(List<Tube> allTheTubes) {
    // reset static variables
    gameState.State.Id = 1;
    gameState.State.setStates.clear();

    return gameState.State(allTheTubes);
  }

  gameState.State unsolvedPuzzle() {
    List<Tube> allTubes = [];
    allTubes.clear();
    Tube tube1 =
        Tube('tube1', Colors.yellow, Colors.green, Colors.blue, Colors.red);
    allTubes.add(tube1);
    return gameState.State(allTubes);
  }

  String solvePuzzle(gameState.State currentState) {
    String temp = '';
    if (!currentState.isValid()) {
      temp = 'Invalid State';
    } else {
      gameState.State? s2 = currentState.solveNonRecursively();
      if (s2 == null) {
        temp = 'Unsolvable';
      } else {
        temp = s2.printSolutionSteps();
      }
    }

    return temp;
  }

  List<String> puzzleSolutionWithSteps(gameState.State currentState) {
    List<String> solutionSteps = [];
    if (!currentState.isValid()) {
      solutionSteps.add('Invalid State');
    } else {
      gameState.State? s2 = currentState.solveNonRecursively();
      if (s2 == null) {
        solutionSteps.add('Unsolvable');
      } else {
        solutionSteps = s2.printSolutionStepsInArray();
      }
    }

    return solutionSteps;
  }
}
