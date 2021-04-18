import 'package:duo_names/home.dart';
import 'package:duo_names/model.dart';
import 'package:flutter/material.dart';

void main() => runApp(DuoNameApp());

class DuoNameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duo Name',
      home: DuoName(
        names: Names(),
        child: Home(),
      ),
    );
  }
}
