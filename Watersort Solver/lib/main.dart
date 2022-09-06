import 'package:flutter/material.dart';
import 'package:water_sort_puzzle/home_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() {
  runApp(const MyApp());
}

// bool shouldUseUpdated = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Sort Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Puzzle Setup'),
      navigatorObservers: [routeObserver],
      //
      // (shouldUseUpdated
      //     ? const MyHomePage(title: 'Water Sort Puzzle')
      //     : const AllInOneHomePage(title: 'Checking Algo')),
    );
  }
}
