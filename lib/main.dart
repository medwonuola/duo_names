import 'package:flutter/material.dart';

import 'home/home.dart';

void main() => runApp(DuoNameApp());

class DuoNameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duo Name',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
