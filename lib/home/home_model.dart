import 'dart:async';
import 'home_state.dart';

import 'home_event.dart';

class HomeModel {
  final StreamController<HomeState> _stateController =
      new StreamController<HomeState>();
  List<String> _names;
  List<String> _favorites;

  //
  Stream<HomeState> get homeState => _stateController.stream;

  void dispatch(HomeEvent event) {
    if (event is FetchData) {}
  }

  //

  Future _loadData() async {}

  Future _getData() async {}
}
