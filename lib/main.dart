import 'package:flutter/material.dart';
import 'package:spacesly_app/screens/home.dart';

import 'environment_variable.dart';
import 'environment_variable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Environment.textColor,
        accentColor: Environment.textColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
