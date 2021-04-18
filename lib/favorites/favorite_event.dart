class FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final String name;

  AddFavorite(this.name);
}

class FetchData extends FavoritesEvent {}
