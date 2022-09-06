import 'dart:developer' as dev;
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:water_sort_puzzle/solution/tube.dart';
import 'package:water_sort_puzzle/utils/arrow_paint.dart';
import 'package:water_sort_puzzle/utils/common_widget.dart';
import 'package:water_sort_puzzle/utils/constants.dart';
import 'package:water_sort_puzzle/solution/state.dart' as gameState;
import 'package:water_sort_puzzle/utils/models/fill_bottle%20_color_model.dart';
import 'package:indexed/indexed.dart';

class SolutionOne extends StatefulWidget {
  List<FillBottleColor> bottles;
  final List<String> steps;
  SolutionOne({Key? key, required this.bottles, required this.steps})
      : super(key: key);

  @override
  State<SolutionOne> createState() => _SolutionOneState();
}

class _SolutionOneState extends State<SolutionOne> {
  late final ConfettiController _controllerCenter;
  List<Tube> allTubes = [];
  gameState.State? currentGameState;

  int currentStepIndex = 0;
  List<List<FillBottleColor>> previousSteps = [];
  List<FillBottleColor> displayingBottle = [];

  bool shouldShowNextButton = true;
  bool shouldShowPreviousButton = true;
  final List<GlobalKey> keys = List<GlobalKey>.generate(
      20, (index) => GlobalKey(debugLabel: "key$index"));
  final GlobalKey gridViewBuilderKey = GlobalKey();

  Size? arrowSize;
  Offset? arrowOffset;

  Size _gridViewRenderBoxSize = const Size(0.0, 0.0);
  Offset _gridViewRenderBoxOffset = const Offset(0.0, 0.0);
  Size _bottleRenderBoxSize = const Size(0.0, 0.0);

  Point arrowStartingPoint = const Point(-1.0, -1.0);
  Point arrowEndingPoint = const Point(-1.0, -1.0);

  Color _colorForArrow = emptyColor;
  final double _textPadding = 10.0;

  // ignore: prefer_final_fields
  List<Color> _previousStepArrowColors = [];
  // ignore: prefer_final_fields
  List<Point> _previousStepArrowStartingPoint = [];
  // ignore: prefer_final_fields
  List<Point> _previousStepArrowEndingPoint = [];

  @override
  void initState() {
    prepareBottlesBasedOnStep(currentStepIndex);
    manageSingleStepSolution();

    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                tubeNextAndPrevButton(),
                tubeAddGridView(),
                finishButtonCelebration(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: prevAndNextButton(
              context, shouldShowNextButton ? 'Next' : 'Finish'),
        ));
  }

  SizedBox tubeAddGridView() {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        // Please have a look at this:- https://pub.dev/packages/indexed
        child: Indexer(
          children: [
            Indexed(
                index: 10,
                child: CustomPaint(
                  painter: currentPainter(),
                )),
            Indexed(
              index: 5,
              child: GridView.builder(
                  key: gridViewBuilderKey,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, mainAxisSpacing: 40),
                  itemCount: displayingBottle.length, //widget.bottles.length,
                  itemBuilder: (context, i) {
                    return Stack(
                      key: keys[i],
                      alignment: Alignment.bottomCenter,
                      children: [
                        Baseline(
                          baseline: 95,
                          baselineType: TextBaseline.alphabetic,
                          child: Text('Tube ${i + 1} '),
                        ),
                        SizedBox(
                          child: Image.asset('assets/images/tube.png'),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: bottleBottomFilledColorWithDecoration(
                                _selectedColor(i, 0))),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: bottleFilledColor(_selectedColor(i, 1))),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: bottleFilledColor(_selectedColor(i, 2))),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 44),
                            child: bottleFilledColor(_selectedColor(i, 3))),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Padding tubeNextAndPrevButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                shouldShowPreviousButton
                    ? IconButton(
                        iconSize: 36.0,
                        onPressed: showPreviousStep,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 36,
                        ))
                    : const SizedBox(width: 36),
                Text(
                  'Step ${currentStepIndex + 1}/${widget.steps.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                shouldShowNextButton
                    ? IconButton(
                        iconSize: 36.0,
                        onPressed: showNextStep,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 36,
                        ))
                    : const SizedBox(width: 36),
              ],
            ),
            Text(
              currentStepText(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Color _selectedColor(int currentIndex, int colorIndex) {
    FillBottleColor theBottle =
        displayingBottle[currentIndex]; //widget.bottles[currentIndex];

    // Range error
    // Array length = 4
    // Indexes = 0,1,2,3

    // The colorIndex should be less than theBottle.Colors length
    if (colorIndex < theBottle.colors.length) {
      return theBottle.colors[colorIndex];
    }

    return Colors.transparent;
  }

  SizedBox prevAndNextButton(
    BuildContext context,
    String name,
  ) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
          onPressed: showNextStep,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: kPrimaryColor,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          child: Text(name)),
    );
  }

  void manageSingleStepSolution() {
    if (widget.steps.length == 1) {
      setState(() {
        shouldShowNextButton = false;
        shouldShowPreviousButton = true;
      });
    }
  }

  void prepareBottlesBasedOnStep(int stepIndex) {
    if (stepIndex < widget.steps.length) {
      String aStep = widget.steps[stepIndex];
      List<String> commaSeparatedSteps = aStep.split(',');
      if (commaSeparatedSteps.length == 4) {
        // QIFT (Quarts, Index, FromTube, ToTube)

        int quarts = getQuarts(commaSeparatedSteps);
        int indexOfColor = getIndexOfColor(commaSeparatedSteps);
        int indexOfFromTube = getIndexOfFromTube(commaSeparatedSteps);
        int indexOfToTube = getIndexOfToTube(commaSeparatedSteps);

        // Logic to draw arrow
        fetchPointsForDrawingArrow(indexOfFromTube, indexOfToTube);

        // fetch Color
        Color colorToBeApplied = emptyColor;
        if (indexOfColor < dragColors.length) {
          colorToBeApplied = dragColors[indexOfColor];
          _colorForArrow = colorToBeApplied;
          _previousStepArrowColors.add(colorToBeApplied);
        }

        // fetch From Tube
        if (indexOfFromTube > widget.bottles.length) {
          // dev.log('Index of From Tube is not proper');
          return;
        }

        FillBottleColor fromBottle = widget.bottles[indexOfFromTube];

        // fetch To Tube
        if (indexOfToTube > widget.bottles.length) {
          // dev.log('Index of To Tube is not proper');
          return;
        }

        FillBottleColor toBottle = widget.bottles[indexOfToTube];

        // Remove color From Tube
        for (int i = 0; i < quarts; i++) {
          if (fromBottle.colors.isNotEmpty) {
            fromBottle.colors.removeLast();
          }
        }

        widget.bottles[indexOfFromTube] = fromBottle;

        // Add color to To Tube
        for (int i = 0; i < quarts; i++) {
          if (toBottle.colors.length < 4) {
            toBottle.colors.add(colorToBeApplied);
          }
        }

        widget.bottles[indexOfToTube] = toBottle;

        // Please refer to this link:- https://stackoverflow.com/questions/58389591/how-to-copy-list-values-to-another-list-in-flutter
        List<FillBottleColor> bottlesToBeSaved = [];

        for (int i = 0; i < widget.bottles.length; i++) {
          FillBottleColor theBottle = widget.bottles[i];
          FillBottleColor newlyCreatedBottle = FillBottleColor(
              theBottle.colors.toList(),
              theBottle.size,
              theBottle.indexOfBottle);
          bottlesToBeSaved.add(newlyCreatedBottle);
        }

        previousSteps.add(bottlesToBeSaved);

        setState(() {
          displayingBottle = widget.bottles;
        });
      } else {
        dev.log('There is some error in the solution step');
      }
    }
  }

  int getQuarts(List<String> separatedSteps) {
    if (separatedSteps.isNotEmpty) {
      return int.parse(separatedSteps[0]);
    }

    return 0;
  }

  int getIndexOfColor(List<String> separatedSteps) {
    if (separatedSteps.length > 1) {
      return int.parse(separatedSteps[1]);
    }

    return -1;
  }

  int getIndexOfFromTube(List<String> separatedSteps) {
    if (separatedSteps.length > 2) {
      String fromTube = separatedSteps[2];
      fromTube = fromTube.replaceAll("tube", "");

      return (int.parse(fromTube) - 1);
    }

    return -1;
  }

  int getIndexOfToTube(List<String> separatedSteps) {
    if (separatedSteps.length > 3) {
      String toTube = separatedSteps[3];
      toTube = toTube.replaceAll("tube", "");
      return (int.parse(toTube) - 1);
    }

    return -1;
  }

  void showNextStep() {
    // This should be the end of the game. Show confetti and pop to the screen.
    if (!shouldShowNextButton) {
      _controllerCenter.play();

      Future.delayed(const Duration(seconds: 3), () {
        showBackToSetupPopup(
            'Congratulations! You have solved this puzzle. Now, you will be redirected to setup screen.',
            false);
        resetBottles = true;
      });

      return;
    }

    if (currentStepIndex == (widget.steps.length - 1)) {
      return;
    }

    setState(() {
      currentStepIndex = (currentStepIndex + 1);

      if (currentStepIndex < previousSteps.length) {
        displayingBottle = previousSteps[currentStepIndex];
        showPreviousStepsForArrows();
      } else {
        prepareBottlesBasedOnStep(currentStepIndex);
      }

      if (currentStepIndex > 0) {
        shouldShowPreviousButton = true;
      }

      if (currentStepIndex == (widget.steps.length - 1)) {
        shouldShowNextButton = false;
      }
    });
  }

  void showPreviousStep() {
    if (currentStepIndex == 0) {
      showBackToSetupPopup(
          'Are you sure you want to go back to setup screen?', true);
      resetBottles = false;
      return;
    }

    setState(() {
      if (previousSteps.isNotEmpty) {
        if ((currentStepIndex - 1) < previousSteps.length) {
          currentStepIndex = (currentStepIndex - 1);

          displayingBottle = previousSteps[currentStepIndex];
        }

        if (currentStepIndex == 0) {
          shouldShowPreviousButton = true;
        }

        if (currentStepIndex < widget.steps.length) {
          shouldShowNextButton = true;
        }
      }

      showPreviousStepsForArrows();
    });
  }

  String currentStepText() {
    String currentStepInString = '';

    if (currentStepIndex < widget.steps.length) {
      String aStep = widget.steps[currentStepIndex];
      List<String> commaSeparatedSteps = aStep.split(',');
      if (commaSeparatedSteps.length == 4) {
        // QIFT (Quarts, Index, FromTube, ToTube)
        int quarts = getQuarts(commaSeparatedSteps);
        int indexOfColor = getIndexOfColor(commaSeparatedSteps);
        int indexOfFromTube = getIndexOfFromTube(commaSeparatedSteps);
        int indexOfToTube = getIndexOfToTube(commaSeparatedSteps);

        String theQuart = 'quart';

        if (quarts > 1) {
          theQuart = 'quarts';
        }

        currentStepInString = 'Move ' +
            quarts.toString() +
            ' $theQuart of ' +
            dragColorsNames[indexOfColor].toLowerCase() +
            ' ' +
            'from ' +
            'Tube ' +
            (indexOfFromTube + 1).toString() +
            ' to ' +
            'Tube ' +
            (indexOfToTube + 1).toString() +
            '\n' +
            'Result shown below';
      }
    }

    return currentStepInString;
  }

  ConfettiWidget finishButtonCelebration() {
    return ConfettiWidget(
      confettiController: _controllerCenter,
      blastDirectionality: BlastDirectionality.explosive,
      particleDrag: 0.05,
      emissionFrequency: 0.05,
      numberOfParticles: 50,
      gravity: 0.05,
      shouldLoop: true,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ],
    );
  }

  Future<void> showBackToSetupPopup(
      String title, bool shouldShowCancelButton) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            (shouldShowCancelButton
                ? TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : const SizedBox())
          ],
        );
      },
    );
  }

  ArrowPainter currentPainter() {
    ArrowPainter painter = ArrowPainter();

    painter.startingPointX = arrowStartingPoint.x.toDouble();
    painter.startingPointY = arrowStartingPoint.y.toDouble();
    painter.endingPointX = arrowEndingPoint.x.toDouble();
    painter.endingPointY = arrowEndingPoint.y.toDouble();
    painter.colorToBeApplied = _colorForArrow;
    return painter;
  }

  Point getSizeAndPosition(int indexOfKey) {
    // Do the same for GridView Builder
    //if (_gridViewRenderBoxSize.width == 0.0 &&
    //_gridViewRenderBoxSize.height == 0.0) {
    RenderBox? _gridPath =
        gridViewBuilderKey.currentContext?.findRenderObject() as RenderBox?;

    _gridViewRenderBoxSize = _gridPath?.size ?? const Size(0.0, 0.0);
    _gridViewRenderBoxOffset =
        _gridPath?.localToGlobal(Offset.zero) ?? Offset.zero;
    double x = _gridViewRenderBoxOffset.dx;
    double y = _gridViewRenderBoxOffset.dy;

    if (indexOfKey < keys.length) {
      RenderBox? _arrowPath =
          keys[indexOfKey].currentContext?.findRenderObject() as RenderBox?;

      _bottleRenderBoxSize = _arrowPath?.size ?? const Size(0.0, 0.0);
      arrowOffset = _arrowPath?.localToGlobal(Offset(
          _bottleRenderBoxSize.width / 2.0,
          (-_gridViewRenderBoxOffset.dy +
              _bottleRenderBoxSize.height +
              _textPadding)));

      arrowOffset = _arrowPath?.localToGlobal(Offset(
          _bottleRenderBoxSize.width / 2.0, (-_gridViewRenderBoxOffset.dy)));

      double y = arrowOffset?.dy ?? 0.0;
      double x = arrowOffset?.dx ?? 0.0;

      return Point(x, y);
    }

    return const Point(-1.0, -1.0);
  }

  void fetchPointsForDrawingArrow(int indexOfFromTube, int indexOfToTube) {
    if (indexOfFromTube < widget.bottles.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          arrowStartingPoint = getSizeAndPosition(indexOfFromTube);
          _previousStepArrowStartingPoint.add(arrowStartingPoint);
        });
      });
    }

    if (indexOfToTube < widget.bottles.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          arrowEndingPoint = getSizeAndPosition(indexOfToTube);
          _previousStepArrowEndingPoint.add(arrowEndingPoint);
        });
      });
    }
  }

  void showPreviousStepsForArrows() {
    if (_previousStepArrowStartingPoint.isNotEmpty) {
      if (currentStepIndex < _previousStepArrowStartingPoint.length) {
        arrowStartingPoint = _previousStepArrowStartingPoint[currentStepIndex];
        arrowEndingPoint = _previousStepArrowEndingPoint[currentStepIndex];
        _colorForArrow = _previousStepArrowColors[currentStepIndex];
      }
    }
  }
}
