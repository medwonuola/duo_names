import 'package:duo_names/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class DuoName extends InheritedWidget {
  final Widget child;
  final Names names;

  DuoName({Key key, this.child, this.names}) : super(key: key, child: child);

  static DuoName of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DuoName>();
  }

  @override
  bool updateShouldNotify(DuoName oldWidget) {
    return true;
  }
}