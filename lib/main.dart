import 'package:flutter/material.dart';
import 'package:myapp/Widgets/GetQuestionWidget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          child: GetQuestion(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  runApp(MyApp());
}
