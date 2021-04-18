import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Names {
  Names() {
    loadNames();
  }

  List<String> _names = List.generate(
      100, (index) => WordPair.random(maxSyllables: 2).asPascalCase);

  List<String> _favorites = [];

  List<String> get names => _names;

  List<String> get favorites => _favorites;

  bool isFav(name) {
    return _favorites.contains(name);
  }

  Future<void> getNames() async {
    await Future.delayed(Duration(seconds: 2));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    _names = List.generate(
        100, (index) => WordPair.random(maxSyllables: 2).asPascalCase);
    prefs.setStringList('names', names);
  }

  void addFavorites(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    !isFav(name) ? _favorites.add(name) : _favorites.remove(name);
    prefs.setStringList('favorites', _favorites);
  }

  Future loadNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _names = prefs.getStringList('names') ?? [];
    _favorites = prefs.getStringList('favorites') ?? [];

    if (names.isEmpty) getNames();
  }
}

//
// class Names {
//   Names() {
//     loadNames();
//   }
//
//   List<String> _names;
//   List<String> _favorites;
//
//   List<String> get names => _names;
//
//   List<String> get favorites => _favorites;
//
//   bool isFav(name) {
//     return _favorites.contains(name);
//   }
//
//   Future<void> getNames() async {
//     await Future.delayed(Duration(seconds: 2));
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     _names = List.generate(
//         100, (index) => WordPair.random(maxSyllables: 2).asPascalCase);
//     prefs.setStringList('names', names);
//
//   }
//
//   void addFavorites(String name) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     !isFav(name) ? _favorites.add(name) : _favorites.remove(name);
//     prefs.setStringList('favorites', _favorites);
//   }
//
//   Future loadNames() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     _names = prefs.getStringList('names') ?? [];
//     _favorites = prefs.getStringList('favorites') ?? [];
//
//     if (names.isEmpty) getNames();
//   }
// }
