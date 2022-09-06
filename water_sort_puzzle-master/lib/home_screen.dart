import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:water_sort_puzzle/solution/solution.dart';
import 'package:water_sort_puzzle/solution/tube.dart';
import 'package:water_sort_puzzle/solution_one.dart';
import 'package:water_sort_puzzle/utils/common_dialouges.dart';
import 'package:water_sort_puzzle/utils/common_widget.dart';
import 'package:water_sort_puzzle/utils/constants.dart';
import 'package:water_sort_puzzle/utils/models/addNewColorWithName.dart';
import 'package:water_sort_puzzle/utils/models/bottles_model.dart';
import 'dart:developer';

import 'package:water_sort_puzzle/utils/models/fill_bottle%20_color_model.dart';

// ignore: library_prefixes
import 'package:water_sort_puzzle/solution/state.dart' as gameState;

import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RouteAware {
  List<ItemData> listOfBottles = [];
  List<FillBottleColor> listOfFilledBottles = [];
  List<AddColorsWithNameModel> colorsWithName = [];
  final ScrollController controller = ScrollController();
  final TextEditingController colorNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool successfulDrop = false;

  bool isSelected = false;
  bool shouldBeColorRemoveButton = false;
  bool shouldShowRemoveButton = false;
  bool shouldShowAddButton = true;
  List<int> undoArray = [];

  String _color = 'red';
  int selectedColor = 0;
  double scale = 1;

  gameState.State? currentGameState;
  var initialSetup;
  bool isShowingLoader = false;

  void createSimplePuzzle() {
    setState(() {
      FillBottleColor filledBottle = FillBottleColor(
          [Colors.red, Colors.red, Colors.green, Colors.green],
          0.0,
          listOfFilledBottles.length);
      listOfFilledBottles.add(filledBottle);

      filledBottle = FillBottleColor(
          [Colors.green, Colors.green, Colors.red, Colors.red],
          0.0,
          listOfFilledBottles.length);
      listOfFilledBottles.add(filledBottle);

      filledBottle = FillBottleColor([], 0.0, listOfFilledBottles.length);
      listOfFilledBottles.add(filledBottle);
    });
  }

  void createHardPuzzle() {
    FillBottleColor filledBottle = FillBottleColor(
        [Colors.lightGreen, Colors.pink, Colors.greenAccent, Colors.pink],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.pink, Colors.indigo, Colors.blueAccent, Colors.grey],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.green, Colors.orange, Colors.red, Colors.red],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.orange, Colors.green, Colors.blueAccent, Colors.lightBlue],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.indigo, Colors.lightGreen, Colors.lightBlue, Colors.purple],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.yellow, Colors.red, Colors.lightGreen, Colors.pink],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.grey, Colors.yellow, Colors.yellow, Colors.indigo],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.purple, Colors.greenAccent, Colors.lightGreen, Colors.grey],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.grey, Colors.green, Colors.red, Colors.greenAccent],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.purple, Colors.green, Colors.greenAccent, Colors.orange],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.orange, Colors.indigo, Colors.blueAccent, Colors.lightBlue],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.purple, Colors.blueAccent, Colors.lightBlue, Colors.yellow],
        0.0,
        listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor([], 0.0, listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor([], 0.0, listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    setState(() {});
  }

  createSingleStepPuzzle() {
    FillBottleColor filledBottle = FillBottleColor(
        [Colors.green, Colors.green], 0.0, listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    filledBottle = FillBottleColor(
        [Colors.green, Colors.green], 0.0, listOfFilledBottles.length);
    listOfFilledBottles.add(filledBottle);

    setState(() {});
  }

  addBottles() {
    // createSingleStepPuzzle();
    // createSimplePuzzle();
    // createHardPuzzle();
    // return;

    if (listOfFilledBottles.length < 20) {
      setState(() {
        FillBottleColor filledBottle =
            FillBottleColor([], 0.0, listOfFilledBottles.length);
        listOfFilledBottles.add(filledBottle);
      });
    }

    if (listOfFilledBottles.length == 20) {
      setState(() {
        Future.delayed(const Duration(microseconds: 10), () {
          CommonDialogues()
              .showPopup(context, 'Maximum number of tubes reached.', false);
        });
        shouldShowAddButton = false;
      });
    }
  }

  removeBottles() {
    if (listOfFilledBottles.isNotEmpty) {
      setState(() {
        listOfFilledBottles.removeLast();
      });
    }

    if (listOfFilledBottles.isEmpty) {
      setState(() {
        shouldShowRemoveButton = false;
      });
    }

    if (listOfFilledBottles.length < 20) {
      setState(() {
        shouldShowAddButton = true;
      });
    }
  }

  removeLastColors() {
    // Get last index from UndoArray
    // Fetch that bottle from listOfFilledBottles
    // Remove last color from that bottle
    // Remove last index from UndoArray

    if (undoArray.isNotEmpty) {
      int indexToBeRemoved = undoArray[undoArray.length - 1];
      if (indexToBeRemoved < listOfFilledBottles.length) {
        FillBottleColor filledBottle = listOfFilledBottles[indexToBeRemoved];
        setState(() {
          if (filledBottle.colors.isNotEmpty) {
            filledBottle.colors.removeLast();
          }
          undoArray.removeLast();
        });
      }
      return;
    } else {
      CommonDialogues().showPopup(context, 'Nothing to undo', false);
    }
  }

  resetAllTubes() {
    if (listOfFilledBottles.isNotEmpty) {
      setState(() {
        listOfFilledBottles.clear();
        undoArray.clear();
        shouldShowRemoveButton = false;
        shouldShowAddButton = true;
      });
    }
    // else {
    //   CommonDialogues().showPopup(context, 'Please add tubes', false);
    // }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    if (resetBottles) {
      setState(() {
        resetAllTubes();
      });
    }

    // Load Addresses again.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          leading: TextButton(
            onPressed: resetTubesConformation,
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(widget.title),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: removeLastColors,
                child: const Text(
                  'Undo',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                tubeIncrementAndDecrement(),
                tubeAddGridView(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: colorsDragOnScreen());
  }

  Padding tubeIncrementAndDecrement() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            shouldShowRemoveButton
                ? IconButton(
                    onPressed: () {
                      removeBottles();
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 36,
                    ))
                : Container(),
            const Text(
              'TUBE',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            shouldShowAddButton
                ? IconButton(
                    onPressed: () {
                      addBottles();
                      setState(() {
                        shouldShowRemoveButton = true;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 36,
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  SizedBox tubeAddGridView() {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisSpacing: 25),
            itemCount: listOfFilledBottles.length,
            itemBuilder: (context, i) {
              return DragTarget<Color>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/images/tube.png',
                        ),
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
                },
                onAccept: (data) {
                  // print('hi $data');
                  FillBottleColor theBottle = listOfFilledBottles[i];
                  if (theBottle.colors.length < 4) {
                    setState(() {
                      FillBottleColor theBottle = listOfFilledBottles[i];

                      if (theBottle.colors.length < 4) {
                        theBottle.colors.add(data);
                        undoArray.add(i);
                      }
                    });
                  } else {
                    CommonDialogues().showPopup(
                        context, 'Only 4 colors are allowed in a tube.', false);
                  }
                },
                onWillAccept: (data) {
                  // log('check color Accepted  ${data}');
                  // setState(() {
                  //   scale = scale == 1 ? 1.5 : 1;
                  // });
                  return true;

                  //return false;

                  //return data == dragColors[i];
                },
              );
            }),
      ),
    );
  }

  Padding colorsDragOnScreen() {
    // String solution = Solution().solvePuzzle(currentGameState);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            solveButton(context, isShowingLoader, (value) async {
              // log('IN THE SOLUTION');

              List<Tube> listOfTubes = [];
              for (int i = 0; i < listOfFilledBottles.length; i++) {
                FillBottleColor aBottle = listOfFilledBottles[i];
                aBottle.prepareTube();
                if (aBottle.tube != null) {
                  listOfTubes.add(aBottle.tube!);
                }
              }

              List<String> solutionSteps = [];

              if (listOfTubes.isEmpty) {
                CommonDialogues().showPopup(context, 'There is no tube', false);
                return;
              }

              loadingOnDisplay();

              Future.delayed(const Duration(milliseconds: 300), () {
                if (listOfTubes.isNotEmpty) {
                  currentGameState = Solution().initializePuzzle(listOfTubes);
                  if (currentGameState != null) {
                    //String solution = Solution().solvePuzzle(currentGameState!);
                    //log('THE SOLUTION IS $solution');

                    solutionSteps =
                        Solution().puzzleSolutionWithSteps(currentGameState!);
                    // log('THE SOLUTION STEPS ARE $solutionSteps');

                    if (solutionSteps.isEmpty) {
                      Navigator.of(context).pop();
                      CommonDialogues()
                          .showPopup(context, 'No solution available', false);
                      // log('No solution available');
                      return;
                    }

                    if (solutionSteps.length == 1) {
                      String aSolution = solutionSteps[0];
                      if (aSolution == 'Invalid State') {
                        Navigator.of(context).pop();
                        CommonDialogues().showPopup(
                            context, 'Puzzle is in invalid state.', false);

                        // log('Puzzle is in invalid state');
                        return;
                      }

                      if (aSolution == 'Unsolvable') {
                        setState(() {
                          isShowingLoader = false;
                        });
                        Navigator.of(context).pop();
                        CommonDialogues().showPopup(
                            context,
                            'Puzzle is not solvable. Try adding an empty tube.',
                            false);
                        // log('Puzzle is not solvable');
                        return;
                      }
                    }

                    for (int i = 0; i < solutionSteps.length; i++) {
                      String aSolution = solutionSteps[i];
                      // log('Single Solution is $aSolution');
                    }
                  }

                  setState(() {
                    isShowingLoader = false;
                  });

                  Navigator.of(context).pop();

                  List<FillBottleColor> currentFilledBottles = [];

                  for (int i = 0; i < listOfFilledBottles.length; i++) {
                    FillBottleColor theBottle = listOfFilledBottles[i];
                    FillBottleColor newlyCreatedBottle = FillBottleColor(
                        theBottle.colors.toList(),
                        theBottle.size,
                        theBottle.indexOfBottle);
                    currentFilledBottles.add(newlyCreatedBottle);
                  }

                  //listOfFilledBottles.toList();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SolutionOne(
                                bottles: currentFilledBottles,
                                steps: solutionSteps,
                              )));
                }
              });
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/plate.png'),
                    ),
                  ),
                ),
                isSelected
                    ? Row(
                        children: [
                          SizedBox(
                            height: 90,
                            width: MediaQuery.of(context).size.width - 120,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 8,
                                ),
                                // scrollDirection: Axis.horizontal,
                                itemCount: 16, //dragColors.length,
                                // controller: controller,
                                // shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return Row(
                                    children: [
                                      (i < dragColors.length)
                                          ? Draggable<Color>(
                                              //   // Data is the value this Draggable stores.
                                              //
                                              data: dragColors[i],
                                              child: Container(
                                                height: 30.0,
                                                width: 30.0,
                                                //color: dragColors[i],
                                                decoration: BoxDecoration(
                                                  color: dragColors[i],
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              feedback: Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    color: dragColors[i],
                                                    shape: BoxShape.circle),
                                              ),

                                              //New
                                              childWhenDragging: Container(
                                                height: 30.0,
                                                width: 30.0,
                                                color: dragColors[i],
                                              ),
                                            )
                                          : Container(
                                              height: 30.0,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                color: emptyColor,
                                                border: Border.all(
                                                    color: Colors.white),
                                              ),
                                            ),
                                    ],
                                  );
                                }),
                          ),
                        ],
                      )
                    : Container(),
                isSelected
                    ? Padding(
                        padding: const EdgeInsets.only(
                          bottom: 25,
                        ),
                        child: Container(
                          height: 64,
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: addColorsInList,
                                child: const Icon(
                                  Icons.add_circle,
                                  size: 30,
                                ),
                              ),
                              shouldBeColorRemoveButton
                                  ? GestureDetector(
                                      onTap: removeColorOfList,
                                      child: const Icon(
                                        Icons.remove_circle,
                                        size: 30,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _selectedColor(int currentIndex, int colorIndex) {
    FillBottleColor theBottle = listOfFilledBottles[currentIndex];

    // Range error
    // Array length = 4
    // Indexes = 0,1,2,3

    // The colorIndex should be less than theBottle.Colors length
    if (colorIndex < theBottle.colors.length) {
      return theBottle.colors[colorIndex];
    }

    return Colors.transparent;
  }

  Future addColorsInList() {
    Color theColor = Colors.red;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
                child: ColorPicker(
              pickerColor: Colors.red, //default color
              onColorChanged: (Color color) {
                theColor = color;
                // print('****** my chosen Color$theColor');
              },
            )),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Please enter color name'),
                            content: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: colorNameController,
                                validator: (color) {
                                  if (color == null || color.isEmpty) {
                                    return 'Please enter color name';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (dragColorsNames
                                          .contains(colorNameController.text)) {
                                        CommonDialogues().showPopup(
                                            context,
                                            'This color name is already used. Please enter another name',
                                            false);
                                        // 'This color name is already used. Please enter another name';
                                        return;
                                      }

                                      setState(() {
                                        if (!dragColors.contains(theColor)) {
                                          if (dragColors.length < 16) {
                                            dragColors.add(theColor);
                                            dragColorsNames
                                                .add(colorNameController.text);
                                            manageRemoveColorButton();
                                          }
                                          CommonDialogues().showPopup(
                                              context,
                                              'This color is already used. Please select  another colors',
                                              false);
                                        }

                                        if (dragColors.length == 16) {
                                          setState(() {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 10), () {
                                              CommonDialogues().showPopup(
                                                  context,
                                                  'Maximum number of colors reached.',
                                                  false);
                                            });
                                          });
                                        }
                                        Navigator.of(context).pop();
                                        colorNameController.clear();
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  },
                                  child: const Text('Done'))
                            ]);
                      });

                  //dismiss the color picker
                },
                child: const Text('DONE'),
              ),
            ],
          );
        });
  }

  Future resetTubesConformation() {
    if (listOfFilledBottles.isEmpty) {
      return CommonDialogues().showPopup(context, 'Nothing to reset', false);
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Are you sure you want to reset? It will remove all the tubes.',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    resetAllTubes();
                  });
                },
                child: const Text('Yes'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Future<void> loadingOnDisplay() {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Center(
              child: Text(
                'Please wait, we are preparing a solution',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          );
        });
  }

  removeColorOfList() {
    if (listOfFilledBottles.isNotEmpty) {
      CommonDialogues().showPopup(
          context,
          'Color cannot be removed if there is any tube present on the screen. Please reset first.',
          false);
      return;
    }

    if (dragColors.isNotEmpty &&
        dragColorsNames.isNotEmpty &&
        dragColors.length > 4 &&
        dragColorsNames.length > 4) {
      setState(() {
        dragColors.removeLast();
        dragColorsNames.removeLast();

        manageRemoveColorButton();
      });
    }
  }

  manageRemoveColorButton() {
    shouldBeColorRemoveButton = true;

    if (dragColors.length <= 4) {
      shouldBeColorRemoveButton = false;
    }
  }
}
