import 'dart:async';
import 'home_state.dart';
import '../services.dart';
import 'home_event.dart';

class HomeModel {
  final StreamController<HomeState> _stateController =
      new StreamController<HomeState>();
  List<String> _names;
  List<String> _favorites;

  //
  Stream<HomeState> get homeState => _stateController.stream;

  void dispatch(HomeEvent event) async {
    if (event is FetchData) {
      await _getData();
    }

    if (event is FetchDataFromFile) {
      await _loadData();
    }

    if (event is AddFavorite) {
      addFavorite(event.name);
      saveFavorites(_favorites);
    }

    if (event is UpdateFavorite) {
      _stateController.add(BusyState());
      await _loadData();
    }
  }

  //
  //

  void addFavorite(String name) {
    !_favorites.contains(name) ? _favorites.add(name) : _favorites.remove(name);
  }

  Future _loadData() async {
    _stateController.add(BusyState());

    try {
      var file = await loadNames();

      _names = file[0];
      _favorites = file[1];

      _stateController
          .add(DataFetchedState(data: _names, favorites: _favorites));
    } catch (exception) {
      _stateController.addError(
          "An error occurred while fetching the data. Please try again refresh the page.");
    }
  }

  Future<void> _getData() async {
    _stateController.add(BusyState());
    await Future.delayed(Duration(seconds: 2));
    _names = await getNames();

    _stateController.add(DataFetchedState(data: _names, favorites: _favorites));
  }
}
