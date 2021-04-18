class HomeState {}

class InitializedState extends HomeState {}

class DataFetchedState extends HomeState {
  final List<String> data;
  final List<String> favorites;

  DataFetchedState({this.favorites, this.data});

  bool get hasData => data.length > 0;
}

class ErrorState extends HomeState {}

class BusyState extends HomeState {}
