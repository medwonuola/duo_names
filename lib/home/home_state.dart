class HomeState {}

class InitializedState extends HomeState {}

class DataFetchedState extends HomeState {
  final List<String> data;

  DataFetchedState({this.data});

  bool get hasData => data.length > 0;
}

class ErrorState extends HomeState {}

class BusyState extends HomeState {}
