import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:collection';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _initial_setup = '';
  String _solution = '';
  var _initialState;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  State2 Simple() {
    List<Tube> allTubes = [];
    allTubes.clear();
    Tube tube1 = new Tube(
        "tube1", Colors2.GREEN, Colors2.GREEN, Colors2.RED, Colors2.RED);
    allTubes.add(tube1);
    Tube tube2 = new Tube(
        "tube2", Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY);
    allTubes.add(tube2);
    Tube tube3 = new Tube(
        "tube3", Colors2.RED, Colors2.RED, Colors2.GREEN, Colors2.GREEN);
    allTubes.add(tube3);
    // reset static variables
    State2.Id = 1;
    State2.SetStates.clear();

    return new State2(allTubes);
  }

  State2 unsolvable2() {
    List<Tube> allTubes = [];
    allTubes.clear();
    Tube tube1 = new Tube(
        "tube1", Colors2.PURPLE, Colors2.INDIGO, Colors2.YELLOW, Colors2.GREY);
    allTubes.add(tube1);
    Tube tube2 = new Tube("tube2", Colors2.ORANGE, Colors2.YELLOW,
        Colors2.DARK_GREEN, Colors2.RED);
    allTubes.add(tube2);
    Tube tube3 = new Tube("tube3", Colors2.GREEN, Colors2.LIGHT_BLUE,
        Colors2.ORANGE, Colors2.YELLOW);
    allTubes.add(tube3);
    Tube tube4 = new Tube("tube4", Colors2.GREEN, Colors2.ORANGE,
        Colors2.DARK_BLUE, Colors2.ORANGE);
    allTubes.add(tube4);
    Tube tube5 = new Tube(
        "tube5", Colors2.RED, Colors2.DARK_GREEN, Colors2.INDIGO, Colors2.PINK);
    allTubes.add(tube5);
    Tube tube6 = new Tube("tube6", Colors2.LIGHT_BLUE, Colors2.LIGHT_GREEN,
        Colors2.PURPLE, Colors2.DARK_GREEN);
    allTubes.add(tube6);
    Tube tube7 = new Tube("tube7", Colors2.PURPLE, Colors2.DARK_GREEN,
        Colors2.GREEN, Colors2.PURPLE);
    allTubes.add(tube7);
    Tube tube8 = new Tube("tube8", Colors2.DARK_BLUE, Colors2.DARK_BLUE,
        Colors2.LIGHT_BLUE, Colors2.DARK_BLUE);
    allTubes.add(tube8);
    Tube tube9 = new Tube("tube9", Colors2.LIGHT_GREEN, Colors2.RED,
        Colors2.PINK, Colors2.YELLOW);
    allTubes.add(tube9);
    Tube tube10 = new Tube(
        "tube10", Colors2.PINK, Colors2.PINK, Colors2.INDIGO, Colors2.INDIGO);
    allTubes.add(tube10);
    Tube tube11 = new Tube("tube11", Colors2.GREY, Colors2.GREY,
        Colors2.LIGHT_BLUE, Colors2.LIGHT_GREEN);
    allTubes.add(tube11);
    Tube tube12 = new Tube("tube12", Colors2.GREY, Colors2.RED, Colors2.GREEN,
        Colors2.LIGHT_GREEN);
    allTubes.add(tube12);
    Tube tube13 = new Tube(
        "tube13", Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY);
    allTubes.add(tube13);
    Tube tube14 = new Tube(
        "tube14", Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY);
    //allTubes.add(tube14);

    // reset static variables
    State2.Id = 1;
    State2.SetStates.clear();

    return new State2(allTubes);
  }

  State2 Puzzle624() {
    List<Tube> allTubes = [];
    Tube tube1 = new Tube("tube1", Colors2.LIGHT_GREEN, Colors2.PINK,
        Colors2.DARK_GREEN, Colors2.PINK);
    allTubes.add(tube1);
    Tube tube2 = new Tube(
        "tube2", Colors2.PINK, Colors2.INDIGO, Colors2.DARK_BLUE, Colors2.GREY);
    allTubes.add(tube2);
    Tube tube3 = new Tube(
        "tube3", Colors2.GREEN, Colors2.ORANGE, Colors2.RED, Colors2.RED);
    allTubes.add(tube3);
    Tube tube4 = new Tube("tube4", Colors2.ORANGE, Colors2.GREEN,
        Colors2.DARK_BLUE, Colors2.LIGHT_BLUE);
    allTubes.add(tube4);
    Tube tube5 = new Tube("tube5", Colors2.INDIGO, Colors2.LIGHT_GREEN,
        Colors2.LIGHT_BLUE, Colors2.PURPLE);
    allTubes.add(tube5);
    Tube tube6 = new Tube("tube6", Colors2.YELLOW, Colors2.RED,
        Colors2.LIGHT_GREEN, Colors2.PINK);
    allTubes.add(tube6);
    Tube tube7 = new Tube(
        "tube7", Colors2.GREY, Colors2.YELLOW, Colors2.YELLOW, Colors2.INDIGO);
    allTubes.add(tube7);
    Tube tube8 = new Tube("tube8", Colors2.PURPLE, Colors2.DARK_GREEN,
        Colors2.LIGHT_GREEN, Colors2.GREY);
    allTubes.add(tube8);
    Tube tube9 = new Tube(
        "tube9", Colors2.GREY, Colors2.GREEN, Colors2.RED, Colors2.DARK_GREEN);
    allTubes.add(tube9);
    Tube tube10 = new Tube("tube10", Colors2.PURPLE, Colors2.GREEN,
        Colors2.DARK_GREEN, Colors2.ORANGE);
    allTubes.add(tube10);
    Tube tube11 = new Tube("tube11", Colors2.ORANGE, Colors2.INDIGO,
        Colors2.DARK_BLUE, Colors2.LIGHT_BLUE);
    allTubes.add(tube11);
    Tube tube12 = new Tube("tube12", Colors2.PURPLE, Colors2.DARK_BLUE,
        Colors2.LIGHT_BLUE, Colors2.YELLOW);
    allTubes.add(tube12);
    Tube tube13 = new Tube(
        "tube13", Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY);
    allTubes.add(tube13);
    Tube tube14 = new Tube(
        "tube14", Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY, Colors2.EMPTY);
    allTubes.add(tube14);

    // reset static variables
    State2.Id = 1;
    State2.SetStates.clear();

    return new State2(allTubes);
  }

  void _setup1() {
    _initialState = Simple();
    //_initialState = Puzzle624();
    //_initialState = unsolvable2();

    setState(() {
      _initial_setup = _initialState.draw2();
    });
  }

  void _setup2() {
    //_initialState = Simple();
    _initialState = Puzzle624();
    //_initialState = unsolvable2();

    setState(() {
      _initial_setup = _initialState.draw2();
    });
  }

  void _setup3() {
    //_initialState = Simple();
    //_initialState = Puzzle624();
    _initialState = unsolvable2();

    setState(() {
      _initial_setup = _initialState.draw2();
    });
  }

  void _solve() {
    String temp = '';
    if (!_initialState.isValid()) {
      temp = 'Invalid State';
    } else {
      State2? s2 = _initialState.solve_nonrecursive();
      if (s2 == null) {
        temp = 'Unsolvable??';
      } else {
        temp = s2.printsolutionSteps2();
      }
    }
    setState(() {
      _solution = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              /* const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
          */
              Text(
                '$_initial_setup',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(child: Text('TestSetup1'), onPressed: _setup1),
                    TextButton(child: Text('TestSetup2'), onPressed: _setup2),
                    TextButton(child: Text('TestSetup3'), onPressed: _setup3),
                  ]),
              TextButton(child: Text('Solve'), onPressed: _solve),
              Text(
                '$_solution',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Colors2 {
  dummy0,
  dummy1,
  dummy2,
  dummy3,
  dummy4,
  dummy5,
  dummy6,
  dummy7,
  dummy8,
  dummy9,
  EMPTY, //(10,"10", "\u001b[48;5;231m"),
  PURPLE, //(11,"11", "\u001b[48;5;13m"),
  GREY, //(12,"12", "\u001b[48;5;245m"),
  GREEN, //(13,"13","\u001b[48;5;10m"),
  LIGHT_GREEN, //(14,"14","\u001b[48;5;84m"),
  DARK_GREEN, //(15,"15","\u001b[48;5;28m"), //lets do black as dark-green
  BLUE, //(16,"16","\u001b[48;5;14m"),
  DARK_BLUE, //(17,"17","\u001b[48;5;20m"),
  LIGHT_BLUE, //(18,"18","\u001b[48;5;87m"),
  RED, //(19,"19","\u001b[48;5;1m"),
  INDIGO, //(20,"20","\u001b[48;5;56m"),
  YELLOW, //(21,"21","\u001b[48;5;226m"),
  ORANGE, //(22,"22","\u001b[48;5;202m"),
  PINK, //(23,"23","\u001b[48;5;219m"),
  INVALID, //(24,"24",""),
  RESET, //(25,"25","\u001B[0m"),
  IN_GREEN2, //(26,"26","\u001b[48;5;77m"),
  OUT_RED2, //(27,"27","\u001b[48;5;129m"),
  IN_GREEN, //(28,"28",""),
  OUT_RED, //(29,"29","");

  //\u001B[107m - grey??
/*
    int value;
    String strValue;
    String ANSI_color;

    Colors(int value, String strValue1, String strColor) {
        this.value = value;
        this.strValue = strValue1;
        this.ANSI_color = strColor;
    }

    public int getValue() {
        return value;
    }
    public String getStrValue() {
        return strValue;
    }

    public String ansiColor() {
        return ANSI_color;
    }
    */
}

class Tube {
  var Name;
  final int FULL = -1;
  List<Colors2> tubeContents = [];
  var stringId;
  var intId;

  Tube(var name, Colors2 color1, Colors2 color2, Colors2 color3,
      Colors2 color4) //assigns colors to positions
  {
    tubeContents = new List<Colors2>.from([color1, color2, color3, color4]);
    //tubeContents.add(color1);
    //tubeContents.add(color2);
    //tubeContents.add(color3);
    //tubeContents.add(color4);
    this.Name = name;
    //this.makeStringId();
    //this.makeIntId();
    intId = int.parse(tubeContents[0].index.toString() +
        tubeContents[1].index.toString() +
        tubeContents[2].index.toString() +
        tubeContents[3].index.toString());
  } //Tube constructor

  bool tubeDone() {
    int firstColor = this.tubeContents[0].index;
    for (int idx = 1; idx < tubeContents.length; idx++) {
      if (tubeContents[idx].index != firstColor) {
        return false;
      }
    }
    return true;
  }

/*
    public void makeStringId()
    {
        //String s = "";
        StringBuilder s = new StringBuilder(30);
        for (int i =0;i<tubeContents.size();++i)
        {
            //s = s+"-"+tubeContents.get(i);
            s.append(tubeContents.get(i) + "-");
        }
        this.stringId = s.toString();
    }

    public void makeIntId()
    {
        //String s = "";
        StringBuilder s = new StringBuilder(30);
            //s = s+"-"+tubeContents.get(i);
        s.append(tubeContents.get(0).getStrValue());
        s.append(tubeContents.get(1).getStrValue());
        s.append(tubeContents.get(2).getStrValue());
        s.append(tubeContents.get(3).getStrValue());

        this.intId = Integer.parseInt(s.toString());
    }
*/
  String draw2() {
    var buffer = new StringBuffer();
    buffer.write(this.Name);
    buffer.write("-------");

    //System.out.print(this.Name + "-------");
    for (int i = 0; i < tubeContents.length; i++) {
      //System.out.print(" |  " + tubeContents.get(i));
      buffer.write(" |  ");
      buffer.write(tubeContents[i].name);
    }
    buffer.write('\r\n');
    //System.out.println();
    return buffer.toString();
  }

  /*
    public String drawQuart(int quartNumber)
    {
        return (this.tubeContents.get(quartNumber).ansiColor() + "___" + Colors.RESET.ansiColor());
    }

  
    void draw()
    {
        System.out.println(this.Name);
        for (int i = tubeContents.size()-1; i>=0; i-- )
        {
            System.out.println("|  " + tubeContents.get(i));
        }
        System.out.println();
    }
*/
  bool push(Colors2 newColor, bool mock) {
    int slot = this.firstEmptySlot();
    if (slot == FULL) return false;
    if (slot != 0 && tubeContents[slot - 1] != newColor) return false;
    if (!mock) {
      tubeContents[slot] = newColor;
      //this.makeStringId();
      //this.makeIntId();
      this.intId = int.parse(tubeContents[0].index.toString() +
          tubeContents[1].index.toString() +
          tubeContents[2].index.toString() +
          tubeContents[3].index.toString());
    }
    return true;
  }

  Colors2 pop(bool mock) {
    Colors2 popColor;
    int slot = this.firstEmptySlot();
    if (slot != 0) {
      if (slot != FULL)
        popColor = tubeContents[slot - 1];
      else
        popColor = tubeContents[tubeContents.length - 1];

      if (!mock) {
        if (slot != FULL) tubeContents[slot - 1] = Colors2.EMPTY;
        if (slot == FULL) tubeContents[tubeContents.length - 1] = Colors2.EMPTY;
        //this.makeStringId();
        //this.makeIntId();
        this.intId = int.parse(tubeContents[0].index.toString() +
            tubeContents[1].index.toString() +
            tubeContents[2].index.toString() +
            tubeContents[3].index.toString());
      }
      return popColor;
    }
    return Colors2.EMPTY;
  }

  //returns FULL if tube is full, otherwise returns index of first empty slot
  int firstEmptySlot() {
    for (int idx = 0; idx < tubeContents.length; idx++) {
      if (tubeContents[idx] == Colors2.EMPTY) {
        return idx;
      }
    }
    return FULL;
  }

  bool IsEssentiallySameAs(Tube second) {
    int size = this.tubeContents.length;
    if (size != second.tubeContents.length) return false;

    for (int i = 0; i < size; i++) {
      if (this.tubeContents[i].index != second.tubeContents[i].index)
        return false;
    }
    return true;
  }

  static Tube deepClone(Tube oldTube) {
    Tube newTube = new Tube(
        oldTube.Name,
        oldTube.tubeContents[0],
        oldTube.tubeContents[1],
        oldTube.tubeContents[2],
        oldTube.tubeContents[3]);
    return newTube;
  }
}

class Step {
  var fromTube;
  var toTube;
  Colors2 col = Colors2.INVALID;
  int quarts = 0;

  Step(Tube from, Tube to, Colors2 color, int q) {
    this.fromTube = from;
    this.toTube = to;
    this.col = color;
    this.quarts = q;
  }

  int Quarts() {
    return this.quarts;
  }

  Colors2 Color() {
    return this.col;
  }

  Tube FromTube() {
    return this.fromTube;
  }

  Tube ToTube() {
    return this.toTube;
  }

  String ToStr2() {
    var s = new StringBuffer();
    s.write(this.quarts);
    s.write(" quart(s) of ");
    s.write(this.col.name);
    s.write("  ");
    s.write(" from ");
    s.write(this.fromTube.Name);
    s.write(" to ");
    s.write(this.toTube.Name);
    return s.toString();
  }

  String ToStr() {
    String BOLD = "\033[1;97m";
    String UNDERLINE = "\033[4;30m";

    //StringBuilder s = new StringBuilder();
    var s = new StringBuffer();

    s.write(BOLD);
    s.write(UNDERLINE);
    s.write(this.quarts);
    s.write(" quart(s) of ");
    //s.write(this.col.ansiColor());
    s.write("  ");
    //s.write(Colors2.RESET.ansiColor());
    s.write(BOLD);
    s.write(UNDERLINE);
    s.write("(");
    s.write(this.col);
    s.write(") from ");
    s.write(this.fromTube.Name);
    s.write(" to ");
    s.write(this.toTube.Name);
    //s.write(Colors2.RESET.ansiColor());
    return s.toString();

    //return "\033[1;97m\033[4;30m" +this.quarts + " quart(s) of " + this.col.ansiColor() + "    " +Colors.RESET.ansiColor() + "\033[1;97m\033[4;30m" +
    //"(" + this.col + ") from " + this.fromTube.Name + " to " + this.toTube.Name+Colors.RESET.ansiColor();
  }
}

class State2 {
  //static ArrayList<String> ssteps = new ArrayList<String>();
  //static List<String> ssteps = new List<String>();
  //List<String> steps;
  var steps;
  var states;
  //List<State2> states;
  static int Id = 1;
  //String IdPath;
  var IdPath;
  //int id;
  var id;
  //State2 prevState;
  State2? prevState;
  State2? nextState;
  //private String prevStep;
  //Step pStep;
  var pStep;
  //private static int counter = 1;
  int depth = 0;
  var stringId;
  //private static boolean isRecursive = false;
  //ArrayList<Integer> id2;
  List<int> id2 = [];
  StringBuffer s = new StringBuffer();

  final int FULL = -1;
  //static bool DONE = false;
  //public ArrayList<Tube> allTubes = new ArrayList<Tube>();
  List<Tube> allTubes = [];
  //private static ArrayList<State2> wip_states = new ArrayList<State2>(100000);

  List<State2> wip_states = [];
  //private static ArrayList<State2> discardPile = new ArrayList<State2>(100000);
  //private static HashSet<String> SetStates = new HashSet<String>();
  static HashSet<String> SetStates = new HashSet<String>();

  State2(List<Tube> allTubes) {
    this.allTubes = allTubes;
    //steps = new List<String>();
    steps = List<String>.empty(growable: true);
    //steps=new List<String>;
    //states = new ArrayList<State2>();
    states = List<State2>.empty(growable: true);
    this.id = Id++;
    this.prevState = null;
    this.nextState = null;
    //this.prevStep = null;
    this.IdPath = this.id.toString();
    this.depth = 0;
    //this.id2 = List<int>.empty(growable: true);
    //this.s = new StringBuilder(720);
    this.s = new StringBuffer();
    this.makeStringId();
    this.pStep = null;
  }

  State2.fromState2(State2 prevState) {
    //steps = new ArrayList<String>();
    steps = List<String>.empty(growable: true);
    //states = new ArrayList<State2>();
    states = List<State2>.empty(growable: true);
    //ArrayList<Tube> allTubesLocal = prevState.getTubes();
    List<Tube> allTubesLocal = prevState.getTubes();
    for (int i = 0; i < allTubesLocal.length; i++) {
      Tube tempTube = Tube.deepClone(allTubesLocal.elementAt(i));
      this.allTubes.add(tempTube);
    }
    this.id = Id++;
    this.prevState = prevState;
    prevState.nextState = this;
    this.IdPath = prevState.IdPath + "-" + this.id.toString();
    this.depth = prevState.depth + 1;
    //this.id2 = new ArrayList<Integer>(15);
    //this.id2 = List<int>.empty(growable: true);
    //this.s = new StringBuilder(720);
    this.s = new StringBuffer();
    this.makeStringId();
    this.pStep = null;
  }

  void makeStringId() {
    id2.clear();
    //String deb = "";
    for (int i = 0; i < this.allTubes.length; i++) {
      //id2.add(this.allTubes[i].stringId);
      id2.add(this.allTubes[i].intId);
      //deb += this.allTubes.get(i).stringId;
    }
    //java.util.Collections.sort(id2);
    id2.sort();

    this.s.clear();
    for (int i = 0; i < id2.length; i++) {
      //s.concat(id2.get(i)+"-");
      s.write(id2[i].toString());
    }
    this.stringId = s.toString();

    //System.out.println(deb);
    //System.out.println(s);
    //System.out.println();
  }

  bool IsEssentiallySameAs(State2 second) {
    //if (second == null)
    //    return false;

    return (this.stringId.equals(second.stringId));
    //    return true;
/*
        for (int i=id2.size()-1;i>=0;++i)
        {
            if (this.id2.get(i) != second.id2.get(i))
                return false;
        }
        return true;
*/
    //return false;

    /*
        int size = this.allTubes.size();
        if (size != second.allTubes.size())
            return false;
        
        for (int i=0;i<size;i++)
        {
            if (!this.allTubes.get(i).IsEssentiallySameAs(second.allTubes.get(i)))
                return false;
        }
        return true;
        */
  }

  bool IsEssentiallySameAsPredecessors() {
    State2? prev = this.prevState;
    while (prev != null) {
      if (this.IsEssentiallySameAs(prev)) return true;

      prev = prev.prevState;
    }

    return false;
  }

  bool AmIDone() {
    for (int idx = 0; idx < allTubes.length; idx++) {
      if (allTubes[idx].tubeDone() == false) {
        return false;
      }
    }
    return true;
  }

  List<Tube> getTubes() {
    return this.allTubes;
  }

/*
    void draw_v1()
    {
        System.out.println("** StateId = "+this.id + " (" + this.IdPath + ")");
        for (int i=0; i<allTubes.size(); i++)
        {
            allTubes.get(i).draw2();
        }
    }
*/
/*
    String draw(State2 nextState)
    {        
        var ret = new StringBuffer();
        if (nextState != null)
        {
            for (int i=0; i<nextState.allTubes.length; i++)
            {
                String s = nextState.allTubes[i].Name;
                if (nextState.pStep != null)
                {
                    if (nextState.allTubes[i] == nextState.pStep.FromTube())
                    {
                        //s=Colors.OUT_RED.ansiColor()+s+"(OUT)"+Colors.RESET.ansiColor();
                        s+="(OUT)";
                    }
                    else if (nextState.allTubes[i] == nextState.pStep.ToTube())
                    {
                        //s=Colors.IN_GREEN.ansiColor()+s+"(IN)"+Colors.RESET.ansiColor();;
                        s+="(IN)";
                    }
                }

                ret.write(s);
                //System.out.printf("%-14s", s);
            }
        }
        else
        {
            for (int i=0; i<this.allTubes.length; i++)
            {
                //System.out.printf("%-14s", allTubes.get(i).Name);
                ret.write(allTubes[i].Name);
            }
        }

        ret.write("\r\n");
        
        for (int i=this.allTubes[0].tubeContents.length-1; i>=0; i--)
        {
            for (int j=0; j<this.allTubes.length; j++)
            {
                //System.out.printf("%-10s           ", this.allTubes.get(j).drawQuart(i));
                ret.write(this.allTubes[j].drawQuart(i));
            }
            //System.out.println();
            ret.write("\r\n");
        }

        //System.out.println();
        ret.write("\r\n");
        return ret.toString();
    }
    */
  String draw2() {
    var ret = new StringBuffer();
    for (int i = 0; i < this.allTubes.length; i++) {
      //System.out.printf("%-14s", allTubes.get(i).Name);
      ret.write(allTubes[i].draw2());
    }
    ret.write("\r\n");
    return ret.toString();
  }

  bool canTransfer(Tube fromTube, Tube toTube) {
    if (fromTube == toTube) return false;
    if (toTube.firstEmptySlot() == FULL) return false;

    Colors2 poppedColor = fromTube.pop(true);

    if (poppedColor == Colors2.EMPTY) return false;
    if (!toTube.push(poppedColor, true)) return false;
    return true;
  }

  State2 Transfer(int from, int to) {
    if (from == to) return this;

    State2 newState;
    Colors2 color = Colors2.INVALID;
    int quartsTransferred = 0;
    Tube fromTube = this.allTubes[from];
    Tube toTube = this.allTubes[to];
    bool toTubeEmptyBefore = (toTube.pop(true) == Colors2.EMPTY);

    if (this.canTransfer(fromTube, toTube)) {
      newState = new State2.fromState2(this);
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

    // if more transfers possibble
    while (newState.canTransfer(fromTube, toTube)) {
      color = fromTube.pop(false);
      toTube.push(color, false);
      //this.makeStringId();
      quartsTransferred++;
    }

    if (quartsTransferred > 0) {
      bool fromTubeEmptyAfter = (fromTube.pop(true) == Colors2.EMPTY);

      if (toTubeEmptyBefore && fromTubeEmptyAfter) {
        return this;
      }

      //if (quartsTransferred==4)
      //{
      //    return this;
      //}

      if (color == fromTube.pop(true)) {
        return this;
      }

      newState.makeStringId();
      /*
            //if newstate exists or has been seen before, discard
            for (int i=0; i<discardPile.size();++i)
            {
                if (newState.IsEssentiallySameAs(discardPile.get(i)))
                    return this;
            }

            for (int i=0; i<wip_states.size();++i)
            {
                if (newState.IsEssentiallySameAs(wip_states.get(i)))
                    return this;
            }
            

            // only needed for recursive solition
            if (isRecursive && newState.IsEssentiallySameAsPredecessors())
                return this;
            */

      // check for duplicates
      bool success = SetStates.add(newState.stringId);
      if (!success) return this;

      //State2 newState = new State2();
      newState.pStep = new Step(fromTube, toTube, color, quartsTransferred);
      //String s = newState.pStep.ToStr();
      //newState.steps.add(s);
      //newState.prevStep = s;
      //newState.draw();
      //System.out.println(s);
      //newState.states.add(newState);
      return newState;
    }
    return this;
  }
/*
    String solutionSteps()
    {
        var ret = new StringBuffer();
        this.draw(this);
        for (int i=0;i<this.steps.size();i++)
        {
            //System.out.println();
            //System.out.print("**  STEP."+(i+1)+"  ***************************");
            //System.out.println(this.steps.get(i));

            ret.write("\r\n");
            ret.write("**  STEP.");
            ret.write((i+1).toString());
            ret.write("  ***************************");
            ret.write(this.steps.get(i));


            ret.write(this.states.get(i).draw(this));

        }
        return ret.toString();
    }
*/

  String printsolutionSteps2() {
    List<State2?> prevStates = [];
    List<Step> prevSteps = [];

    State2? st = this;

    while (st != null) {
      prevStates.insert(0, st);
      if (st.pStep != null) {
        prevSteps.insert(0, st.pStep);
      }
      st = st.prevState;
    }

    int counter = 1;
    StringBuffer ret = new StringBuffer();

    for (int i = 0; i < prevSteps.length; ++i) {
      ret.write("**  STEP.");
      ret.write(i + 1);
      ret.write("  ********* ");

      //System.out.println(nextState.pStep.ToStr());
      ret.write(prevSteps[i].ToStr2());
      ret.write("\r\n");
    }

    return ret.toString();
  }

/*
    int printsolutionSteps(bool detailed, State2 nextState)
    {
        int counter = 1;
        var ret = new StringBuffer();

        if (this.prevState != null)
        {
            counter = this.prevState.printsolutionSteps(detailed, this);
        }
        if (nextState != null)
        {
            //System.out.println();
            ret.write("\r\n");
            //System.out.print("**  STEP."+ counter ++ + "  *************************** ");            
            ret.write("**  STEP.");
            ret.write(counter++);
            ret.write("  *************************** ");

            //System.out.println(nextState.pStep.ToStr());  
            ret.write(nextState.pStep.ToStr());          
            ret.write("\r\n");
        }
        else
        {
            //System.out.println("Final State");    
            ret.write("Final State");
        }
        //System.out.println("Path = " + this.IdPath);
        ret.write("Path = ");
        ret.write(this.IdPath);
        

        if (detailed)
            this.draw2(nextState);
        return counter++;
    }
*/
  bool isValid() {
    HashMap ourHashmap = new HashMap<Colors2, int>();
    for (int i = 0; i < this.allTubes.length; ++i) {
      for (int j = 0; j < this.allTubes[i].tubeContents.length; ++j) {
        Colors2 col = this.allTubes[i].tubeContents[j];
        if (col == Colors2.EMPTY) continue;

        if (!ourHashmap.containsKey(col)) ourHashmap.putIfAbsent(col, () => 0);

        //ourHashmap.put(col, ourHashmap.get(col)+1);
        ourHashmap[col] = ourHashmap[col] + 1;
        //ourHashmap.put(col, ourHashmap.get(col)+1);
      }
    }
    /*
        for (HashMap.Entry<Colors,Integer> entry : ourHashmap.entrySet())
        {
            if (entry.getValue() != 4)
            {
                System.out.println("Key = " + entry.getKey().toString() + ", Value = " + entry.getValue());
                return false;
            }
        }
        */

    bool retValue = true;
    ourHashmap.entries.forEach((e) {
      if (e.value != 4) retValue = false;
    });

    if (!retValue) return false;

    /*
        ourHashmap.forEach((k, v) {
          if (v != 4)
          {            
            return false;
          }
        });
     */
    return true;
  }

  State2? solve_nonrecursive() {
    wip_states.clear();
    //discardPile.clear();
    wip_states.add(this);
    SetStates.add(this.stringId);

    //int localdepth = 0;
    int added = 0;
    //int pointer =0;

    //while (pointer < wip_states.size())
    while (wip_states.length > 0) {
      added = 0;
      //localdepth++;
      //State2 s = wip_states[pointer++];
      State2 s = wip_states[0];

      if (s.AmIDone()) {
        return s;
      }

      //discardPile.add(wip_states.get(0));

      // removed this in favor of pointer
      wip_states.removeAt(0);

      //State2 newState = new State2(this);
      for (int i = 0; i < s.allTubes.length; i++) {
        for (int j = 0; j < s.allTubes.length; j++) {
          if (i != j) {
            State2 newState = s.Transfer(i, j);

            if (newState != s) {
              wip_states.add(newState);
              added++;
            }
          }
        }
      }

      //System.out.println("At depth = " + s.depth + " for StateId= "+ s.IdPath + " added " + added + " states *************");
      //System.out.println("current size = " + wip_states.size());

      /*
            if (added >7 && s.depth>766)
            {
                System.out.println("At depth = " + s.depth + " for StateId= "+ s.IdPath + " added " + added + " states *************");
                System.out.println("current size = " + wip_states.size());
                s.draw(this);
                System.out.println();
            }
            */

    }
    return null;
  }

  State2? solve_recursive() {
    //isRecursive = true;

    if (this.AmIDone()) {
      return this;
    }

    SetStates.add(this.stringId);

    //State newState = new State(this);
    for (int i = 0; i < this.allTubes.length; i++) {
      for (int j = 0; j < this.allTubes.length; j++) {
        if (i != j) {
          State2 newState = this.Transfer(i, j);

          if (newState != this) {
            State2? sol = newState.solve_recursive();
            if (sol != null) return sol;
          }
        }
      }
    }

    return null;
  }
}
