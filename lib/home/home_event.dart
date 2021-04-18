class HomeEvent {}

class FetchDataFromFile extends HomeEvent {
  @override
  String toString() {
    return "Fetched from saved data";
  }
}

class FetchData extends HomeEvent {
  FetchData();

  @override
  String toString() {
    return "New data";
  }
}

class AddFavorite extends HomeEvent {
  final String name;

  AddFavorite(this.name);
}

class UpdateFavorite extends HomeEvent {}
