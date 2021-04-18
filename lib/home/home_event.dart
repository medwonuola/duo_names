class HomeEvent {}

class FetchData extends HomeEvent {
  final bool newData;

  FetchData(this.newData);

  @override
  String toString() {
    return newData ? "New data" : "Fetched from saved data";
  }
}
