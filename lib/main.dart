import 'package:flutter/material.dart';
import 'package:world_time_app/pages/stack_overflow_clock.dart';
import 'pages/loading.dart';

void main() {
  runApp(App()); // App -> Widget
}

/*
Stateless -> Doesn't change
Stateful -> Changes content, i.e., mutable
*/

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Loading(),
      home: ClockWidget(),
    );
  }
}
